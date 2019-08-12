/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface TurnoService extends GenericService<Turno> {

    List<Turno> listarTurno(Contrato c);
    
    boolean existeTurno(Turno t);
}
