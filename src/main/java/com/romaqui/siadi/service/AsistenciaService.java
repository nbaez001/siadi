/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Asistencia;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.nuevo.AsistenciaControl;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface AsistenciaService extends GenericService<Asistencia> {

    List<String> controlSemanal(Contrato c);

    List<AsistenciaControl> controlAsistenciaMensual(Contrato c, Date fecha);
}
