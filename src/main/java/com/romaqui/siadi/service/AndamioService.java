/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Almacen;
import com.romaqui.siadi.entity.Andamio;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface AndamioService extends GenericService<Andamio> {

    List<Andamio> listarPorAlmacen(Almacen a);

    Andamio crearAndamio(Andamio a);

    int obtenerCodigoandamio(Almacen a);
}
