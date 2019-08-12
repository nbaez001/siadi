/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.CreditoDao;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.entity.Transaccion;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NERIO
 */
@Repository
public class CreditoDaoImpl extends GenericDaoImpl<Credito> implements CreditoDao {

    @Override
    public Cuota pagarCuota(Credito cr, Cuota cu, Transaccion tr, Cajero c, Comprobante comp, HttpSession s) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(cu);

            sesion.save(tr);
            sesion.update(cr);
            sesion.update(comp);
            sesion.update(c);
            
            s.setAttribute("cajero", c);
            tx.commit();
        } catch (Exception e) {
            cu = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return cu;
    }

}
