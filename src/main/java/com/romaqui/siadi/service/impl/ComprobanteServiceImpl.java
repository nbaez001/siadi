/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.ComprobanteDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.service.ComprobanteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NERIO
 */
@Service
public class ComprobanteServiceImpl extends GenericServiceImpl<Comprobante> implements ComprobanteService {

    @Autowired
    ComprobanteDao comprobanteDao;

    @Override
    public List<Comprobante> listarPorAgencia(Agencia a) {
        String hql = "from Comprobante c where c.agencia.id=" + a.getId();
        if (a.getIdtipo() != 0) {
            hql += " and c.idttipocomprobante=" + a.getIdtipo();
        }

        if (a.isEstado() == true) {
            hql += " and c.estado=true";
        }

        return comprobanteDao.consultList(hql);
    }

}
