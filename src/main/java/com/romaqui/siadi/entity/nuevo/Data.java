/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.Representantelegal;
import java.util.List;

/**
 *
 * @author nerio
 */
public class Data {

    private Proveedor proveedor;
    private List<Representantelegal> rl;

    public Data() {
    }

    public Data(Proveedor proveedor, List<Representantelegal> rl) {
        this.proveedor = proveedor;
        this.rl = rl;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public List<Representantelegal> getRl() {
        return rl;
    }

    public void setRl(List<Representantelegal> rl) {
        this.rl = rl;
    }

}
