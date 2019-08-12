/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.CompraDao;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Detallecompra;
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
public class CompraDaoImpl extends GenericDaoImpl<Compra> implements CompraDao {

    @Override
    public Compra registrarCompra(Compra c, List<Detallecompra> ldc) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(c);

            for (Detallecompra dc : ldc) {
                dc.setCompra(c);
                sesion.save(dc);
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
    public int eliminarCompra(Compra c, List<Detallecompra> ldc) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            Query query;
            for (Detallecompra dc : ldc) {
                query = sesion.createQuery("delete from " + Detallecompra.class.getName() + " x where x.id=" + dc.getId());
                query.executeUpdate();
            }

            query = sesion.createQuery("delete from " + Compra.class.getName() + " x where x.id=" + c.getId());
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
