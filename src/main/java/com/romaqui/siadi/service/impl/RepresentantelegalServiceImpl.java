/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.RepresentantelegalDao;
import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Representantelegal;
import com.romaqui.siadi.service.RepresentantelegalService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class RepresentantelegalServiceImpl extends GenericServiceImpl<Representantelegal> implements RepresentantelegalService {

    @Autowired
    RepresentantelegalDao representantelegalDao;

    @Override
    public List<Representantelegal> listarPorProveedorjuridico(Proveedorjuridico pj) {
        return representantelegalDao.consultList("from Representantelegal rl where rl.proveedorjuridico.id=" + pj.getId());
    }

}
