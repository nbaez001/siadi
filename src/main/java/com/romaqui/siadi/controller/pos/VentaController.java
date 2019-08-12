/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.pos;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.entity.Venta;
import com.romaqui.siadi.entity.nuevo.CreditoCuotaTransac;
import com.romaqui.siadi.entity.nuevo.Data5;
import com.romaqui.siadi.entity.nuevo.VentaDetalleventa;
import com.romaqui.siadi.service.CajeroService;
import com.romaqui.siadi.service.ClienteService;
import com.romaqui.siadi.service.CreditoService;
import com.romaqui.siadi.service.DetallemovimientoService;
import com.romaqui.siadi.service.DetalleventaService;
import com.romaqui.siadi.service.InventarioService;
import com.romaqui.siadi.service.VentaService;
import com.romaqui.siadi.util.ConectionUtil;
import com.romaqui.siadi.util.ReportUtil;
import com.romaqui.siadi.util.SessionUtil;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
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
@Controller
@RequestMapping("pos/venta")
public class VentaController {

    @Autowired
    VentaService ventaService;
    @Autowired
    DetallemovimientoService detallemovimientoService;
    @Autowired
    DetalleventaService detalleventaService;
    @Autowired
    InventarioService inventarioService;
    @Autowired
    CajeroService cajeroService;
    @Autowired
    ClienteService clienteService;
    @Autowired
    CreditoService creditoService;

    Gson gson;

    public VentaController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

    @RequestMapping(value = "/registro", method = RequestMethod.GET)
    public String registro(HttpServletRequest hsr, HttpSession s, ModelMap m) {
        s.setAttribute("ldv", null);
        Cajero c = cajeroService.obtenerCajero(s);
        if (c != null) {
            if (hsr.getRemoteAddr().equals(c.getCaja().getIp())) {
                m.addAttribute("ip", hsr.getRemoteAddr());
                return SessionUtil.sesion("pos/venta/registro", s, "02", "03", "01", m);
            } else {
                m.addAttribute("error", "Error, su direccion IP " + hsr.getRemoteAddr() + " no coincide con la ip registrada para la caja");
                return SessionUtil.sesion("pos/home", s, "02", "00", "00", m);
            }
        } else {
            m.addAttribute("error", "Error, usted no tiene permisos para acceder a CAJA o no se ha aperturado su CAJA");
            return SessionUtil.sesion("pos/home", s, "02", "00", "00", m);
        }
    }

    @RequestMapping(value = "/registro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registro(@RequestBody VentaDetalleventa vdv, HttpSession s) {
        return gson.toJson(ventaService.registrarVenta(vdv.getVenta(), vdv.getLdv(), vdv.getComprobante(), s));
    }

    @RequestMapping(value = "/registroc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroC(@RequestBody VentaDetalleventa vdv, HttpSession s) {
        return gson.toJson(ventaService.registrarVentac(vdv.getVenta(), vdv.getLdv(), s));
    }

    @RequestMapping(value = "/listarcredito", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String listarCredito(@RequestBody Cliente c) {
        return gson.toJson(creditoService.listarCreditos(c));
    }

    @RequestMapping(value = "/pagarcuota", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String pagarCuota(@RequestBody CreditoCuotaTransac cct, HttpSession s) {
        return gson.toJson(creditoService.pagarCuota(cct.getCredito(), cct.getCuota(), cct.getTransaccion(), cct.getComprobante(), s));
    }

    @RequestMapping(value = "/eliminarventa", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarventa(@RequestBody Venta v) {
        return ventaService.eliminarVenta(v);
    }

    @RequestMapping(value = "/agregardetalleventa", method = RequestMethod.POST)
    @ResponseBody
    public int agregarDetalleventa(@RequestBody List<Detalleventa> ldv, HttpSession sesion) {
        try {
            sesion.setAttribute("ldv", ldv);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    @RequestMapping(value = "/obtenercodigoventa", method = RequestMethod.POST)
    @ResponseBody
    public int obtenerCodigoventa(@RequestBody Agencia a) {
        return ventaService.obtenerCodigoventa(a);
    }

    @RequestMapping(value = "/buscarcliente", method = RequestMethod.POST)
    @ResponseBody
    public String buscarCliente(@RequestBody Cliente c) {
        List<Cliente> listCN = clienteService.listarClientenatural(c);
        List<Cliente> listCJ = clienteService.listarClientejuridico(c);

        for (Cliente c1 : listCJ) {
            listCN.add(c1);
        }

        return gson.toJson(listCN);
    }

    @RequestMapping(value = "/cierrecaja", method = RequestMethod.GET)
    public String cierreCaja(HttpSession s, ModelMap m) {
        Cajero c = cajeroService.obtenerCajero(s);
        if (c != null) {
            return SessionUtil.sesion("pos/venta/cierrecaja", s, "02", "03", "01", m);
        } else {
            m.addAttribute("error", "Error, usted no tiene permisos para acceder a CAJA o esta cerrada");
            return SessionUtil.sesion("pos/home", s, "02", "00", "00", m);
        }
    }

    @RequestMapping(value = "/cierrecajero", method = RequestMethod.POST)
    @ResponseBody
    public String cierreCajero(@RequestBody Cajero c) {
        return gson.toJson(cajeroService.update(c));
    }

    @RequestMapping(value = "/buscarventaf", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarventaf(@RequestBody Venta v) {
        List<String> lstr = new ArrayList<>();
        List<Venta> lv = ventaService.listarVentaFechas(v);

        for (Venta v2 : lv) {
            lstr.add(gson.toJson(v2));
        }
        return lstr;
    }

    @RequestMapping(value = "/buscarventav", method = RequestMethod.POST)
    @ResponseBody
    public List<String> buscarventav(@RequestBody Venta v) {
        List<String> lstr = new ArrayList<>();
        List<Venta> lv = ventaService.listarVentaCodigo(v);

        for (Venta v2 : lv) {
            lstr.add(gson.toJson(v2));
        }
        return lstr;
    }

    @RequestMapping(value = "/listardetalleventa", method = RequestMethod.POST)
    @ResponseBody
    public List<String> listardetalleventa(@RequestBody Venta v) {
        List<String> lstr = new ArrayList<>();
        List<Detalleventa> ldv = detalleventaService.listarPorVenta(v);

        for (Detalleventa dv : ldv) {
            lstr.add(gson.toJson(dv));
        }
        return lstr;
    }

    @RequestMapping(value = "/buscarinventario", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarInventario(@RequestBody Data5 d) {
        return gson.toJson(inventarioService.listarPorProducto2(d.getProducto(), d.getAgencia()));
    }

    @RequestMapping(value = "/comprobantev", method = RequestMethod.GET)
    public void comprobantev(@RequestParam String type, @RequestParam int id,@RequestParam int ida,@RequestParam int idc,@RequestParam int idttc, HttpServletRequest request, HttpServletResponse response, HttpSession s) {
        try {
            String applicationPath = request.getServletContext().getRealPath("");
            
            Map<String, Object> params = new HashMap<>();
            params.put("idventa", id);
            params.put("idagencia", ida);
            params.put("idcajero", idc);
            params.put("idttipocomprobante", idttc);
            params.put("SUBREPORT_DIR", applicationPath + "/assets/report/");

            String pathReporte = applicationPath + "/assets/report/rcomprobante.jasper";

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
    }
    
    @RequestMapping(value = "/comprobantec", method = RequestMethod.GET)
    public void comprobantec(@RequestParam String type, @RequestParam int id,@RequestParam int ida,@RequestParam int idc,@RequestParam int idttc, HttpServletRequest request, HttpServletResponse response, HttpSession s) {
        try {
            String applicationPath = request.getServletContext().getRealPath("");
            
            Map<String, Object> params = new HashMap<>();
            params.put("idcuota", id);
            params.put("idagencia", ida);
            params.put("idcajero", idc);
            params.put("idttipocomprobante", idttc);
            params.put("SUBREPORT_DIR", applicationPath + "/assets/report/");

            String pathReporte = applicationPath + "/assets/report/rcomprobantec.jasper";

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
    }

}
