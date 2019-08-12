/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import java.util.List;

/**
 *
 * @author NERIO
 */
public class ContratoTurno {

    private Contrato contrato;
    private List<Turno> listaturno;

    public ContratoTurno() {
    }

    public ContratoTurno(Contrato contrato, List<Turno> listaturno) {
        this.contrato = contrato;
        this.listaturno = listaturno;
    }

    public Contrato getContrato() {
        return contrato;
    }

    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }

    public List<Turno> getListaturno() {
        return listaturno;
    }

    public void setListaturno(List<Turno> listaturno) {
        this.listaturno = listaturno;
    }

}
