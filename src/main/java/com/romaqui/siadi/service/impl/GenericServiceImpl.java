/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.GenericDao;
import com.romaqui.siadi.service.GenericService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 * @param <T>
 */
@Service
public abstract class GenericServiceImpl<T> implements GenericService<T> {

    @Autowired
    GenericDao<T> genericDao;

    @Override
    public T create(T x) {
        return genericDao.save(x);
    }

    @Override
    public T get(int id) {
        return genericDao.read(id);
    }

    @Override
    public T update(T x) {
        return genericDao.update(x);
    }

    @Override
    public int delete(int id) {
        return genericDao.drop(id);
    }

    @Override
    public List<T> list() {
        return genericDao.findAll();
    }

}
