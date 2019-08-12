/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.CajaDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Caja;
import com.romaqui.siadi.service.CajaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class CajaServiceImpl extends GenericServiceImpl<Caja> implements CajaService {

    @Autowired
    CajaDao cajaDao;

    @Override
    public List<Caja> listarPorAgencia(Agencia a) {
        return cajaDao.consultList("from Caja c where c.agencia.id=" + a.getId());
    }

}
