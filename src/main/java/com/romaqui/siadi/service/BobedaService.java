/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Bobeda;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface BobedaService extends GenericService<Bobeda> {

    Bobeda crearBobeda(Bobeda b);

    Bobeda obtenerBobeda(Agencia a);

    List<Bobeda> listarBobeda(Date fecha);
}
