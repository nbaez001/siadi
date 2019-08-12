/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.InventarioDao;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Inventario;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class InventarioDaoImpl extends GenericDaoImpl<Inventario> implements InventarioDao {

    @Override
    public int registrarIngreso(Compra c, List<Inventario> li) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        int r = 0;
        try {
            sesion.update(c);

            for (Inventario i : li) {
                if (i.getId() == 0) {
                    sesion.save(i);
                } else {
                    sesion.update(i);
                }
            }
            tx.commit();

            r++;
        } catch (Exception e) {
            r = 0;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return r;
    }
}
