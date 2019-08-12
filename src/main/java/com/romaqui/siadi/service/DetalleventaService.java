/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Venta;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface DetalleventaService extends GenericService<Detalleventa> {

    List<Detalleventa> listarPorVenta(Venta v);
}
