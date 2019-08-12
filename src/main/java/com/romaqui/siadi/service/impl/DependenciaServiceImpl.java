/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.DependenciaDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Dependencia;
import com.romaqui.siadi.service.DependenciaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class DependenciaServiceImpl extends GenericServiceImpl<Dependencia> implements DependenciaService {

    @Autowired
    DependenciaDao dependenciaDao;

    @Override
    public List<Dependencia> listarDependencia(Agencia a) {
        return dependenciaDao.consultList("from Dependencia d where d.agencia.id=" + a.getId());
    }

}
