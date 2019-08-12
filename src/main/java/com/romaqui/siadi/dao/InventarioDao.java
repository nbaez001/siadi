/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Inventario;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface InventarioDao extends GenericDao<Inventario> {

    int registrarIngreso(Compra c, List<Inventario> li);
}
