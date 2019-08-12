/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.DetallecompraDao;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Detallecompra;
import com.romaqui.siadi.service.DetallecompraService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DetallecompraServiceImpl extends GenericServiceImpl<Detallecompra> implements DetallecompraService {

    @Autowired
    DetallecompraDao detallecompraDao;

    @Override
    public List<Detallecompra> listarPorCompra(Compra c) {
        return detallecompraDao.consultList("from Detallecompra dc where dc.compra.id=" + c.getId());
    }

}
