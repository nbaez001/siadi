/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.ClienteDao;
import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Clientejuridico;
import com.romaqui.siadi.entity.Clientenatural;
import com.romaqui.siadi.entity.Representantlegal;
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
public class ClienteDaoImpl extends GenericDaoImpl<Cliente> implements ClienteDao {
    
    @Override
    public Cliente registrarClientejuridico(Cliente c, List<Representantlegal> lrl) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();
        
        try {
            sesion.save(c.getClientejuridico());
            sesion.save(c);
            
            for (Representantlegal rl : lrl) {
                rl.setClientejuridico(c.getClientejuridico());
                sesion.save(rl);
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
    public int eliminarClientejuridico(Cliente c) {
        Session sesion = sesionFactory.openSession();
        //sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();
        
        int r = 0;
        
        try {
            Query query = sesion.createQuery("delete from " + Cliente.class.getName() + " x where x.id=" + c.getId());
            query.executeUpdate();
            
            query = sesion.createQuery("delete from " + Clientejuridico.class.getName() + " x where x.id=" + c.getClientejuridico().getId());
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
    public Cliente registrarClientenatural(Cliente c) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();
        
        try {
            sesion.save(c.getClientenatural());
            sesion.save(c);
            
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
    public int eliminarClientenatural(Cliente c) {
        Session sesion = sesionFactory.openSession();
        //sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();
        
        int r = 0;
        
        try {
            Query query = sesion.createQuery("delete from " + Cliente.class.getName() + " x where x.id=" + c.getId());
            query.executeUpdate();
            
            query = sesion.createQuery("delete from " + Clientenatural.class.getName() + " x where x.id=" + c.getClientenatural().getId());
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
    public Cliente actualizarClientenatural(Cliente c) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();
        
        try {
            sesion.clear();
            sesion.update(c.getClientenatural());
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
    public Cliente actualizarClientejuridico(Cliente c) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();
        
        try {
            sesion.clear();
            sesion.update(c.getClientejuridico());
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
}
