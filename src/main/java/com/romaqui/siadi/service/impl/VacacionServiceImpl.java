/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.VacacionDao;
import com.romaqui.siadi.entity.Vacacion;
import com.romaqui.siadi.service.VacacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class VacacionServiceImpl extends GenericServiceImpl<Vacacion> implements VacacionService {

    @Autowired
    VacacionDao vacacionDao;

}
