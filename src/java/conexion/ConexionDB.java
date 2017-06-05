package conexion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author codoacodo
 */
public class ConexionDB {
    private static ConexionDB INSTANCE = null;
    
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB = "cuponeras";
    private static final String URL = "jdbc:mysql://localhost/" + DB;
    private static final String USUARIO = "root";
    private static final String PASSWORD = "mint";

    Connection con = null;
    
    public static ConexionDB getInstance() throws ClassNotFoundException, IOException, SQLException {
        if (INSTANCE == null) {
            INSTANCE = new ConexionDB();
        }
        return INSTANCE;
    }
    
    private ConexionDB() throws ClassNotFoundException,
            IOException, SQLException {
    }
   
    /** Permite retornar la conexión*/     
    public Connection getConnection() throws InstantiationException, ClassNotFoundException, IllegalAccessException, SQLException {
        Class.forName(DRIVER);
        con = DriverManager.getConnection(URL, USUARIO, PASSWORD);
        return con;
    }

    public void desconectar() throws SQLException, ClassNotFoundException {
        con.close();
    }
}
