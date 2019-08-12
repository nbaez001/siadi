/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.entity.Transaccion;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NERIO
 */
public interface CreditoDao extends GenericDao<Credito> {

    Cuota pagarCuota(Credito cr, Cuota cu, Transaccion tr, Cajero c, Comprobante comp, HttpSession s);
}
