/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.personal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Permiso;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.service.AsistenciaService;
import com.romaqui.siadi.service.ContratoService;
import com.romaqui.siadi.service.ControlService;
import com.romaqui.siadi.service.PermisoService;
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
@Controller("pcontrolController")
@RequestMapping("personal/control")
public class ControlController {

    @Autowired
    AsistenciaService asistenciaService;
    @Autowired
    ControlService controlService;
    @Autowired
    PermisoService permisoService;
    @Autowired
    ContratoService contratoService;

    Gson gson,gsond;

    public ControlController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gsond = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
    }

    @RequestMapping(value = "/permiso", method = RequestMethod.GET)
    public String permiso(ModelMap m, HttpSession s) {
        return SessionUtil.sesion("personal/control/permiso", s, "03", "04", "01", m);
    }

    @RequestMapping(value = "/registrop", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroP(@RequestBody Permiso p) {
        return gson.toJson(permisoService.create(p));
    }

    @RequestMapping(value = "/eliminarp", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String eliminarP(@RequestBody Permiso p) {
        return gson.toJson(permisoService.delete(p.getId()));
    }

    @RequestMapping(value = "/listarpermiso", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String listarPermiso(@RequestBody Contrato c) {
        return gsond.toJson(permisoService.listarPermisos(c));
    }

    @RequestMapping(value = "/permiso/otorgar", method = RequestMethod.GET)
    public String otorgar(ModelMap m, HttpSession s) {
        Usuario u = (Usuario) s.getAttribute("user");
        Contrato c = contratoService.obtenerUltimo(u.getColaborador());
        if (c == null) {
            m.addAttribute("error", "Usted no tiene un contrato registrado, solicite su registro...");
            return "personal/index";
        } else {
            if (c.isEsjefearea() || c.getDependencia().isRrhh()) {
                return SessionUtil.sesion("personal/control/otorgar", s, "03", "04", "02", m);
            } else {
                m.addAttribute("error", "Usted no tiene permisos de acceso a esta opción...");
                return "personal/index";
            }
        }
    }

    @RequestMapping(value = "/autorizarp", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String autorizarP(@RequestBody Permiso p) {
        return gson.toJson(permisoService.update(p));
    }

    @RequestMapping(value = "/listarpermisos", produces = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String listarPermisos(@RequestBody Agencia a) {
        return gsond.toJson(permisoService.listarPermisos(a));
    }
    
    @RequestMapping(value = "/papeletasalida", method = RequestMethod.GET)
    public void reporte(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");
                
                Map<String, Object> params = new HashMap<>();
                params.put("idPermiso", id);

                String pathReporte = applicationPath + "/assets/report/rpermiso.jasper";

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
