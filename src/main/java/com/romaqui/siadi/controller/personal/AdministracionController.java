/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.personal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Dependencia;
import com.romaqui.siadi.service.DependenciaService;
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
 * @author NERIO
 */
@Controller("padministracionController")
@RequestMapping("personal/administracion")
public class AdministracionController {

    @Autowired
    DependenciaService dependenciaService;

    Gson gson;

    public AdministracionController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/paramspersonal", method = RequestMethod.GET)
    public String paramsPersonal(ModelMap m, HttpSession s) {
        return SessionUtil.sesion("personal/administracion/paramspersonal", s, "03", "01", "01", m);
    }

    @RequestMapping(value = "/registrardep", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarDep(@RequestBody Dependencia d, HttpSession s) {
        return gson.toJson(dependenciaService.create(d));
    }

    @RequestMapping(value = "/actualizardep", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarDep(@RequestBody Dependencia d, HttpSession s) {
        return gson.toJson(dependenciaService.update(d));
    }

    @RequestMapping(value = "/eliminardep", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarDep(@RequestBody Dependencia d, HttpSession s) {
        return gson.toJson(dependenciaService.delete(d.getId()));
    }

}
