/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.MermaDao;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Merma;
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
public class MermaDaoImpl extends GenericDaoImpl<Merma> implements MermaDao {

    @Override
    public Merma registrarMerma(Merma m, List<Inventario> li) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(m);
            for (Inventario i : li) {
                sesion.update(i);
            }
            tx.commit();
        } catch (Exception e) {
            m = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return m;
    }

    @Override
    public int eliminarMerma(Merma m) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            Query query;
            query = sesion.createQuery("delete from " + Merma.class.getName() + " x where x.id=" + m.getId());
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
