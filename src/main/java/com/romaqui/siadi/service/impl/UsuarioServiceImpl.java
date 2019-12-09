/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.CajeroDao;
import com.romaqui.siadi.dao.FuncionaccesoDao;
import com.romaqui.siadi.dao.ModuloaccesoDao;
import com.romaqui.siadi.dao.RolaccesoDao;
import com.romaqui.siadi.dao.UsuarioDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Funcion;
import com.romaqui.siadi.entity.Funcionacceso;
import com.romaqui.siadi.entity.Modulo;
import com.romaqui.siadi.entity.Moduloacceso;
import com.romaqui.siadi.entity.Rol;
import com.romaqui.siadi.entity.Rolacceso;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.entity.nuevo.Data4;
import com.romaqui.siadi.service.UsuarioService;
import com.romaqui.siadi.util.HashUtil;
import com.romaqui.siadi.util.SessionUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class UsuarioServiceImpl extends GenericServiceImpl<Usuario> implements UsuarioService {

    @Autowired
    UsuarioDao usuarioDao;
    @Autowired
    ModuloaccesoDao moduloaccesoDao;
    @Autowired
    RolaccesoDao rolaccesoDao;
    @Autowired
    FuncionaccesoDao funcionaccesoDao;
    @Autowired
    CajeroDao cajeroDao;

    @Override
    public Usuario buscarPorNombre(String usuario) {
        return (Usuario) usuarioDao.consultUnique("from Usuario u where u.usuario='" + usuario + "'");
    }

    @Override
    public Usuario autenticar(Usuario u, HttpSession session) {
        Usuario user = (Usuario) usuarioDao.consultUnique("from Usuario u where u.usuario='" + u.getUsuario() + "' and u.contrasena='" + HashUtil.getStringMessageDigest(u.getContrasena(), HashUtil.MD5) + "' and u.colaborador.agencia=" + u.getColaborador().getAgencia().getId());
        if (user != null) {
            List<Moduloacceso> lma = moduloaccesoDao.consultList("from Moduloacceso ma where ma.usuario.id=" + user.getId());
            for (Moduloacceso ma : lma) {
                ma.setUsuario(null);
                List<Rolacceso> lra = rolaccesoDao.consultList("from Rolacceso ra where ra.moduloacceso.id=" + ma.getId());
                for (Rolacceso ra : lra) {
                    ra.setModuloacceso(null);
                    List<Funcionacceso> lfa = funcionaccesoDao.consultList("from Funcionacceso fa where fa.rolacceso.id=" + ra.getId());
                    for (Funcionacceso fa : lfa) {
                        fa.setRolacceso(null);
                        ra.setFuncionaccesos(lfa);
                    }
                }
                ma.setRolaccesos(lra);
            }
            user.setModuloaccesos(lma);

            //PARA AUTENTICACION APP DESKTOP
            if (session != null) {
                session.setAttribute("user", user);
                session.setAttribute("agencia", u.getColaborador().getAgencia());
            }
            return user;
        } else {
            return null;
        }
    }

    @Override
    public List<Usuario> listarUsuarios(Agencia a) {
        return usuarioDao.consultList("from Usuario u where u.colaborador.agencia.id=" + a.getId());
    }

    @Override
    public List<Usuario> listarUsuarioscaja(Agencia a) {
        List<Integer> li = cajeroDao.consultList("select c.idusuario from Cajero c where c.caja.agencia.id=" + a.getId() + " and c.pendiente=true");
        String sql = "";
        for (Integer i : li) {
            sql += " and ma.usuario.id!=" + i;
        }
        return moduloaccesoDao.consultList("select ma.usuario from Moduloacceso ma where ma.codigo='02' and ma.usuario.colaborador.agencia.id=" + a.getId() + sql);
    }

    @Override
    public Usuario autenticaradmin(Usuario u, HttpSession s) {
        if (u.getUsuario().equals(SessionUtil.user.getUsuario()) && HashUtil.getStringMessageDigest(u.getContrasena(), HashUtil.MD5).equals(SessionUtil.user.getContrasena())) {
            s.setAttribute("user", SessionUtil.user);
            return SessionUtil.user;
        } else {
            return null;
        }
    }

    @Override
    public Usuario registrarUsuarioT(Data4 d) {
        d.getUsuario().setContrasena(HashUtil.getStringMessageDigest(d.getUsuario().getContrasena(), HashUtil.MD5));

        List<Modulo> lm = d.getLm();
        List<Moduloacceso> lma = new ArrayList<>();

        for (Modulo m : lm) {
            List<Rol> lr = m.getRoles();
            List<Rolacceso> lra = new ArrayList<>();
            for (Rol r : lr) {
                List<Funcion> lf = r.getFunciones();
                List<Funcionacceso> lfa = new ArrayList<>();
                if (lf != null) {
                    for (Funcion f : lf) {
                        if (f.isEstado() == true) {
                            lfa.add(new Funcionacceso(0, null, f.getNombre(), f.getCodigo(), f.getRuta(), f.getIcono(), f.isEstado()));
                        }
                    }
                    if (lfa.size() > 0) {
                        Rolacceso ra = new Rolacceso(0, null, r.getNombre(), r.getCodigo(), r.getRuta(), r.getIcono(), true, lfa);
                        lra.add(ra);
                    }
                }
            }
            if (lra.size() > 0) {
                Moduloacceso ma = new Moduloacceso(0, null, m.getNombre(), m.getCodigo(), m.getRuta(), m.getIcono(), true, lra);
                lma.add(ma);
            }
        }

        return usuarioDao.registrarUsuarioT(d.getUsuario().getColaborador(), d.getUsuario(), lma);
    }

    @Override
    public Usuario actualizarUsuarioT(Data4 d) {
        d.getUsuario().setContrasena(HashUtil.getStringMessageDigest(d.getUsuario().getContrasena(), HashUtil.MD5));

        List<Modulo> lm = d.getLm();
        List<Moduloacceso> lma = new ArrayList<>();

        List<Moduloacceso> lmac = moduloaccesoDao.consultList("from Moduloacceso ma where ma.usuario.id=" + d.getUsuario().getId());
        for (Moduloacceso mac : lmac) {
            List<Rolacceso> lrac = rolaccesoDao.consultList("from Rolacceso ra where ra.moduloacceso.id=" + mac.getId());
            mac.setRolaccesos(lrac);
        }

        for (Modulo m : lm) {
            List<Rol> lr = m.getRoles();
            List<Rolacceso> lra = new ArrayList<>();
            for (Rol r : lr) {
                List<Funcion> lf = r.getFunciones();
                List<Funcionacceso> lfa = new ArrayList<>();
                if (lf != null) {
                	for (Funcion f : lf) {
                		if (f.isEstado() == true) {
                			lfa.add(new Funcionacceso(0, null, f.getNombre(), f.getCodigo(), f.getRuta(), f.getIcono(), f.isEstado()));
                		}
                	}
                	if (lfa.size() > 0) {
                		Rolacceso ra = new Rolacceso(0, null, r.getNombre(), r.getCodigo(), r.getRuta(), r.getIcono(), true, lfa);
                		lra.add(ra);
                	}
                }
            }
            if (lra.size() > 0) {
                Moduloacceso ma = new Moduloacceso(0, null, m.getNombre(), m.getCodigo(), m.getRuta(), m.getIcono(), true, lra);
                lma.add(ma);
            }
        }

        return usuarioDao.actualizarUsuarioT(d.getUsuario().getColaborador(), d.getUsuario(), lma, lmac);
    }

    @Override
    public int eliminarUsuarioT(Usuario u) {
        List<Moduloacceso> lmac = moduloaccesoDao.consultList("from Moduloacceso ma where ma.usuario.id=" + u.getId());
        for (Moduloacceso mac : lmac) {
            List<Rolacceso> lrac = rolaccesoDao.consultList("from Rolacceso ra where ra.moduloacceso.id=" + mac.getId());
            mac.setRolaccesos(lrac);
        }
        return usuarioDao.eliminarUsuarioT(u.getColaborador(), u, lmac);
    }

    @Override
    public Usuario registrarUsuario(Data4 d) {
        d.getUsuario().setContrasena(HashUtil.getStringMessageDigest(d.getUsuario().getContrasena(), HashUtil.MD5));

        List<Modulo> lm = d.getLm();
        List<Moduloacceso> lma = new ArrayList<>();

        for (Modulo m : lm) {
            List<Rol> lr = m.getRoles();
            List<Rolacceso> lra = new ArrayList<>();
            for (Rol r : lr) {
                List<Funcion> lf = r.getFunciones();
                List<Funcionacceso> lfa = new ArrayList<>();
                for (Funcion f : lf) {
                    if (f.isEstado() == true) {
                        lfa.add(new Funcionacceso(0, null, f.getNombre(), f.getCodigo(), f.getRuta(), f.getIcono(), f.isEstado()));
                    }
                }
                if (lfa.size() > 0) {
                    Rolacceso ra = new Rolacceso(0, null, r.getNombre(), r.getCodigo(), r.getRuta(), r.getIcono(), true, lfa);
                    lra.add(ra);
                }
            }
            if (lra.size() > 0) {
                Moduloacceso ma = new Moduloacceso(0, null, m.getNombre(), m.getCodigo(), m.getRuta(), m.getIcono(), true, lra);
                lma.add(ma);
            }
        }

        return usuarioDao.registrarUsuario(d.getUsuario(), lma);
    }

    @Override
    public Usuario actualizarUsuario(Data4 d) {
        d.getUsuario().setContrasena(HashUtil.getStringMessageDigest(d.getUsuario().getContrasena(), HashUtil.MD5));

        List<Modulo> lm = d.getLm();
        List<Moduloacceso> lma = new ArrayList<>();

        List<Moduloacceso> lmac = moduloaccesoDao.consultList("from Moduloacceso ma where ma.usuario.id=" + d.getUsuario().getId());
        for (Moduloacceso mac : lmac) {
            List<Rolacceso> lrac = rolaccesoDao.consultList("from Rolacceso ra where ra.moduloacceso.id=" + mac.getId());
            mac.setRolaccesos(lrac);
        }

        for (Modulo m : lm) {
            List<Rol> lr = m.getRoles();
            List<Rolacceso> lra = new ArrayList<>();
            for (Rol r : lr) {
                List<Funcion> lf = r.getFunciones();
                List<Funcionacceso> lfa = new ArrayList<>();
                for (Funcion f : lf) {
                    if (f.isEstado() == true) {
                        lfa.add(new Funcionacceso(0, null, f.getNombre(), f.getCodigo(), f.getRuta(), f.getIcono(), f.isEstado()));
                    }
                }
                if (lfa.size() > 0) {
                    Rolacceso ra = new Rolacceso(0, null, r.getNombre(), r.getCodigo(), r.getRuta(), r.getIcono(), true, lfa);
                    lra.add(ra);
                }
            }
            if (lra.size() > 0) {
                Moduloacceso ma = new Moduloacceso(0, null, m.getNombre(), m.getCodigo(), m.getRuta(), m.getIcono(), true, lra);
                lma.add(ma);
            }
        }

        return usuarioDao.actualizarUsuario(d.getUsuario(), lma, lmac);
    }

    @Override
    public int eliminarUsuario(Usuario u) {
        List<Moduloacceso> lmac = moduloaccesoDao.consultList("from Moduloacceso ma where ma.usuario.id=" + u.getId());
        for (Moduloacceso mac : lmac) {
            List<Rolacceso> lrac = rolaccesoDao.consultList("from Rolacceso ra where ra.moduloacceso.id=" + mac.getId());
            mac.setRolaccesos(lrac);
        }
        return usuarioDao.eliminarUsuario(u, lmac);
    }

    @Override
    public boolean existeUsuario(String p) {
        int dato;
        try {
            dato = Integer.parseInt(usuarioDao.consultUnique("select count(u) from Usuario u where u.usuario='" + p + "'").toString());
        } catch (Exception e) {
            dato = 0;
        }
        return dato <= 0;
    }
}
