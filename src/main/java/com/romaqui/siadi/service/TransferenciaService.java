/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Transferencia;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface TransferenciaService extends GenericService<Transferencia> {

    List<Transferencia> listarTransferencias(Agencia a);
}
