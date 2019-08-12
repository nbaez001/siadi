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
 * @author ROMAQUI
 */
public class Data2 {

    private Proveedor proveedor;
    private List<Representantelegal> rl;
    private List<Representantelegal> rle;

    public Data2() {
    }

    public Data2(Proveedor proveedor, List<Representantelegal> rl, List<Representantelegal> rle) {
        this.proveedor = proveedor;
        this.rl = rl;
        this.rle = rle;
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

    public List<Representantelegal> getRle() {
        return rle;
    }

    public void setRle(List<Representantelegal> rle) {
        this.rle = rle;
    }

}
