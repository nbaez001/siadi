/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.ProvinciaDao;
import com.romaqui.siadi.entity.Departamento;
import com.romaqui.siadi.entity.Provincia;
import com.romaqui.siadi.service.ProvinciaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ProvinciaServiceImpl extends GenericServiceImpl<Provincia> implements ProvinciaService {

    @Autowired
    ProvinciaDao provinciaDao;

    @Override
    public List<Provincia> listarPorDepartamento(Departamento d) {
        return provinciaDao.consultList("from Provincia p where p.departamento.id=" + d.getId());
    }

}
