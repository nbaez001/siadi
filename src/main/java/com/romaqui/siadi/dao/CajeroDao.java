/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Transferencia;

/**
 *
 * @author nerio
 */
public interface CajeroDao extends GenericDao<Cajero> {

    Transferencia crearCajero(Transferencia t);

    Transferencia cerrarCajero(Transferencia tr);
}
