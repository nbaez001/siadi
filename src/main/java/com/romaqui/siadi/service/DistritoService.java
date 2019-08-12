/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Distrito;
import com.romaqui.siadi.entity.Provincia;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface DistritoService extends GenericService<Distrito> {

    List<Distrito> listarPorProvincia(Provincia p);
}
