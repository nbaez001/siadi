/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.service.AgenciaService;
import com.romaqui.siadi.service.ContratoService;
import com.romaqui.siadi.service.UsuarioService;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
@Controller
public class IndexController {

    @Autowired
    AgenciaService empresaService;
    @Autowired
    UsuarioService usuarioService;
    @Autowired
    ContratoService contratoService;

    Gson gson;

    public IndexController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(HttpSession session) {
        if (empresaService.existeInitParams()) {
            Usuario user = (Usuario) session.getAttribute("user");
            if (user != null) {
                return "redirect:/modulos";
            } else {
                return "redirect:/login";
            }
        } else {
            return "redirect:/initparams";
        }
    }

    @RequestMapping(value = "/initparams", method = RequestMethod.GET)
    public String initParams(HttpSession s) {
        Usuario user = (Usuario) s.getAttribute("user");
        if (user != null) {
            return "initparams";
        } else {
            return "redirect:/loginadmin";
        }
    }

    @RequestMapping(value = "/registrarinitparams", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String regInitParams(Agencia e, @RequestParam(value = "file", required = true) MultipartFile file, HttpServletRequest request) {
        return gson.toJson(empresaService.registrarAgencia(e, file, request));
    }

    @RequestMapping(value = "/actualizarinitparams", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actInitParams(Agencia e, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
        return gson.toJson(empresaService.actualizarAgencia(e, file, request));
    }

    @RequestMapping(value = "/eliminarinitparams", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int delInitParams(@RequestBody Agencia e) {
        return empresaService.delete(e.getId());
    }

    @RequestMapping(value = "/modulos", method = RequestMethod.GET)
    public String index(HttpSession session) {
        Usuario user = (Usuario) session.getAttribute("user");
        if (user != null) {
            return "modulos";
        } else {
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody Usuario u, HttpSession session) {
        return gson.toJson(usuarioService.autenticar(u, session));
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpSession session) {
        session.setAttribute("user", null);
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/loginadmin", method = RequestMethod.GET)
    public String loginadmin() {
        return "loginadmin";
    }

    @RequestMapping(value = "/loginadmin", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String loginadmin(@RequestBody Usuario u, HttpSession session) {
        return gson.toJson(usuarioService.autenticaradmin(u, session));
    }

    @RequestMapping(value = "/session", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String getSession(HttpSession session) {
        Usuario u = (Usuario) session.getAttribute("user");
        if (u != null) {
            return gson.toJson(new Usuario(u.getId(), null, u.getUsuario(), u.getContrasena(), true, u.getIdusuariocrea(), u.getFechusuariocrea()));
        } else {
            return gson.toJson(null);
        }
    }

    @RequestMapping(value = "/sessionagencia", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String getSessionagencia(HttpSession session) {
        Usuario u = (Usuario) session.getAttribute("user");
        if (u != null) {
            return gson.toJson(u.getColaborador().getAgencia());
        } else {
            return gson.toJson(null);
        }
    }

    @RequestMapping(value = "/sessioncajero", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String getCajero(HttpSession session) {
        Cajero c = (Cajero) session.getAttribute("cajero");
        if (c != null) {
            return gson.toJson(c);
        } else {
            return gson.toJson(null);
        }
    }

    @RequestMapping(value = "/existeusuario", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public String existeUsuario(String usuario) {
        return gson.toJson(usuarioService.existeUsuario(usuario));
    }

    @RequestMapping(value = "/existeusuarioa", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public String existeUsuario(String usuario, String actual) {
        if (usuario.equals(actual)) {
            return gson.toJson(true);
        } else {
            return gson.toJson(usuarioService.existeUsuario(usuario));
        }
    }

    @RequestMapping(value = "/sessioncontrato", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String getContrato(HttpSession s) {
        Usuario u = (Usuario) s.getAttribute("user");
        Contrato c = contratoService.obtenerUltimo(u.getColaborador());
        if (c != null) {
            return gson.toJson(c);
        } else {
            return gson.toJson(null);
        }
    }
}
