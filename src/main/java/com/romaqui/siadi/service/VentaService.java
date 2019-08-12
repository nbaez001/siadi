/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Venta;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface VentaService extends GenericService<Venta> {

    int obtenerCodigoventa(Agencia a);

    Venta registrarVenta(Venta v, List<Detalleventa> ldv, Comprobante comp, HttpSession s);

    Venta registrarVentac(Venta v, List<Detalleventa> ldv, HttpSession s);

    int eliminarVenta(Venta v);

    List<Venta> listarVentas(Agencia a);

    List<Venta> listarVentaFechas(Venta v);

    List<Venta> listarVentaCodigo(Venta v);
}
