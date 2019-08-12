/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.InventarioDao;
import com.romaqui.siadi.dao.MermaDao;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Merma;
import com.romaqui.siadi.service.MermaService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class MermaServiceImpl extends GenericServiceImpl<Merma> implements MermaService {

    @Autowired
    MermaDao mermaDao;
    @Autowired
    InventarioDao inventarioDao;

    SimpleDateFormat sdf;

    public MermaServiceImpl() {
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    public Merma registrarMerma(Merma m) {
        //m.setFecha(new Date());
        m.setFechusuariocrea(new Date());

        List<Inventario> li = new ArrayList<>();

//        for (Inventario i : li) {
//           
//            if (i.getCantidad() > i.getCantidadact()) {
//                return Merma(-1, i.getProducto().getNombre());
//            } else {
//                i.setCantidadact(i.getCantidadact() - i.getCantidad());
//                i.setFechusuariomod(new Date());
//
//                li.add(i);
//
//                i.setId(0);
//            }
//        }
        return mermaDao.registrarMerma(m, li);
    }

    @Override
    public int eliminarMerma(Merma m) {
        return mermaDao.eliminarMerma(m);
    }

    @Override
    public List<Merma> listarMermaFechas(Merma m) {
        return mermaDao.consultList("from Merma m where m.fechusuariocrea>='" + sdf.format(m.getFechusuariocrea()) + "'and m.fechusuariomod<='" + sdf.format(m.getFechusuariomod()) + "' ");
    }

}
