/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.TurnoDao;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import com.romaqui.siadi.service.TurnoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TurnoServiceImpl extends GenericServiceImpl<Turno> implements TurnoService {

    @Autowired
    TurnoDao turnoDao;

    @Override
    public List<Turno> listarTurno(Contrato c) {
        return turnoDao.consultList("from Turno t where t.contrato.id=" + c.getId());
    }

    @Override
    public boolean existeTurno(Turno t) {
        Turno tu = (Turno) turnoDao.consultUnique("from Turno t where t.contrato.id=" + t.getContrato().getId() + " and t.idttipoturno=" + t.getIdttipoturno()+" and t.dia="+t.getDia());
        return tu != null;
    }

}
