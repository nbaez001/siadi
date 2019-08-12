/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao.impl;

import com.romaqui.siadi.dao.UsuarioDao;
import com.romaqui.siadi.entity.Colaborador;
import com.romaqui.siadi.entity.Funcionacceso;
import com.romaqui.siadi.entity.Moduloacceso;
import com.romaqui.siadi.entity.Rolacceso;
import com.romaqui.siadi.entity.Usuario;
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
public class UsuarioDaoImpl extends GenericDaoImpl<Usuario> implements UsuarioDao {

    @Override
    public Usuario registrarUsuarioT(Colaborador c, Usuario u, List<Moduloacceso> lm) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(c);
            u.setColaborador(c);

            sesion.save(u);

            for (Moduloacceso ma : lm) {
                ma.setUsuario(u);
                sesion.save(ma);
                List<Rolacceso> lra = ma.getRolaccesos();
                for (Rolacceso ra : lra) {
                    ra.setModuloacceso(ma);
                    sesion.save(ra);
                    List<Funcionacceso> lfa = ra.getFuncionaccesos();
                    for (Funcionacceso fa : lfa) {
                        fa.setRolacceso(ra);
                        sesion.save(fa);
                    }
                }
            }

            tx.commit();
        } catch (Exception e) {
            u = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return u;
    }

    @Override
    public Usuario actualizarUsuarioT(Colaborador c, Usuario u, List<Moduloacceso> lm, List<Moduloacceso> lma) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        Query query;
        try {
            sesion.clear();
            sesion.update(c);
            sesion.update(u);

            for (Moduloacceso ma : lma) {
                List<Rolacceso> lra = ma.getRolaccesos();
                for (Rolacceso ra : lra) {
                    query = sesion.createQuery("delete from " + Funcionacceso.class.getName() + " x where x.rolacceso.id=" + ra.getId());
                    query.executeUpdate();
                    query = sesion.createQuery("delete from " + Rolacceso.class.getName() + " x where x.id=" + ra.getId());
                    query.executeUpdate();
                }
                query = sesion.createQuery("delete from " + Moduloacceso.class.getName() + " x where x.id=" + ma.getId());
                query.executeUpdate();
            }

            for (Moduloacceso ma : lm) {
                ma.setUsuario(u);
                sesion.save(ma);
                List<Rolacceso> lra = ma.getRolaccesos();
                for (Rolacceso ra : lra) {
                    ra.setModuloacceso(ma);
                    sesion.save(ra);
                    List<Funcionacceso> lfa = ra.getFuncionaccesos();
                    for (Funcionacceso fa : lfa) {
                        fa.setRolacceso(ra);
                        sesion.save(fa);
                    }
                }
            }
            tx.commit();
        } catch (Exception e) {
            u = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return u;
    }

    @Override
    public int eliminarUsuarioT(Colaborador c, Usuario u, List<Moduloacceso> lm) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;
        try {
            Query query;
            for (Moduloacceso m : lm) {
                List<Rolacceso> lr = m.getRolaccesos();
                for (Rolacceso ra : lr) {
                    query = sesion.createQuery("delete from " + Funcionacceso.class.getName() + " x where x.rolacceso.id=" + ra.getId());
                    query.executeUpdate();
                    query = sesion.createQuery("delete from " + Rolacceso.class.getName() + " x where x.id=" + ra.getId());
                    query.executeUpdate();
                }
                query = sesion.createQuery("delete from " + Moduloacceso.class.getName() + " x where x.id=" + m.getId());
                query.executeUpdate();
            }

            query = sesion.createQuery("delete from " + type.getName() + " x where x.id=" + u.getId());
            query.executeUpdate();
            query = sesion.createQuery("delete from " + Colaborador.class.getName() + " x where x.id=" + c.getId());
            r = query.executeUpdate();

            tx.commit();
        } catch (Exception e) {
            r = 0;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }

    @Override
    public Usuario registrarUsuario(Usuario u, List<Moduloacceso> lm) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        try {
            sesion.save(u);

            for (Moduloacceso ma : lm) {
                ma.setUsuario(u);
                sesion.save(ma);
                List<Rolacceso> lra = ma.getRolaccesos();
                for (Rolacceso ra : lra) {
                    ra.setModuloacceso(ma);
                    sesion.save(ra);
                    List<Funcionacceso> lfa = ra.getFuncionaccesos();
                    for (Funcionacceso fa : lfa) {
                        fa.setRolacceso(ra);
                        sesion.save(fa);
                    }
                }
            }

            tx.commit();
        } catch (Exception e) {
            u = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return u;
    }

    @Override
    public Usuario actualizarUsuario(Usuario u, List<Moduloacceso> lm, List<Moduloacceso> lma) {
        Session sesion = sesionFactory.openSession();
        Transaction tx = sesion.beginTransaction();

        Query query;
        try {
            sesion.clear();
            sesion.update(u);

            for (Moduloacceso ma : lma) {
                List<Rolacceso> lra = ma.getRolaccesos();
                for (Rolacceso ra : lra) {
                    query = sesion.createQuery("delete from " + Funcionacceso.class.getName() + " x where x.rolacceso.id=" + ra.getId());
                    query.executeUpdate();
                    query = sesion.createQuery("delete from " + Rolacceso.class.getName() + " x where x.id=" + ra.getId());
                    query.executeUpdate();
                }
                query = sesion.createQuery("delete from " + Moduloacceso.class.getName() + " x where x.id=" + ma.getId());
                query.executeUpdate();
            }

            for (Moduloacceso ma : lm) {
                ma.setUsuario(u);
                sesion.save(ma);
                List<Rolacceso> lra = ma.getRolaccesos();
                for (Rolacceso ra : lra) {
                    ra.setModuloacceso(ma);
                    sesion.save(ra);
                    List<Funcionacceso> lfa = ra.getFuncionaccesos();
                    for (Funcionacceso fa : lfa) {
                        fa.setRolacceso(ra);
                        sesion.save(fa);
                    }
                }
            }
            tx.commit();
        } catch (Exception e) {
            u = null;
            tx.rollback();
        } finally {
            sesion.close();
        }

        return u;
    }

    @Override
    public int eliminarUsuario(Usuario u, List<Moduloacceso> lm) {
        Session sesion = sesionFactory.openSession();
        sesion.beginTransaction().commit();
        Transaction tx = sesion.beginTransaction();

        int r = 0;
        try {
            Query query;
            for (Moduloacceso m : lm) {
                List<Rolacceso> lr = m.getRolaccesos();
                for (Rolacceso ra : lr) {
                    query = sesion.createQuery("delete from " + Funcionacceso.class.getName() + " x where x.rolacceso.id=" + ra.getId());
                    query.executeUpdate();
                    query = sesion.createQuery("delete from " + Rolacceso.class.getName() + " x where x.id=" + ra.getId());
                    query.executeUpdate();
                }
                query = sesion.createQuery("delete from " + Moduloacceso.class.getName() + " x where x.id=" + m.getId());
                query.executeUpdate();
            }

            query = sesion.createQuery("delete from " + type.getName() + " x where x.id=" + u.getId());
            r = query.executeUpdate();

            tx.commit();
        } catch (Exception e) {
            r = 0;
            tx.rollback();
        } finally {
            sesion.close();
        }
        return r;
    }
}
