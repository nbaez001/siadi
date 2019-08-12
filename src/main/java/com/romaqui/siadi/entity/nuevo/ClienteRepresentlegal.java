/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Representantlegal;
import java.util.List;

/**
 *
 * @author NERIO
 */
public class ClienteRepresentlegal {

    private Cliente cliente;
    private List<Representantlegal> lrl;

    public ClienteRepresentlegal() {
    }

    public ClienteRepresentlegal(Cliente cliente, List<Representantlegal> lrl) {
        this.cliente = cliente;
        this.lrl = lrl;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List<Representantlegal> getLrl() {
        return lrl;
    }

    public void setLrl(List<Representantlegal> lrl) {
        this.lrl = lrl;
    }

}
