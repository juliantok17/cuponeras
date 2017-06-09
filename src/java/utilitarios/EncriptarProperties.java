/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitarios;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;
import org.jasypt.encryption.pbe.PBEStringEncryptor;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.properties.PropertyValueEncryptionUtils;

/**
 *
 * @author mint
 */
public class EncriptarProperties {
    public static void main(String [] args) throws FileNotFoundException, IOException{
        
        Properties conConfig = new Properties();
            conConfig.load(new FileReader( "/home/mint/NetBeansProjects/cuponeras/src/java/root/connectionpool.properties" ));
        String clave = conConfig.getProperty("pwd");
        
            /*
            * Utilizaremos la clase StandardPBEStringEncryptor para trabajar con las encriptaciones.
            * Jasypt proporciona varias implementaciones según el tipo de encriptación que queramos,
            * en este caso utilizaremos un encriptador con clave privada.
            */
            PBEStringEncryptor encryptor = new StandardPBEStringEncryptor();

            //Establecemos la clave privada
            encryptor.setPassword("alabastro1978");
            
            //encriptamos el valor
            String claveEncriptada = PropertyValueEncryptionUtils.encrypt(clave, encryptor);
            
            //almacenamos en el objeto de propiedades el valor que hemos encriptado
            conConfig.setProperty("pwd", claveEncriptada);
            
            //guardamos el objeto de propiedades en un nuevo fichero properties
            OutputStream os = new FileOutputStream("/home/mint/NetBeansProjects/cuponeras/src/java/root/pool.properties");
            conConfig.store(os, "Fichero generado automaticamente");
    }
}
