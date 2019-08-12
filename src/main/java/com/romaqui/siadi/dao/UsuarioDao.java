/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Colaborador;
import com.romaqui.siadi.entity.Moduloacceso;
import com.romaqui.siadi.entity.Usuario;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface UsuarioDao extends GenericDao<Usuario> {

    Usuario registrarUsuarioT(Colaborador c, Usuario u, List<Moduloacceso> lm);

    Usuario actualizarUsuarioT(Colaborador c, Usuario u, List<Moduloacceso> lm, List<Moduloacceso> lma);

    int eliminarUsuarioT(Colaborador c, Usuario u, List<Moduloacceso> lm);

    Usuario registrarUsuario(Usuario u, List<Moduloacceso> lm);

    Usuario actualizarUsuario(Usuario u, List<Moduloacceso> lm, List<Moduloacceso> lma);

    int eliminarUsuario(Usuario u, List<Moduloacceso> lm);
}
