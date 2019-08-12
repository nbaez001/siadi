/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Colaborador;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ContratoService extends GenericService<Contrato> {

    Contrato registrarContr(Contrato c, List<Turno> listaturno);

    Contrato actualizarContr(Contrato c);

    Contrato obtenerUltimo(Colaborador c);

    int eliminarContr(Contrato c);

    List<Contrato> listarContrato(Agencia a);
}
