/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.ProveedorDao;
import com.romaqui.siadi.dao.RepresentantelegalDao;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.Representantelegal;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.nuevo.Data;
import com.romaqui.siadi.entity.nuevo.Data2;
import com.romaqui.siadi.service.ProveedorService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ProveedorServiceImpl extends GenericServiceImpl<Proveedor> implements ProveedorService {

    @Autowired
    ProveedorDao proveedorDao;
    @Autowired
    RepresentantelegalDao representantelegalDao;

    @Override
    public List<Proveedor> listarProveedor(Tablamaestra t) {
        return proveedorDao.consultList("from Proveedor p where p.idttipoproveedor=" + t.getId());
    }

    @Override
    public List<Proveedor> listarProveedorjuridico(Proveedor p) {
        if (p.getId() == 1) {
            return proveedorDao.consultList("from Proveedor p where p.proveedorjuridico.ruc=" + p.getProveedorjuridico().getRuc() + "");
        } else {
            return proveedorDao.consultList("from Proveedor p where p.proveedorjuridico.razonsocial like '%" + p.getProveedorjuridico().getRazonsocial() + "%' or  p.proveedorjuridico.nombrecomercial like '%" + p.getProveedorjuridico().getNombrecomercial() + "%'");
        }
    }

    @Override
    public List<Proveedor> listarProveedornatural(Proveedor p) {
        if (p.getId() == 1) {
            return proveedorDao.consultList("from Proveedor p where p.proveedornatural.dni=" + p.getProveedornatural().getDni() + "");
        } else {
            return proveedorDao.consultList("from Proveedor p where p.proveedornatural.nombre like '%" + p.getProveedornatural().getNombre() + "%' or  p.proveedornatural.apellidopat like '%" + p.getProveedornatural().getApellidopat() + "%' or  p.proveedornatural.apellidomat like '%" + p.getProveedornatural().getApellidomat() + "%'");
        }
    }

    @Override
    public int obtenerCodigoproveedor(Tablamaestra tm) {
        int dato;
        try {
            if (tm.getId() == 1) {
                dato = Integer.parseInt(proveedorDao.consultUnique("select count(p) from Proveedor p where p.idttipoproveedor=" + tm.getId()).toString());
            } else {
                dato = Integer.parseInt(proveedorDao.consultUnique("select count(p) from Proveedor p where p.idttipoproveedor=" + tm.getId()).toString());
            }
        } catch (Exception e) {
            dato = 0;
        }
        return dato + 1;
    }

    @Override
    public Proveedor registrarProveedorjuridico(Data data) {
        return proveedorDao.registrarProveedorjuridico(data.getProveedor().getProveedorjuridico(), data.getProveedor(), data.getRl());
    }

    @Override
    public int eliminarProveedorjuridico(Proveedor p) {
        List<Representantelegal> lrl = representantelegalDao.consultList("from Representantelegal rl where rl.proveedorjuridico.id=" + p.getProveedorjuridico().getId());

        return proveedorDao.eliminarProveedorjuridico(p, lrl, p.getProveedorjuridico());
    }

    @Override
    public Proveedor registrarProveedornatural(Proveedor p) {
        return proveedorDao.registrarProveedornatural(p.getProveedornatural(), p);
    }

    @Override
    public int eliminarProveedornatural(Proveedor p) {
        return proveedorDao.eliminarProveedornatural(p, p.getProveedornatural());
    }

    @Override
    public Proveedor actualizarProveedornatural(Proveedor p) {
        return proveedorDao.actualizarProveedornatural(p.getProveedornatural(), p);
    }

    @Override
    public Proveedor actualizarProveedorjuridico(Data2 data) {
        List<Representantelegal> lrl = data.getRl();

        List<Representantelegal> lrle = new ArrayList<>();
        List<Representantelegal> lrln = new ArrayList<>();

        for (Representantelegal rl : lrl) {
            if (rl.getId() != 0) {
                lrle.add(rl);
            } else {
                lrln.add(rl);
            }
        }
        return proveedorDao.actualizarProveedorjuridico(data.getProveedor().getProveedorjuridico(), data.getProveedor(), lrle, lrln, data.getRle());
    }

}
