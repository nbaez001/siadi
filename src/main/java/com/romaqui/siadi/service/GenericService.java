/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import java.util.List;

/**
 *
 * @author nerio
 * @param <T>
 */
public interface GenericService<T> {

    T create(T x);

    T get(int id);

    T update(T x);

    int delete(int id);

    List<T> list();
}
