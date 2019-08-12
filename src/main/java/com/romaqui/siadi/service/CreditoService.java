/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.entity.Transaccion;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NERIO
 */
public interface CreditoService extends GenericService<Credito> {

    List<Credito> listarCreditos(Cliente c);

    Cuota pagarCuota(Credito c, Cuota cu, Transaccion tr, Comprobante comp, HttpSession s);
}
