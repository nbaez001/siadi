/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.TransferenciaDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Transferencia;
import com.romaqui.siadi.service.TransferenciaService;
import java.text.SimpleDateFormat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class TransferenciaServiceImpl extends GenericServiceImpl<Transferencia> implements TransferenciaService {

    @Autowired
    TransferenciaDao transferenciaDao;

    SimpleDateFormat sdf;

    public TransferenciaServiceImpl() {
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    public List<Transferencia> listarTransferencias(Agencia a) {
        if (a.getDatelimit() != null) {
            return transferenciaDao.consultList("from Transferencia t where t.bobeda.agencia.id=" + a.getId() + " and t.fecha>'" + sdf.format(a.getDatelimit()) + "'");
        } else {
            return transferenciaDao.consultList("from Transferencia t where t.bobeda.agencia.id=" + a.getId());
        }
    }

}
