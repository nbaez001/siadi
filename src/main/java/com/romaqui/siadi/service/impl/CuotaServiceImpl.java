/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.CuotaDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.service.CuotaService;
import java.text.SimpleDateFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NERIO
 */
@Service
public class CuotaServiceImpl extends GenericServiceImpl<Cuota> implements CuotaService {

    @Autowired
    CuotaDao cuotaDao;

    SimpleDateFormat sdf;

    public CuotaServiceImpl() {
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    public List<Cuota> listarCuotas(Agencia a) {
        return cuotaDao.consultList("from Cuota c where c.credito.venta.agencia.id=" + a.getId() + " and c.fecha>='" + sdf.format(a.getDatelimit()) + "'");
    }
}
