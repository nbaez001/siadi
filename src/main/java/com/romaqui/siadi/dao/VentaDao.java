/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Transaccion;
import com.romaqui.siadi.entity.Venta;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface VentaDao extends GenericDao<Venta> {

    Venta registrarVenta(Venta v, List<Detalleventa> ldv, List<Inventario> li, Transaccion tr, Cajero c, Comprobante comp, HttpSession s);
    
    Venta registrarVentac(Venta v, List<Detalleventa> ldv, List<Inventario> li, Credito cr);

    int eliminarVenta(Venta v, List<Detalleventa> ldv);
}
