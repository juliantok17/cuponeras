/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import entidades.dao.CategoriaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mint
 */
@WebServlet(name = "ProductoController", urlPatterns = {"/ProductoController"})
public class ProductoController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String texto = null;
        try {
            Gson gson = new Gson();
            texto = request.getParameter("id");
            System.out.println(texto);
            CategoriaDAO proById = CategoriaDAO.getInstance(); // Patron singleton
            out.println(gson.toJson(proById.getProductosPorCategoria(Integer.parseInt(texto))));
        } catch (ClassNotFoundException ex) {
            out.println("" + ex.getMessage());
        } catch (SQLException ex) {
            out.println("" + ex.getMessage());
        } catch (InstantiationException ex) {
            out.println("" + ex.getMessage());
        } catch (IllegalAccessException ex) {
            out.println("" + ex.getMessage());
        } finally {
            out.close();
        }
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
}
