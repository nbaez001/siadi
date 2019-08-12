/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.ContratoDao;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class ContratoDaoImpl extends GenericDaoImpl<Contrato> implements ContratoDao {

    @Override
    public Contrato registrarContr(Contrato c, List<Turno> lt) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(c);
            for (Turno t : lt) {
                t.setContrato(c);
                sesion.save(t);
            }

            tx.commit();
        } catch (Exception e) {
            c = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return c;
    }

    @Override
    public Contrato actualizarContr(Contrato c) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.clear();
            sesion.update(c);
            tx.commit();
        } catch (Exception e) {
            c = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return c;
    }

    @Override
    public int eliminarContr(Contrato c) {
        Session sesion = sesionFactory.openSession();
        //sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            Query query = sesion.createQuery("delete from " + Turno.class.getName() + " x where x.contrato.id=" + c.getId());
            query.executeUpdate();

            query = sesion.createQuery("delete from " + Contrato.class.getName() + " x where x.id=" + c.getId());
            query.executeUpdate();

            tx.commit();
            r++;
        } catch (Exception e) {
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

}
