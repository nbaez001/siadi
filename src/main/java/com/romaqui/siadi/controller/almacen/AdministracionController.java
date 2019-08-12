/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.almacen;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Almacen;
import com.romaqui.siadi.entity.Andamio;
import com.romaqui.siadi.entity.Categoria;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Marca;
import com.romaqui.siadi.entity.Producto;
import com.romaqui.siadi.entity.nuevo.Data5;
import com.romaqui.siadi.service.AlmacenService;
import com.romaqui.siadi.service.AndamioService;
import com.romaqui.siadi.service.CategoriaService;
import com.romaqui.siadi.service.InventarioService;
import com.romaqui.siadi.service.MarcaService;
import com.romaqui.siadi.service.ProductoService;
import com.romaqui.siadi.service.UsuarioService;
import com.romaqui.siadi.util.ConectionUtil;
import com.romaqui.siadi.util.ReportUtil;
import com.romaqui.siadi.util.SessionUtil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
@Controller("aadministracionController")
@RequestMapping("almacen/administracion")
public class AdministracionController {

    @Autowired
    MarcaService marcaService;
    @Autowired
    CategoriaService categoriaService;
    @Autowired
    AlmacenService almacenService;
    @Autowired
    AndamioService andamioService;
    @Autowired
    ProductoService productoService;
    @Autowired
    InventarioService inventarioService;
    @Autowired
    UsuarioService usuarioService;

    Gson gson;

    public AdministracionController() {
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }
    /*
     @InitBinder
     public void dataBinding(WebDataBinder binder) {
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     dateFormat.setLenient(false);
     binder.registerCustomEditor(Date.class, "fechusuariocrea", new CustomDateEditor(dateFormat, true));
     binder.registerCustomEditor(Date.class, "fechusuariomod", new CustomDateEditor(dateFormat, true));
     }*/

    @RequestMapping(value = "/paramsproducto", method = RequestMethod.GET)
    public String paramsProducto(ModelMap m, HttpSession s) {
        return SessionUtil.sesion("almacen/administracion/paramsproducto", s, "01", "01", "01", m);
    }

    @RequestMapping(value = "/registrarm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarM(@RequestBody Marca m, HttpSession s) {
        return gson.toJson(marcaService.create(m));
    }

    @RequestMapping(value = "/actualizarm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarM(@RequestBody Marca m, HttpSession s) {
        return gson.toJson(marcaService.update(m));
    }

    @RequestMapping(value = "/eliminarm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarM(@RequestBody Marca m, HttpSession s) {
        return marcaService.delete(m.getId());
    }

    @RequestMapping(value = "/registrarc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarC(@RequestBody Categoria c, HttpSession s) {
        return gson.toJson(categoriaService.create(c));
    }

    @RequestMapping(value = "/actualizarc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarC(@RequestBody Categoria c, HttpSession s) {
        return gson.toJson(categoriaService.update(c));
    }

    @RequestMapping(value = "/eliminarc", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarC(@RequestBody Categoria c, HttpSession s) {
        return categoriaService.delete(c.getId());
    }

    @RequestMapping(value = "/almacenes", method = RequestMethod.GET)
    public String almacen(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/administracion/almacenes", s, "01", "01", "02", m);
    }

    @RequestMapping(value = "/registraralm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String almacen(@RequestBody Almacen a, HttpSession s) {
        return gson.toJson(almacenService.create(a));
    }

    @RequestMapping(value = "/actualizaralm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarAlm(@RequestBody Almacen a, HttpSession s) {
        return gson.toJson(almacenService.update(a));
    }

    @RequestMapping(value = "/eliminaralm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarAlm(@RequestBody Almacen a, HttpSession s) {
        return almacenService.delete(a.getId());
    }

    @RequestMapping(value = "/obtcodigoalm", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int obtCodigoalm(@RequestBody Agencia a, HttpSession s) {
        return almacenService.obtenerCodigoalmacen(a);
    }

    @RequestMapping(value = "/obtcodigoand", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int obtCodigoand(@RequestBody Almacen a, HttpSession s) {
        return andamioService.obtenerCodigoandamio(a);
    }

    @RequestMapping(value = "/registrarand", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarAnd(@RequestBody Andamio a, HttpSession s) {
        return gson.toJson(andamioService.crearAndamio(a));
    }

    @RequestMapping(value = "/eliminarand", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarAnd(@RequestBody Andamio a) {
        return andamioService.delete(a.getId());
    }

    @RequestMapping(value = "/producto", method = RequestMethod.GET)
    public String producto(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/administracion/producto", s, "01", "01", "03", m);
    }

    @RequestMapping(value = "/registropro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registroPro(Producto producto, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
        return gson.toJson(productoService.registrarProducto(producto, file, request));
    }

    @RequestMapping(value = "/actualizarpro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarPro(Producto producto, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
        return gson.toJson(productoService.actualizarProducto(producto, file, request));
    }

    @RequestMapping(value = "/eliminarpro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int emilinarPro(@RequestBody Producto producto) {
        return productoService.eliminarProducto(producto);
    }

    @RequestMapping(value = "/obtcodigopro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int obtCodigoPro(@RequestBody Categoria c) {
        return productoService.obtenerCodigoproducto(c);
    }

    @RequestMapping(value = "/buscarpro", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarPro(@RequestBody Producto p) {
        return gson.toJson(productoService.buscarProducto(p));
    }

//    @RequestMapping(value = "/buscarinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
//    @ResponseBody
//    public String buscarInv(@RequestBody Producto p) {
//        return gson.toJson(inventarioService.listarPorProducto2(p));
//    }
    @RequestMapping(value = "/inventario", method = RequestMethod.GET)
    public String inventario(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/administracion/inventario", s, "01", "01", "04", m);
    }

    @RequestMapping(value = "/buscarproducto", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarProducto(@RequestBody Producto p) {
        return gson.toJson(productoService.buscarProductoAutocomplete(p));
    }

    @RequestMapping(value = "/buscarinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarInventario(@RequestBody Data5 d) {
        return gson.toJson(inventarioService.listarPorProducto(d.getProducto(), d.getAgencia()));
    }

    @RequestMapping(value = "/buscartodoinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String buscarTodoInventario(@RequestBody Data5 d) {
        return gson.toJson(inventarioService.listarTodosPorProducto(d.getProducto(), d.getAgencia()));
    }

    @RequestMapping(value = "/registrarinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String registrarInv(@RequestBody Inventario i) {
        return gson.toJson(inventarioService.registrarInventario(i));
    }

    @RequestMapping(value = "/actualizarinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String actualizarInv(@RequestBody Inventario i) {
        return gson.toJson(inventarioService.actualizarInventario(i));
    }

    @RequestMapping(value = "/obtenerinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String obtenerInv(@RequestBody Integer id) {
        return gson.toJson(inventarioService.get(id));
    }

    @RequestMapping(value = "/eliminarinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public int eliminarInv(@RequestBody Inventario i) {
        return inventarioService.eliminarInventario(i);
    }

    //NO USABLE
//    @RequestMapping(value = "/inventario", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
//    @ResponseBody
//    public String inventario(@RequestBody Producto p) {
//        return gson.toJson(inventarioService.listarPorProductoresumen(p));
//    }
//    @RequestMapping(value = "/detalleinv", method = RequestMethod.GET)
//    public String detalleInv(HttpSession s, ModelMap m) {
//        return SessionUtil.sesion("almacen/administracion/detalleinventario", s, "01", "01", "04", m);
//    }
//    @RequestMapping(value = "/detalleinv", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
//    @ResponseBody
//    public String detalleInv(@RequestBody Producto p) {
//        return gson.toJson(inventarioService.listarPorProducto(p));
//    }
    //Modulo Merma
    @RequestMapping(value = "/merma", method = RequestMethod.GET)
    public String merma(HttpSession s, ModelMap m) {
        return SessionUtil.sesion("almacen/administracion/merma", s, "01", "01", "05", m);
    }

    @RequestMapping(value = "/merma", produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String merma(@RequestBody Producto p) {
        return "";
    }

    //Modulo Reportes
    @RequestMapping(value = "/reporte", method = RequestMethod.GET)
    public void reporte(@RequestParam String type, @RequestParam int id, HttpServletRequest request, HttpServletResponse response, HttpSession s) throws IOException {
        if (SessionUtil.sesion(s)) {
            try {
                String applicationPath = request.getServletContext().getRealPath("");

                Map<String, Object> params = new HashMap<>();
                params.put("idProducto", id);
                params.put("realPath", applicationPath);

                String pathReporte = applicationPath + "/assets/report/rProducto.jasper";

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
