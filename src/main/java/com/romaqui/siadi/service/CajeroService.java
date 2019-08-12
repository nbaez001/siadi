/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Transferencia;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface CajeroService extends GenericService<Cajero> {

    List<Cajero> listarPorAgencia(Agencia a);

    Transferencia crearCajero(Transferencia t);

    Cajero obtenerCajero(HttpSession s);

    Transferencia cerrarCajero(Transferencia tr);
}
