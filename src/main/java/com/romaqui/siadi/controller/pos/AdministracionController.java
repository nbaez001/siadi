/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.pos;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Bobeda;
import com.romaqui.siadi.entity.Caja;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Transferencia;
import com.romaqui.siadi.service.BobedaService;
import com.romaqui.siadi.service.CajaService;
import com.romaqui.siadi.service.CajeroService;
import com.romaqui.siadi.service.ComprobanteService;
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
@Controller("posadministracionController")
@RequestMapping("pos/administracion")
public class AdministracionController {

    @Autowired
    ComprobanteService comprobanteService;
    @Autowired
    CajaService cajaService;
    @Autowired
    BobedaService bobedaService;
    @Autowired
    CajeroService cajeroService;

    Gson gson;

    public AdministracionController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/paramsventa", method = RequestMethod.GET)
    public String paramsVenta(ModelMap m, HttpSession s) {
        return SessionUtil.sesion("pos/administracion/paramsventa", s, "02", "01", "01", m);
    }

    @RequestMapping(value = "/registrarca", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarCA(@RequestBody Caja c, HttpSession s) {
        return gson.toJson(cajaService.create(c));
    }

    @RequestMapping(value = "/actualizarca", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarCA(@RequestBody Caja c, HttpSession s) {
        return gson.toJson(cajaService.update(c));
    }

    @RequestMapping(value = "/eliminarca", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarCA(@RequestBody Caja c, HttpSession s) {
        return gson.toJson(cajaService.delete(c.getId()));
    }

    @RequestMapping(value = "/comprobante", method = RequestMethod.GET)
    public String comprobante(ModelMap m, HttpSession s) {
        return SessionUtil.sesion("pos/administracion/comprobante", s, "02", "01", "02", m);
    }

    @RequestMapping(value = "/registrarc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarC(@RequestBody Comprobante c, HttpSession s) {
        return gson.toJson(comprobanteService.create(c));
    }

    @RequestMapping(value = "/actualizarc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarC(@RequestBody Comprobante c, HttpSession s) {
        return gson.toJson(comprobanteService.update(c));
    }

    @RequestMapping(value = "/eliminarc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarC(@RequestBody Comprobante c, HttpSession s) {
        return gson.toJson(comprobanteService.delete(c.getId()));
    }

    @RequestMapping(value = "/bobeda", method = RequestMethod.GET)
    public String bobeda(ModelMap m, HttpSession s) {
        return SessionUtil.sesion("pos/administracion/bobeda", s, "02", "01", "03", m);
    }

    @RequestMapping(value = "/obtenerbob", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerBob(@RequestBody Agencia a, HttpSession s) {
        return gson.toJson(bobedaService.obtenerBobeda(a));
    }

    @RequestMapping(value = "/registrobob", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroBob(@RequestBody Bobeda b, HttpSession s) {
        return gson.toJson(bobedaService.crearBobeda(b));
    }

    @RequestMapping(value = "/eliminarbob", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarBob(@RequestBody Bobeda b, HttpSession s) {
        return gson.toJson(bobedaService.delete(b.getId()));
    }

    @RequestMapping(value = "/registrarcaj", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarCaj(@RequestBody Transferencia t, HttpSession s) {
        return gson.toJson(cajeroService.crearCajero(t));
    }

    @RequestMapping(value = "/eliminarcaj", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarCaj(@RequestBody Cajero c, HttpSession s) {
        return gson.toJson(cajeroService.delete(c.getId()));
    }
    
    @RequestMapping(value = "/confcierrecajero", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String confcierreCajero(@RequestBody Transferencia tr) {
        return gson.toJson(cajeroService.cerrarCajero(tr));
    }
}
