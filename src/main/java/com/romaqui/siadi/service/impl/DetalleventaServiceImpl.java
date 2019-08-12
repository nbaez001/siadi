/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.DetalleventaDao;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Venta;
import com.romaqui.siadi.service.DetalleventaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DetalleventaServiceImpl extends GenericServiceImpl<Detalleventa> implements DetalleventaService {

    @Autowired
    DetalleventaDao detalleventaDao;

    @Override
    public List<Detalleventa> listarPorVenta(Venta v) {
        return detalleventaDao.consultList("from Detalleventa dv where dv.venta.id=" + v.getId());
    }

}
