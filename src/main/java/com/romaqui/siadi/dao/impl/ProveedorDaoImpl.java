/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.ProveedorDao;
import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Proveedornatural;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.Representantelegal;
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
public class ProveedorDaoImpl extends GenericDaoImpl<Proveedor> implements ProveedorDao {

    @Override
    public Proveedor registrarProveedorjuridico(Proveedorjuridico pj, Proveedor p, List<Representantelegal> lrl) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(pj);

            p.setProveedorjuridico(pj);
            sesion.save(p);

            for (Representantelegal rl : lrl) {
                rl.setProveedorjuridico(pj);
                sesion.save(rl);
            }

            tx.commit();
        } catch (Exception e) {
            p = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return p;
    }

    @Override
    public int eliminarProveedorjuridico(Proveedor p, List<Representantelegal> lrl, Proveedorjuridico pj) {
        Session sesion = sesionFactory.openSession();
        //sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            Query query = sesion.createQuery("delete from " + Proveedor.class.getName() + " x where x.id=" + p.getId());
            query.executeUpdate();

            for (Representantelegal rl : lrl) {
                query = sesion.createQuery("delete from " + Representantelegal.class.getName() + " x where x.id=" + rl.getId());
                query.executeUpdate();
            }

            query = sesion.createQuery("delete from " + Proveedorjuridico.class.getName() + " x where x.id=" + pj.getId());
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

    @Override
    public Proveedor registrarProveedornatural(Proveedornatural pn, Proveedor p) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(pn);

            p.setProveedornatural(pn);
            sesion.save(p);

            tx.commit();
        } catch (Exception e) {
            p = null;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return p;
    }

    @Override
    public int eliminarProveedornatural(Proveedor p, Proveedornatural pn) {
        Session sesion = sesionFactory.openSession();
        //sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;

        try {
            Query query = sesion.createQuery("delete from " + Proveedor.class.getName() + " x where x.id=" + p.getId());
            query.executeUpdate();

            query = sesion.createQuery("delete from " + Proveedornatural.class.getName() + " x where x.id=" + pn.getId());
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

    @Override
    public Proveedor actualizarProveedornatural(Proveedornatural pn, Proveedor p) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.clear();
            sesion.update(pn);

            p.setProveedornatural(pn);
            sesion.update(p);

            tx.commit();
        } catch (Exception e) {
            p = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return p;
    }

    @Override
    public Proveedor actualizarProveedorjuridico(Proveedorjuridico pj, Proveedor p, List<Representantelegal> lrle, List<Representantelegal> lrln, List<Representantelegal> lrl) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.clear();

            sesion.update(pj);
            sesion.update(p);

            for (Representantelegal rl : lrle) {
                sesion.update(rl);
            }

            for (Representantelegal rl : lrln) {
                rl.setProveedorjuridico(pj);
                sesion.save(rl);
            }

            for (Representantelegal rl : lrl) {
                Query query = sesion.createQuery("delete from " + Representantelegal.class.getName() + " x where x.id=" + rl.getId());
                query.executeUpdate();
            }
            tx.commit();
        } catch (Exception e) {
            p = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return p;
    }
}
