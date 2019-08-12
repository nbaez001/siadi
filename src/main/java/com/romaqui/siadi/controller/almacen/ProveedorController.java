/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.almacen;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.nuevo.Data;
import com.romaqui.siadi.entity.nuevo.Data2;
import com.romaqui.siadi.service.ProveedorService;
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
 * @author nerio
 */
@Controller("aproveedorController")
@RequestMapping("almacen/proveedor")
public class ProveedorController {

    @Autowired
    ProveedorService proveedorService;
    Gson gson;

    public ProveedorController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/proveedornatural", method = RequestMethod.GET)
    public String proveedornatural(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/proveedor/proveedornatural", s, "01", "02", "01", m);
    }

    @RequestMapping(value = "/proveedornatural", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String proveedornatural(@RequestBody Proveedor p) {
        return gson.toJson(proveedorService.registrarProveedornatural(p));
    }

    @RequestMapping(value = "/eliminarpn", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarpn(@RequestBody Proveedor p) {
        return proveedorService.eliminarProveedornatural(p);
    }

    @RequestMapping(value = "/actualizarpn", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarpn(@RequestBody Proveedor p) {
        return gson.toJson(proveedorService.actualizarProveedornatural(p));
    }

    @RequestMapping(value = "/proveedorjuridico", method = RequestMethod.GET)
    public String proveedorjuridico(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/proveedor/proveedorjuridico", s, "01", "02", "02", m);
    }

    @RequestMapping(value = "/proveedorjuridico", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String proveedorjuridico(@RequestBody Data data) {
        return gson.toJson(proveedorService.registrarProveedorjuridico(data));
    }

    @RequestMapping(value = "/eliminarpj", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarpj(@RequestBody Proveedor p) {
        return proveedorService.eliminarProveedorjuridico(p);
    }

    @RequestMapping(value = "/actualizarpj", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarPJ(@RequestBody Data2 data2) {
        return gson.toJson(proveedorService.actualizarProveedorjuridico(data2));
    }

    @RequestMapping(value = "/obtcodigoprov", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int obtenerCodigoproveedor(@RequestBody Tablamaestra tm) {
        return proveedorService.obtenerCodigoproveedor(tm);
    }

    @RequestMapping(value = "/fichapj", method = RequestMethod.GET)
    public void fichapj(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");

                Map<String, Object> params = new HashMap<>();
                params.put("idProveedor", id);

                String pathReporte = applicationPath + "/assets/report/fichapj.jasper";

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

    @RequestMapping(value = "/fichapn", method = RequestMethod.GET)
    public void fichapn(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");

                Map<String, Object> params = new HashMap<>();
                params.put("idProveedor", id);

                String pathReporte = applicationPath + "/assets/report/fichapn.jasper";

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
