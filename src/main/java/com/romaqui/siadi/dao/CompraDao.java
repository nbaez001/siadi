/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Detallecompra;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface CompraDao extends GenericDao<Compra> {

    Compra registrarCompra(Compra c, List<Detallecompra> ldc);

    int eliminarCompra(Compra c, List<Detallecompra> ldc);
}
