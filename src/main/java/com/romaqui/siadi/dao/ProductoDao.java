/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Producto;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface ProductoDao extends GenericDao<Producto> {

    Producto registrarProducto(Producto p, HttpSession s);

    int eliminarProducto(Producto p);
}
