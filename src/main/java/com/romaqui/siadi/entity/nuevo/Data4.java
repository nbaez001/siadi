/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import com.romaqui.siadi.entity.Modulo;
import com.romaqui.siadi.entity.Usuario;
import java.util.List;

/**
 *
 * @author nerio
 */
public class Data4 {

    private Usuario usuario;
    private List<Modulo> lm;

    public Data4() {
    }

    public Data4(Usuario usuario, List<Modulo> lm) {
        this.usuario = usuario;
        this.lm = lm;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Modulo> getLm() {
        return lm;
    }

    public void setLm(List<Modulo> lm) {
        this.lm = lm;
    }

}
