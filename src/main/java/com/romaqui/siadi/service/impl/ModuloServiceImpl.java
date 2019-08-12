/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.FuncionDao;
import com.romaqui.siadi.dao.ModuloDao;
import com.romaqui.siadi.dao.RolDao;
import com.romaqui.siadi.entity.Funcion;
import com.romaqui.siadi.entity.Modulo;
import com.romaqui.siadi.entity.Rol;
import com.romaqui.siadi.service.ModuloService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ModuloServiceImpl extends GenericServiceImpl<Modulo> implements ModuloService {

    @Autowired
    ModuloDao moduloDao;
    @Autowired
    RolDao rolDao;
    @Autowired
    FuncionDao funcionDao;

    @Override
    public List<Modulo> listModulos() {
        List<Modulo> lm = moduloDao.findAll();
        for (Modulo m : lm) {
            List<Rol> lr = rolDao.consultList("from Rol r where r.modulo.id=" + m.getId());
            for (Rol r : lr) {
                r.setModulo(null);
                List<Funcion> lf = funcionDao.consultList("from Funcion f where f.rol.id=" + r.getId());
                for (Funcion f : lf) {
                    f.setRol(null);
                    f.setEstado(false);
                    r.setFunciones(lf);
                }
            }
            m.setRoles(lr);
        }
        return lm;
    }

}
