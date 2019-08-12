/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Caja;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface CajaService extends GenericService<Caja> {

    List<Caja> listarPorAgencia(Agencia a);
}
