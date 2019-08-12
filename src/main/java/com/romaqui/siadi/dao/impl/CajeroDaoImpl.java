/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.CajeroDao;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Transferencia;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class CajeroDaoImpl extends GenericDaoImpl<Cajero> implements CajeroDao {

    @Override
    public Transferencia crearCajero(Transferencia t) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(t.getCajero());
            sesion.update(t.getBobeda());

            if (t.getMontototal() > 0.0) {
                sesion.save(t);
            }
            tx.commit();
        } catch (Exception e) {
            t = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return t;
    }

    @Override
    public Transferencia cerrarCajero(Transferencia tr) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.update(tr.getCajero());
            sesion.update(tr.getBobeda());

            sesion.save(tr);
            tx.commit();
        } catch (Exception e) {
            tr = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return tr;
    }

}
