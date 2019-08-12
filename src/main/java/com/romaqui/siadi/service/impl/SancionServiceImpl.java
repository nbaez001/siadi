/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.SancionDao;
import com.romaqui.siadi.entity.Sancion;
import com.romaqui.siadi.service.SancionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class SancionServiceImpl extends GenericServiceImpl<Sancion> implements SancionService {

    @Autowired
    SancionDao sancionDao;

}
