/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.ControlDao;
import com.romaqui.siadi.entity.Control;
import com.romaqui.siadi.service.ControlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ControlServiceImpl extends GenericServiceImpl<Control> implements ControlService {

    @Autowired
    ControlDao controlDao;

}
