/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Cuota;
import java.util.List;

/**
 *
 * @author NERIO
 */
public interface CuotaService extends GenericService<Cuota> {

    public List<Cuota> listarCuotas(Agencia a);
}
