/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.almacen;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Producto;
import com.romaqui.siadi.service.ProductoService;
import com.romaqui.siadi.util.ConectionUtil;
import com.romaqui.siadi.util.ReportUtil;
import com.romaqui.siadi.util.SessionUtil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
@Controller("areporteController")
@RequestMapping("almacen/reporte")
public class ReporteController {

    @Autowired
    ProductoService productoService;

    Gson gson;

    public ReporteController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/movimientos", method = RequestMethod.GET)
    public String movimientos(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/reporte/movimientos", s, "01", "04", "01", m);
    }

    @RequestMapping(value = "/kardex", method = RequestMethod.GET)
    public String kardex(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/reporte/kardex", s, "01", "04", "02", m);
    }

    @RequestMapping(value = "/preformato121", method = RequestMethod.GET)
    public String preformato121(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/reporte/preformato121", s, "01", "04", "03", m);
    }

    @RequestMapping(value = "/formato121", method = RequestMethod.GET)
    public String formato121(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/reporte/formato121", s, "01", "04", "03", m);
    }

    @RequestMapping(value = "/formato121", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public List<String> formato121(@RequestBody Producto p) {
        return productoService.listarMovimientos(p);
    }

    @RequestMapping(value = "/preformato131", method = RequestMethod.GET)
    public String preformato131(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/reporte/preformato131", s, "01", "04", "04", m);
    }

    @RequestMapping(value = "/formato131", method = RequestMethod.GET)
    public String formato131(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/reporte/formato131", s, "01", "04", "04", m);
    }

    @RequestMapping(value = "/formato131", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public List<String> formato131(@RequestBody Producto p) {
        return productoService.listarMovimientosvalorizados(p);
    }

    @RequestMapping(value = "/rmovimientos", method = RequestMethod.GET)
    public void rMovimientos(@RequestParam String type, @RequestParam int cuatrimestre, @RequestParam int anio, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");
                Map<String, Object> params = new HashMap<>();
                params.put("SUBREPORT_DIR", applicationPath + "/assets/report/");

                switch (cuatrimestre) {
                    case 1:
                        params.put("anio", anio);
                        params.put("titulo", "ENERO A ABRIL");
                        params.put("mes0", 0);
                        params.put("mes1", 1);
                        params.put("mes2", 2);
                        params.put("mes3", 3);
                        params.put("fecha0", new Date(anio + "/01/01"));
                        params.put("fecha1", new Date(anio + "/02/01"));
                        params.put("fecha2", new Date(anio + "/03/01"));
                        params.put("fecha3", new Date(anio + "/04/01"));
                        params.put("fecha4", new Date(anio + "/05/01"));
                        break;
                    case 2:
                        params.put("anio", anio);
                        params.put("titulo", "MAYO A AGOSTO");
                        params.put("mes0", 4);
                        params.put("mes1", 5);
                        params.put("mes2", 6);
                        params.put("mes3", 7);
                        params.put("fecha0", new Date(anio + "/05/01"));
                        params.put("fecha1", new Date(anio + "/06/01"));
                        params.put("fecha2", new Date(anio + "/07/01"));
                        params.put("fecha3", new Date(anio + "/08/01"));
                        params.put("fecha4", new Date(anio + "/09/01"));
                        break;
                    default:
                        params.put("anio", anio);
                        params.put("titulo", "SEPTIEMBRE A DICIEMBRE");
                        params.put("mes0", 8);
                        params.put("mes1", 9);
                        params.put("mes2", 10);
                        params.put("mes3", 11);
                        params.put("fecha0", new Date(anio + "/09/01"));
                        params.put("fecha1", new Date(anio + "/10/01"));
                        params.put("fecha2", new Date(anio + "/11/01"));
                        params.put("fecha3", new Date(anio + "/12/01"));
                        params.put("fecha4", new Date((anio + 1) + "/01/01"));
                        break;
                }

                String pathReporte = applicationPath + "/assets/report/rmovimientos.jasper";

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

    //reporte para el kardex
    @RequestMapping(value = "/rkardex", method = RequestMethod.GET)
    public void rKardex(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");
                Map<String, Object> params = new HashMap<>();
                params.put("SUBREPORT_DIR", applicationPath + "/assets/report/");

                String pathReporte;
                if (id == 0) {
                    pathReporte = applicationPath + "/assets/report/rkardex.jasper";
                } else {
                    pathReporte = applicationPath + "/assets/report/rkardexc.jasper";
                    params.put("idCategoria", id);
                }

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
