package utilitarios;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class ExternailzarTextos {
  public static void main(String [] args) throws FileNotFoundException, IOException{
      System.out.println("ExTex .. ");

      Properties textos = new Properties();
      textos.load(new FileReader( "web/WEB-INF/classes/prop/claves.valores" ));
     
      System.out.println( " ------------ "  );
      System.out.println("" + textos.getProperty("SQL_PRODUCTOS_X_CATEGORIA_SELECT") );
      System.out.println("" + textos.getProperty("SQL_USUARIO") );
      System.out.println("" + textos.getProperty("SQL_URL") );
      System.out.println("" + textos.getProperty("SQL_DRIVER") );
      System.out.println("" + textos.getProperty("SQL_PASSWORD") );
      
      System.out.println( " ------------ "  );


      textos = new Properties();
      textos.load( (new URL( "http://localhost:8084/Config/configuracion/clave.valores" )).openConnection().getInputStream() );
     
      System.out.println( " ------------ "  );
      System.out.println("" + textos.getProperty("SQL_PRODUCTOS_X_CATEGORIA_SELECT") );
      System.out.println("" + textos.getProperty("SQL_USUARIO") );
      System.out.println("" + textos.getProperty("SQL_URL") );
      System.out.println("" + textos.getProperty("SQL_DRIVER") );
      System.out.println("" + textos.getProperty("SQL_PASSWORD") );
      System.out.println( " ------------ "  );
      
      
      
      //System.out.println("" + System.getProperties());
      System.out.println("ExTex OK ");
  }    
}
