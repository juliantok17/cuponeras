/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.Date;

/**
 *
 * @author codoacodo
 */
public class Producto {
    private int idProducto;
    private String nombreProducto;
    private String empresaProducto;
    private Double precioProducto;
    private String descripcionProducto;
    private Date fechaPublicacionProducto;
    /**
     * @return the idProducto
     */
    public int getIdProducto() {
        return idProducto;
    }

    /**
     * @param idProducto the idProducto to set
     */
    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    /**
     * @return the nombreProducto
     */
    public String getNombreProducto() {
        return nombreProducto;
    }

    /**
     * @param nombreProducto the nombreProducto to set
     */
    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    /**
     * @return the empresaProducto
     */
    public String getEmpresaProducto() {
        return empresaProducto;
    }

    /**
     * @param empresaProducto the empresaProducto to set
     */
    public void setEmpresaProducto(String empresaProducto) {
        this.empresaProducto = empresaProducto;
    }

    /**
     * @return the precioProducto
     */
    public Double getPrecioProducto() {
        return precioProducto;
    }

    /**
     * @param precioProducto the precioProducto to set
     */
    public void setPrecioProducto(Double precioProducto) {
        this.precioProducto = precioProducto;
    }

    /**
     * @return the fechaPublicacionProducto
     */
    public Date getFechaPublicacionProducto() {
        return fechaPublicacionProducto;
    }

    /**
     * @param fechaPublicacionProducto the fechaPublicacionProducto to set
     */
    public void setFechaPublicacionProducto(Date fechaPublicacionProducto) {
        this.fechaPublicacionProducto = fechaPublicacionProducto;
    }

    /**
     * @return the descripcionProducto
     */
    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    /**
     * @param descripcionProducto the descripcionProducto to set
     */
    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }
    
}
