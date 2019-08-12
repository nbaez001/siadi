/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.pos;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.nuevo.ClienteRepresentlegal;
import com.romaqui.siadi.service.ClienteService;
import com.romaqui.siadi.util.ConectionUtil;
import com.romaqui.siadi.util.ReportUtil;
import com.romaqui.siadi.util.SessionUtil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author NERIO
 */
@Controller("posclienteController")
@RequestMapping("pos/cliente")
public class ClienteController {

    @Autowired
    ClienteService clienteService;
    Gson gson;

    public ClienteController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/natural", method = RequestMethod.GET)
    public String clientenatural(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("pos/cliente/clientenatural", s, "02", "02", "01", m);
    }

    @RequestMapping(value = "/natural", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String clientenatural(@RequestBody Cliente c) {
        return gson.toJson(clienteService.registrarClientenatural(c));
    }

    @RequestMapping(value = "/eliminarcn", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarCN(@RequestBody Cliente c) {
        return clienteService.eliminarClientenatural(c);
    }

    @RequestMapping(value = "/actualizarcn", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarpn(@RequestBody Cliente c) {
        return gson.toJson(clienteService.actualizarClientenatural(c));
    }

    @RequestMapping(value = "/juridico", method = RequestMethod.GET)
    public String clientejuridico(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("pos/cliente/clientejuridico", s, "02", "02", "02", m);
    }

    @RequestMapping(value = "/juridico", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String clientejuridico(@RequestBody ClienteRepresentlegal crl) {
        return gson.toJson(clienteService.registrarClientejuridico(crl));
    }

    @RequestMapping(value = "/eliminarcj", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarcj(@RequestBody Cliente c) {
        return clienteService.eliminarClientejuridico(c);
    }

    @RequestMapping(value = "/actualizarcj", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarCJ(@RequestBody Cliente c) {
        return gson.toJson(clienteService.actualizarClientejuridico(c));
    }

    @RequestMapping(value = "/obtcodigoclient", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int obtenerCodigocliente(@RequestBody Tablamaestra tm) {
        return clienteService.obtenerCodigocliente(tm);
    }

    @RequestMapping(value = "/fichacj", method = RequestMethod.GET)
    public void fichaCJ(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException, JRException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");

                Map<String, Object> params = new HashMap<>();
                params.put("idCliente", id);

                String pathReporte = applicationPath + "/assets/report/fichacj.jasper";

                ConectionUtil conexion = new ConectionUtil();

                JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

                conexion.cerrarConexion();

                ByteArrayOutputStream baos = new ByteArrayOutputStream();

                ReportUtil util = new ReportUtil();
                util.export(type, jp, response, baos);
                util.write("file002", response, baos);
            } catch (JRException jre) {
                System.out.println("Unable to process download");
                throw new RuntimeException(jre);
            }
        } else {
            response.getWriter().write("<h4>La sesion ha expirado, vuelva a autenticarse... </h4><a href='" + request.getContextPath() + "/login'>Aqui</a>");
        }
    }

    @RequestMapping(value = "/fichacn", method = RequestMethod.GET)
    public void fichaCN(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");

                Map<String, Object> params = new HashMap<>();
                params.put("idProveedor", id);

                String pathReporte = applicationPath + "/assets/report/fichacn.jasper";

                ConectionUtil conexion = new ConectionUtil();

                JasperPrint jp = JasperFillManager.fillReport(pathReporte, params, conexion.getConexion());

                conexion.cerrarConexion();

                ByteArrayOutputStream baos = new ByteArrayOutputStream();

                ReportUtil util = new ReportUtil();
                util.export(type, jp, response, baos);
                util.write("file002", response, baos);
            } catch (JRException jre) {
                System.out.println("Unable to process download");
                throw new RuntimeException(jre);
            }
        } else {
            response.getWriter().write("<h4>La sesion ha expirado, vuelva a autenticarse... </h4><a href='" + request.getContextPath() + "/login'>Aqui</a>");
        }
    }

}
