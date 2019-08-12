/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.entity.Transaccion;

/**
 *
 * @author NERIO
 */
public class CreditoCuotaTransac {

    private Credito credito;
    private Cuota cuota;
    private Transaccion transaccion;
    private Comprobante comprobante;

    public CreditoCuotaTransac() {
    }

    public CreditoCuotaTransac(Credito credito, Cuota cuota, Transaccion transaccion, Comprobante comprobante) {
        this.credito = credito;
        this.cuota = cuota;
        this.transaccion = transaccion;
        this.comprobante = comprobante;
    }

    public Credito getCredito() {
        return credito;
    }

    public void setCredito(Credito credito) {
        this.credito = credito;
    }

    public Cuota getCuota() {
        return cuota;
    }

    public void setCuota(Cuota cuota) {
        this.cuota = cuota;
    }

    public Transaccion getTransaccion() {
        return transaccion;
    }

    public void setTransaccion(Transaccion transaccion) {
        this.transaccion = transaccion;
    }

    public Comprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }

}
