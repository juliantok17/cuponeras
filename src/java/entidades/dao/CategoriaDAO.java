/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades.dao;

import conexion.ConexionDB;
import entidades.Producto;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author codoacodo
 */
public class CategoriaDAO {

    private CategoriaDAO() throws ClassNotFoundException,
            IOException, SQLException {
    } //Patron singleton, constructor privado

    private static CategoriaDAO INSTANCE = null; //Patron singleton

    public static CategoriaDAO getInstance() throws ClassNotFoundException, IOException, SQLException { //patron singleton
        if (INSTANCE == null) {
            INSTANCE = new CategoriaDAO();
        }
        return INSTANCE;
    }

    private final static String SQL_CATEGORIA_SELECT = "select * from productos where ;";

    public ArrayList<Producto> getProductos() throws ClassNotFoundException, IOException, SQLException, InstantiationException {
        ArrayList<Producto> productoList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptsmt = null;
        ResultSet rs = null;
        
        try {
            conn = ConexionDB.getInstance().getConnection();
            ptsmt = conn.prepareStatement(SQL_CATEGORIA_SELECT);
            rs = ptsmt.executeQuery();
            Producto elProducto = null;
            while (rs.next()) { 
                try{
                    elProducto = new Producto();
                    elProducto.setIdProducto(rs.getInt("pro_id"));                
                    elProducto.setNombreProducto(rs.getString("pro_nom"));                    
                    elProducto.setPrecioProducto(rs.getDouble("pro_pre"));                
                    elProducto.setFechaPublicacionProducto(rs.getDate("pro_mod"));                                                  
                    
                }catch (Exception ex) {
                    ex.printStackTrace();
                }
                productoList.add(elProducto);
            }         
                     
        }finally {
            try {
                rs.close();
            } finally {
                try {
                    ptsmt.close();
                } finally {
                    conn.close();
                }
            }
        }
       return productoList;
    }
    
}
