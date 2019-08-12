/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.entity.nuevo.Data4;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nerio
 */
public interface UsuarioService extends GenericService<Usuario> {

    Usuario buscarPorNombre(String usuario);

    Usuario autenticar(Usuario u, HttpSession s);

    Usuario autenticaradmin(Usuario u, HttpSession s);

    List<Usuario> listarUsuarios(Agencia a);

    List<Usuario> listarUsuarioscaja(Agencia a);

    Usuario registrarUsuarioT(Data4 d);

    Usuario actualizarUsuarioT(Data4 d);

    int eliminarUsuarioT(Usuario u);

    Usuario registrarUsuario(Data4 d);

    Usuario actualizarUsuario(Data4 d);

    int eliminarUsuario(Usuario u);

    boolean existeUsuario(String p);
}
