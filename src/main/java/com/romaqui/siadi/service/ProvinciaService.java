/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Departamento;
import com.romaqui.siadi.entity.Provincia;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ProvinciaService extends GenericService<Provincia> {

    List<Provincia> listarPorDepartamento(Departamento d);
}
