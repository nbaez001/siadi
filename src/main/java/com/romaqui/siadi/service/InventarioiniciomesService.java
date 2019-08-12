/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Inventarioiniciomes;
import com.romaqui.siadi.entity.Producto;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface InventarioiniciomesService extends GenericService<Inventarioiniciomes> {

    boolean existeRegistro(Producto p, int anio, int mes);

    List<Integer> listarAniosInventario();
}
