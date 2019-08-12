/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import java.util.List;
import java.util.Map;

/**
 *
 * @author nerio
 * @param <T>
 */
public interface GenericDao<T> {

    T save(T x);

    T read(int id);

    T update(T x);

    int drop(int id);

    List<T> findAll();

    int consultUpdate(String consulta);

    Object consultUnique(String consulta);

    List consultList(String consulta);

    T CriteriaUnique(Map eqParams, Map likeparams);

    List<T> CriteriaList(Map eqParams, List<String> ordersDesc, List<String> ordersAsc, Map likeparams, int limit);
}
