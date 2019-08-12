/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.VentaDao;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Transaccion;
import com.romaqui.siadi.entity.Venta;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 */
@Repository
public class VentaDaoImpl extends GenericDaoImpl<Venta> implements VentaDao {

    @Override
    public Venta registrarVenta(Venta v, List<Detalleventa> ldv, List<Inventario> li, Transaccion tr, Cajero c, Comprobante comp, HttpSession s) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(v);

            for (Detalleventa dv : ldv) {
                dv.setVenta(v);
                sesion.save(dv);
            }

            for (Inventario i : li) {
                sesion.update(i);
            }

            sesion.save(tr);
            sesion.update(c);
            sesion.update(comp);

            s.setAttribute("cajero", c);
            tx.commit();
        } catch (Exception e) {
            v = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return v;
    }

    @Override
    public Venta registrarVentac(Venta v, List<Detalleventa> ldv, List<Inventario> li, Credito cr) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(v);

            for (Detalleventa dv : ldv) {
                dv.setVenta(v);
                sesion.save(dv);
            }

            for (Inventario i : li) {
                sesion.update(i);
            }

            cr.setVenta(v);
            sesion.save(cr);

            tx.commit();
        } catch (Exception e) {
            v = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return v;
    }

    @Override
    public int eliminarVenta(Venta v, List<Detalleventa> ldv) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            Query query;
            for (Detalleventa dv : ldv) {
                query = sesion.createQuery("delete from " + Detalleventa.class.getName() + " x where x.id=" + dv.getId());
                query.executeUpdate();
            }

            query = sesion.createQuery("delete from " + Venta.class.getName() + " x where x.id=" + v.getId());
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
