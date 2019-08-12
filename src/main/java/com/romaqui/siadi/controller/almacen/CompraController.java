/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.almacen;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Detallecompra;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Proveedornatural;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.nuevo.Data6;
import com.romaqui.siadi.service.CompraService;
import com.romaqui.siadi.service.DetallecompraService;
import com.romaqui.siadi.service.DetallemovimientoService;
import com.romaqui.siadi.service.InventarioService;
import com.romaqui.siadi.service.ProveedorService;
import com.romaqui.siadi.util.ConectionUtil;
import com.romaqui.siadi.util.ReportUtil;
import com.romaqui.siadi.util.SessionUtil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
@Controller("acompraController")
@RequestMapping("almacen/compra")
public class CompraController {

    @Autowired
    ProveedorService proveedorService;
    @Autowired
    CompraService compraService;
    @Autowired
    DetallemovimientoService detallemovimientoService;
    @Autowired
    DetallecompraService detallecompraService;
    @Autowired
    InventarioService inventarioService;

    Gson gson;

    public CompraController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @InitBinder
    public void dataBinding(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "fechacompra", new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class, "fechaalmacenamiento", new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/registro", method = RequestMethod.GET)
    public String registro(HttpSession s, ModelMap m) {
        s.setAttribute("ldc", null);
        return SessionUtil.sesion("almacen/compra/registro", s, "01", "03", "01", m);
    }

    @RequestMapping(value = "/registro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registro(Compra c, @RequestParam(value = "comprobante", required = false) MultipartFile comp, @RequestParam(value = "ordencompra", required = false) MultipartFile ordc, HttpServletRequest hsr, HttpSession sesion) {
        List<Detallecompra> ldc = (List<Detallecompra>) sesion.getAttribute("ldc");
        if (ldc == null) {
            return gson.toJson(null);
        } else {
            if (ldc.size() > 0) {
                return gson.toJson(compraService.registrarCompra(c, comp, ordc, ldc, hsr));
            } else {
                return gson.toJson(null);
            }
        }
    }

    @RequestMapping(value = "/eliminarcompra", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarcompra(@RequestBody Compra c) {
        return compraService.eliminarCompra(c);
    }

    @RequestMapping(value = "/agregardetallecompra", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int agregarDetallecompra(@RequestBody List<Detallecompra> ldc, HttpSession sesion) {
        try {
            sesion.setAttribute("ldc", ldc);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    @RequestMapping(value = "/obtcodigocomp", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int obtCodigocomp(@RequestBody Agencia a) {
        return compraService.obtenerCodigocompra(a);
    }

    @RequestMapping(value = "/buscarproveedor", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarProveedor(@RequestBody Proveedor p) {
        List<Proveedor> lp = proveedorService.listarProveedorjuridico(p);
        List<Proveedor> lpn = proveedorService.listarProveedornatural(p);

        lp.addAll(lpn);
        return gson.toJson(lp);
    }

    @RequestMapping(value = "/almacenamiento", method = RequestMethod.GET)
    public String almacenamiento(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/compra/almacenamiento", s, "01", "03", "02", m);
    }

    @RequestMapping(value = "/almacenamiento", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int almacenamiento(@RequestBody Data6 d) {
        return inventarioService.registrarIngreso(d.getCompra(), d.getLi());
    }

    @RequestMapping(value = "/buscarcompraf", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarcompraf(@RequestBody Compra c) {
        return gson.toJson(compraService.listarCompraFechas(c));
    }

    @RequestMapping(value = "/buscarcomprap", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarcomprapj(@RequestBody Compra c) {
        List<Compra> lc = compraService.listarCompraPJ(c);
        lc.addAll(compraService.listarCompraPN(c));
        return gson.toJson(lc);
    }

    @RequestMapping(value = "/buscarcomprac", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarcomprac(@RequestBody Compra c) {
        return gson.toJson(compraService.listarCompraCodigo(c));
    }

    @RequestMapping(value = "/listardetallecompra", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String listardetallecompra(@RequestBody Compra c) {
        return gson.toJson(detallecompraService.listarPorCompra(c));
    }

    @RequestMapping(value = "/rcompra", method = RequestMethod.GET)
    public void rcompra(@RequestParam String type, @RequestParam int id, @RequestParam int idtipoproveedor, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");

                Map<String, Object> params = new HashMap<>();
                params.put("idCompra", id);

                String pathReporte;
                if (idtipoproveedor == 1) {
                    pathReporte = applicationPath + "/assets/report/rcomprapj.jasper";
                } else {
                    pathReporte = applicationPath + "/assets/report/rcomprapn.jasper";
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
