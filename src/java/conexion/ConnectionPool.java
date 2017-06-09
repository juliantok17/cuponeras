package conexion;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Vector;

/**
 *
 * @author Tokonas Julián
 */
public class ConnectionPool {

    private Vector<Connection> libres;
    private Vector<Connection> usadas;
    private String url;
    private String driver;
    private String usr;
    private String pwd;

    private int minsize;
    private int maxsize;
    private int steep;

    private static ConnectionPool pool = null;

    private ConnectionPool() throws ClassNotFoundException {
        try {
            
            Properties conConfig = new Properties();
            conConfig.load(new FileReader( "/home/mint/NetBeansProjects/cuponeras/src/java/root/connectionpool.properties" ));
            //ResourceBundle rb = ResourceBundle.getBundle("connectionpool");
            //obtengo los parametros de la conexion
            //url = rb.getString("url");
            //driver = rb.getString("driver");
            //usr = rb.getString("usr");
            //pwd = rb.getString("pwd");
            
            url = conConfig.getProperty("url");
            driver = conConfig.getProperty("driver");
            usr = conConfig.getProperty("usr");
            pwd = conConfig.getProperty("pwd");
            
            // levanto el driver
            Class.forName(driver);
            
            // obtengo los parametros del pool
            minsize = Integer.parseInt(conConfig.getProperty("minsize"));
            maxsize = Integer.parseInt(conConfig.getProperty("maxsize"));
            steep = Integer.parseInt(conConfig.getProperty("steep"));
            libres = new Vector<Connection>();
            usadas = new Vector<Connection>();
            System.out.println(maxsize);
            
            // instancio las primeras n conexiones
            _instanciar(minsize);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    public String toString() {
        return "libres: " + libres.size()
                + ", usadas: " + usadas.size();
    }

    public synchronized static ConnectionPool getPool() throws ClassNotFoundException {
        if (pool == null) {
            pool = new ConnectionPool();
        }
        return pool;
    }

    public synchronized Connection getConnection() {
        if (libres.size() == 0) {
            if (!_crearMasConexiones()) {
                throw new RuntimeException("No hay conexiones disponibles");
            }
        }
        Connection con = libres.remove(0);
        usadas.add(con);
        return con;
    }

    private boolean _crearMasConexiones() {
        int actuales = libres.size() + usadas.size();
        int n = Math.min(maxsize - actuales, steep);
        if (n > 0) {
            System.out.println("Creando " + n + " conexiones nuevas...");
            _instanciar(n);
        }
        return n > 0;
    }

    private void _instanciar(int n) {
        try {
            Connection con;
            for (int i = 0; i < n; i++) {
                con = DriverManager.getConnection(url, usr, pwd);
                con.setAutoCommit(false);
                libres.add(con);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    public synchronized void releaseConnection(Connection con) {
        boolean ok = usadas.remove(con);
        if (ok) {
            libres.add(con);
        } else {
            throw new RuntimeException("Me devuelve una conexion que no es mia...");
        }
    }

    public synchronized void close() {
        try {
            // cierro las conexiones libres
            for (Connection con : libres) {
                con.close();
            }
            // cierro las conexiones usadas
            for (Connection con : usadas) {
                con.close();
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);

        }
    }
}
