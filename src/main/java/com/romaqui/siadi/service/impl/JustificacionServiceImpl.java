/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.JustificacionDao;
import com.romaqui.siadi.entity.Justificacion;
import com.romaqui.siadi.service.JustificacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class JustificacionServiceImpl extends GenericServiceImpl<Justificacion> implements JustificacionService {

    @Autowired
    JustificacionDao justificacionDao;

}
