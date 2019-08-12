/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.PermisoDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Permiso;
import com.romaqui.siadi.service.PermisoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class PermisoServiceImpl extends GenericServiceImpl<Permiso> implements PermisoService {

    @Autowired
    PermisoDao permisoDao;

    @Override
    public List<Permiso> listarPermisos(Contrato c) {
        return permisoDao.consultList("from Permiso p where p.contrato.id=" + c.getId());
    }

    @Override
    public List<Permiso> listarPermisos(Agencia a) {
        return permisoDao.consultList("from Permiso p where p.contrato.dependencia.agencia.id=" + a.getId() + " and (p.autorizja=0 or p.autorizjp=0)");
    }

}
