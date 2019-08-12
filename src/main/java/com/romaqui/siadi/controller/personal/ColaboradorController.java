/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.personal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Colaborador;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Turno;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.entity.nuevo.ContratoTurno;
import com.romaqui.siadi.entity.nuevo.Data4;
import com.romaqui.siadi.service.ColaboradorService;
import com.romaqui.siadi.service.ContratoService;
import com.romaqui.siadi.service.TurnoService;
import com.romaqui.siadi.service.UsuarioService;
import com.romaqui.siadi.util.SessionUtil;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author nerio
 */
@Controller("pcolaboradorController")
@RequestMapping("personal/colaborador")
public class ColaboradorController {

    @Autowired
    UsuarioService usuarioService;
    @Autowired
    ColaboradorService colaboradorService;
    @Autowired
    ContratoService contratoService;
    @Autowired
    TurnoService turnoService;

    Gson gson;
    Gson gsond;

    public ColaboradorController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gsond = new GsonBuilder().setDateFormat("HH:mm a").create();
    }

    @RequestMapping(value = "/registro", method = RequestMethod.GET)
    public String registro(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("personal/colaborador/registro", s, "03", "02", "01", m);
    }

    @RequestMapping(value = "/registro", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registro(@RequestBody Colaborador c) {
        return gson.toJson(colaboradorService.create(c));
    }

    @RequestMapping(value = "/actualizar", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizar(@RequestBody Colaborador c) {
        return gson.toJson(colaboradorService.update(c));
    }

    @RequestMapping(value = "/eliminar", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminar(@RequestBody Colaborador c) {
        return colaboradorService.delete(c.getId());
    }

    @RequestMapping(value = "/registrout", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroUT(@RequestBody Data4 d) {
        return gson.toJson(usuarioService.registrarUsuarioT(d));
    }

    @RequestMapping(value = "/actualizarut", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarUT(@RequestBody Data4 d) {
        return gson.toJson(usuarioService.actualizarUsuarioT(d));
    }

    @RequestMapping(value = "/eliminarut", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarUT(@RequestBody Usuario u) {
        return usuarioService.eliminarUsuarioT(u);
    }

    @RequestMapping(value = "/contrato", method = RequestMethod.GET)
    public String contrato(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("personal/colaborador/contrato", s, "03", "02", "02", m);
    }

    @RequestMapping(value = "/registroc", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroC(@RequestBody ContratoTurno c) {
        return gson.toJson(contratoService.registrarContr(c.getContrato(), c.getListaturno()));
    }

    @RequestMapping(value = "/actualizarc", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarC(@RequestBody Contrato c) {
        return gson.toJson(contratoService.update(c));
    }

    @RequestMapping(value = "/eliminarc", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarC(@RequestBody Contrato c) {
        return contratoService.eliminarContr(c);
    }
    
    @RequestMapping(value = "/obtenerultimoc", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerUltimoC(@RequestBody Colaborador c) {
        return gson.toJson(contratoService.obtenerUltimo(c));
    }

    @RequestMapping(value = "/listart", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String listarT(@RequestBody Contrato c) {
        return gsond.toJson(turnoService.listarTurno(c));
    }

    @RequestMapping(value = "/registrart", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarT(@RequestBody Turno t) {
        if (!turnoService.existeTurno(t)) {
            return gsond.toJson(turnoService.create(t));
        } else {
            return gsond.toJson(null);
        }
    }

    @RequestMapping(value = "/actualizart", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarT(@RequestBody Turno t) {
        return gsond.toJson(turnoService.update(t));
    }

    @RequestMapping(value = "/eliminart", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarT(@RequestBody Turno t) {
        return gson.toJson(turnoService.delete(t.getId()));
    }

    @RequestMapping(value = "/usuario", method = RequestMethod.GET)
    public String usuario(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("personal/colaborador/usuario", s, "03", "02", "03", m);
    }

    @RequestMapping(value = "/registrou", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroU(@RequestBody Data4 d) {
        return gson.toJson(usuarioService.registrarUsuario(d));
    }

    @RequestMapping(value = "/actualizaru", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarU(@RequestBody Data4 d) {
        return gson.toJson(usuarioService.actualizarUsuario(d));
    }

    @RequestMapping(value = "/eliminaru", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarU(@RequestBody Usuario u) {
        return usuarioService.eliminarUsuario(u);
    }

    @RequestMapping(value = "/buscarcol", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarCol(@RequestBody Colaborador c) {
        return gson.toJson(colaboradorService.buscarColaborador(c));
    }

}
