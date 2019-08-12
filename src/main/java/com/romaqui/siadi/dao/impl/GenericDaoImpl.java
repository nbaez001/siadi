/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.GenericDao;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nerio
 * @param <T>
 */
@Repository
public abstract class GenericDaoImpl<T> implements GenericDao<T> {

    @Autowired
    protected SessionFactory sesionFactory;
    protected final Class<T> type;

    public GenericDaoImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        type = (Class) pt.getActualTypeArguments()[0];
    }

    @Override
    public T save(T x) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(x);
            tx.commit();
        } catch (Exception e) {
            x = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return x;
    }

    @Override
    public T read(int id) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Criteria criteria = sesion.createCriteria(type);
        T x = (T) criteria.add(Restrictions.eq("id", id)).uniqueResult();

        sesion.close();

        return x;
    }

    @Override
    public T update(T x) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.clear();
            sesion.update(x);
            tx.commit();
        } catch (Exception e) {
            x = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return x;
    }

    @Override
    public int drop(int id) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Query query = sesion.createQuery("delete from " + type.getName() + " x where x.id=" + id);
        int r = query.executeUpdate();

        sesion.close();

        return r;
    }

    @Override
    public List<T> findAll() {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Criteria criteria = sesion.createCriteria(type);
        List<T> lista = (List<T>) criteria.list();

        sesion.close();

        return lista;
    }

    @Override
    public int consultUpdate(String consulta) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Query query = sesion.createQuery(consulta);
        int r = query.executeUpdate();

        sesion.close();

        return r;
    }

    @Override
    public Object consultUnique(String consulta) { //from Persona (HQL Hibernate Query Language)
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Query query = sesion.createQuery(consulta);
        Object objeto = query.uniqueResult();

        sesion.close();

        return objeto;
    }

    @Override
    public List consultList(String consulta) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Query query = sesion.createQuery(consulta);
        List lista = query.list();

        sesion.close();

        return lista;
    }

    @Override
    public T CriteriaUnique(Map eqParams, Map likeparams) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Criteria criteria = sesion.createCriteria(type);
        if (eqParams != null) {
            for (Iterator it = eqParams.entrySet().iterator(); it.hasNext();) {
                Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it.next();
                Object valor = entry.getValue();
                criteria.add(Restrictions.eq(entry.getKey(), valor));
            }
        }

        if (likeparams != null) {
            for (Iterator it = likeparams.entrySet().iterator(); it.hasNext();) {
                Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it.next();
                Object valor = entry.getValue();
                criteria.add(Restrictions.like(entry.getKey(), "%" + valor + "%"));
            }
        }

        T x = (T) criteria.uniqueResult();

        sesion.close();
        return x;
    }

    @Override
    public List<T> CriteriaList(Map eqParams, List<String> ordersDesc, List<String> ordersAsc, Map likeparams, int limit) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();

        Criteria criteria = sesion.createCriteria(type);
        if (eqParams != null) {
            for (Iterator it = eqParams.entrySet().iterator(); it.hasNext();) {
                Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it.next();
                Object valor = entry.getValue();
                criteria.add(Restrictions.eq(entry.getKey(), valor));
            }
        }

        if (likeparams != null) {
            for (Iterator it = likeparams.entrySet().iterator(); it.hasNext();) {
                Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it.next();
                Object valor = entry.getValue();
                criteria.add(Restrictions.like(entry.getKey(), "%" + valor + "%"));
            }
        }

        if (ordersDesc != null) {
            for (String key : ordersDesc) {
                criteria.addOrder(Order.desc(key));
            }
        }

        if (ordersAsc != null) {
            for (String key : ordersAsc) {
                criteria.addOrder(Order.asc(key));
            }
        }

        if (limit > 0) {
            criteria.setMaxResults(limit);
        }

        List<T> lista = (List<T>) criteria.list();

        sesion.close();
        return lista;
    }

}
