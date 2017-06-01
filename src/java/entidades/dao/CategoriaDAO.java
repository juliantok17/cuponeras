/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades.dao;

import conexion.ConexionDB;
import entidades.Categoria;
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

    private final static String SQL_PRODUCTOS_X_CATEGORIA_SELECT = 
        "SELECT p.pro_id, p.pro_nom, p.pro_pre, p.pro_des, c.cat_nom, e.emp_nom, p.pro_fecha_pub, i.image "
      + "FROM productos AS p, categorias AS c, empresas AS e,productos_categorias AS pc, imagenes AS i "
      + "WHERE p.pro_id = pc.id_pro AND c.cat_id = pc.id_cat AND e.emp_id = p.pro_emp AND i.img_pro_id = p.pro_id AND c.cat_id = ?;";

    public ArrayList<Producto> getProductosPorCategoria(int id) throws ClassNotFoundException, IOException, SQLException, InstantiationException, IllegalAccessException {
        ArrayList<Producto> productoList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptsmt = null;
        ResultSet rs = null;
        
        try {
            conn = ConexionDB.getInstance().getConnection();
            ptsmt = conn.prepareStatement(SQL_PRODUCTOS_X_CATEGORIA_SELECT);
            ptsmt.setInt(1, id);
            rs = ptsmt.executeQuery();
            Producto elProducto = null;
            while (rs.next()) { 
                try{
                    elProducto = new Producto();
                    elProducto.setIdProducto(rs.getInt("pro_id"));                
                    elProducto.setNombreProducto(rs.getString("pro_nom"));                    
                    elProducto.setPrecioProducto(rs.getDouble("pro_pre"));                
                    elProducto.setFechaPublicacionProducto(rs.getDate("pro_fecha_pub")); 
                    elProducto.setDescripcionProducto(rs.getString("pro_des"));
                    elProducto.setEmpresaProducto(rs.getString("emp_nom"));
                    elProducto.setImagenProducto(rs.getString("image"));
                    
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
    
    private final static String SQL_CATEGORIA_SELECT = "select * from categorias;";
    
    public ArrayList<Categoria> getAllCategorias() throws ClassNotFoundException, IOException, SQLException, InstantiationException, IllegalAccessException {
        ArrayList<Categoria> categoriaList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptsmt = null;
        ResultSet rs = null;
        
        try {
            conn = ConexionDB.getInstance().getConnection();
            ptsmt = conn.prepareStatement(SQL_CATEGORIA_SELECT);
            rs = ptsmt.executeQuery();
            Categoria laCategoria = null;
            while (rs.next()) { 
                try{
                    laCategoria = new Categoria();
                    laCategoria.setIdCategoria(rs.getInt("cat_id"));                
                    laCategoria.setNombreCategoria(rs.getString("cat_nom"));                   
                    
                }catch (Exception ex) {
                    ex.printStackTrace();
                }
                categoriaList.add(laCategoria);
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
       return categoriaList;
    }
    
}
