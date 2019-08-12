/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.ContratoDao;
import com.romaqui.siadi.dao.TurnoDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Colaborador;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import com.romaqui.siadi.service.ContratoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ContratoServiceImpl extends GenericServiceImpl<Contrato> implements ContratoService {

    @Autowired
    ContratoDao contratoDao;
    @Autowired
    TurnoDao turnoDao;

    @Override
    public Contrato registrarContr(Contrato c, List<Turno> lt) {
        if (lt.size() > 0) {
            try {
                Integer i = Integer.parseInt(contratoDao.consultUnique("select max(c.id) from Contrato c where c.dependencia.agencia.id=" + c.getDependencia().getAgencia().getId()).toString());
                c.setCodigo("CTR-00" + (i + 1));
            } catch (Exception e) {
                c.setCodigo("CTR-00" + 1);
            }
            return contratoDao.registrarContr(c, lt);
        } else {
            return new Contrato(-1);
        }
    }

    @Override
    public Contrato actualizarContr(Contrato c) {
        return contratoDao.actualizarContr(c);
    }

    @Override
    public int eliminarContr(Contrato c) {
        return contratoDao.eliminarContr(c);
    }

    @Override
    public List<Contrato> listarContrato(Agencia a) {
        return contratoDao.consultList("from Contrato c where c.dependencia.agencia.id=" + a.getId());
    }

    @Override
    public Contrato obtenerUltimo(Colaborador c) {
        Integer i = 0;

        try {
            i = Integer.parseInt(contratoDao.consultUnique("select max(c.id) from Contrato c where c.colaborador.id=" + c.getId()).toString());
        } catch (Exception e) {
            i = null;
        }

        if (i != null) {
            return (Contrato) contratoDao.consultUnique("from Contrato c where c.id=" + i);
        } else {
            return null;
        }
    }

}
