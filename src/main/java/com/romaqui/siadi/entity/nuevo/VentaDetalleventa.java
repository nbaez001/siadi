/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Venta;
import java.util.List;

/**
 *
 * @author TOSHIBA
 */
public class VentaDetalleventa {

    private Venta venta;
    private List<Detalleventa> ldv;
    private Comprobante comprobante;

    public VentaDetalleventa() {
    }

    public VentaDetalleventa(Venta venta, List<Detalleventa> ldv, Comprobante comprobante) {
        this.venta = venta;
        this.ldv = ldv;
        this.comprobante = comprobante;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public List<Detalleventa> getLdv() {
        return ldv;
    }

    public void setLdv(List<Detalleventa> ldv) {
        this.ldv = ldv;
    }

    public Comprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }

}
