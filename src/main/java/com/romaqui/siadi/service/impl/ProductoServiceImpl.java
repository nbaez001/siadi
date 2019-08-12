/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.DetallecompraDao;
import com.romaqui.siadi.dao.DetalleventaDao;
import com.romaqui.siadi.dao.InventarioiniciomesDao;
import com.romaqui.siadi.dao.ProductoDao;
import com.romaqui.siadi.entity.Categoria;
import com.romaqui.siadi.entity.Detallecompra;
import com.romaqui.siadi.entity.Detalleventa;
import com.romaqui.siadi.entity.Inventarioiniciomes;
import com.romaqui.siadi.entity.Producto;
import com.romaqui.siadi.service.InventarioService;
import com.romaqui.siadi.service.ProductoService;
import com.romaqui.siadi.util.FileUploaderUtil;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
@Service
public class ProductoServiceImpl extends GenericServiceImpl<Producto> implements ProductoService {

    @Autowired
    ProductoDao productoDao;
    @Autowired
    DetallecompraDao detallecompraDao;
    @Autowired
    DetalleventaDao detalleventaDao;
    @Autowired
    InventarioService inventarioService;
    @Autowired
    InventarioiniciomesDao inventarioiniciomesDao;

    SimpleDateFormat sdf;
    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat formatd;

    public ProductoServiceImpl() {
        simbolo.setDecimalSeparator('.');
        formatd = new DecimalFormat("####.#", simbolo);
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    public int obtenerCodigoproducto(Categoria c) {
        int dato;
        try {
            dato = Integer.parseInt(productoDao.consultUnique("select count(p) from Producto p where p.categoria.id=" + c.getId()).toString());
        } catch (Exception e) {
            dato = 0;
        }
        return dato + 1;
    }

    @Override
    public Producto registrarProducto(Producto p, MultipartFile f, HttpServletRequest request) {
        String upload_folder = "/assets/files/img/productos/" + p.getCategoria().getCodigo().toLowerCase() + "/";

        String archivo = FileUploaderUtil.simpleUpload(f, request, upload_folder, FileUploaderUtil.listaArchivos(request, upload_folder));

        if (archivo != null) {
            p.setUrlfoto(upload_folder + archivo);
        }

        Producto dato = productoDao.registrarProducto(p, request.getSession());
        if (dato == null && archivo != null) {
            FileUploaderUtil.deleteFile(request, upload_folder + archivo);
        }

        return dato;
    }

    @Override
    public List<Producto> buscarProducto(Producto p) {
        String cCategoria = "";
        String cMarca = "";
        String cUnidadmedida = "";

        if (p.getCategoria().getId() != 0) {
            cCategoria = " and p.categoria.id=" + p.getCategoria().getId();
        }

        if (p.getMarca().getId() != 0) {
            cMarca = " and p.marca.id=" + p.getMarca().getId();
        }

        if (p.getIdtunidadmedida() != 0) {
            cUnidadmedida = " and p.idtunidadmedida=" + p.getIdtunidadmedida();
        }

        return productoDao.consultList("from Producto p where p.nombre like '%" + p.getNombre() + "%'" + cCategoria + cMarca + cUnidadmedida);
    }

    @Override
    public Producto actualizarProducto(Producto p, MultipartFile f, HttpServletRequest request) {
        String upload_folder = "/assets/files/img/productos/" + p.getCategoria().getCodigo().toLowerCase() + "/";
        Producto dato;
        if (f != null) {
            String archivo = FileUploaderUtil.simpleUpload(f, request, upload_folder, FileUploaderUtil.listaArchivos(request, upload_folder));
            if (archivo != null) {
                p.setUrlfoto(upload_folder + archivo);
            }
            dato = productoDao.update(p);
            if (dato == null && archivo != null) {
                FileUploaderUtil.deleteFile(request, upload_folder + archivo);
            }
        } else {
            dato = productoDao.update(p);
        }

        return dato;
    }

    @Override
    public int eliminarProducto(Producto p) {
        return productoDao.eliminarProducto(p);
    }

    @Override
    public List<String> listarMovimientos(Producto p) {
        List<String> lstr = new ArrayList<>();
        Date f = new Date(p.getIdusuariocrea() + "/" + (p.getIdusuariomod() + 1) + "/01");

        Calendar c = Calendar.getInstance();
        c.setTime(f);

        Calendar c2 = Calendar.getInstance();
        c2.setTime(f);
        c2.add(Calendar.MONTH, 1);

        String cadena;
        Double saldo = 0.00;

        //INVENTARIO INICIO MES
        Inventarioiniciomes iim = (Inventarioiniciomes) inventarioiniciomesDao.consultUnique("from Inventarioiniciomes iim where iim.anio=" + p.getIdusuariocrea() + " and iim.mes=" + p.getIdusuariomod() + " and iim.producto.id=" + p.getId());
        if (iim != null) {
            saldo += iim.getCantidad();
            cadena = "{\"fecha\":\"" + sdf.format(iim.getFecha()) + "\","
                    + "\"tipo\":\"-\","
                    + "\"serie\":\"-\","
                    + "\"numero\":\"-\","
                    + "\"tipooperacion\":16,"
                    + "\"entradas\":" + iim.getCantidad() + ","
                    + "\"salidas\":0.0,"
                    + "\"saldos\":" + Double.parseDouble(formatd.format(saldo)) + "}";

            lstr.add(cadena);

            while (c.before(c2)) {
                List<Detallecompra> ldc = detallecompraDao.consultList("from Detallecompra dc where dc.compra.fechaalmacenamiento = '" + sdf.format(c.getTime()) + "' and dc.producto.id=" + p.getId());
                for (Detallecompra dc : ldc) {
                    saldo += dc.getSubtotal();
                    cadena = "{\"fecha\":\"" + sdf.format(dc.getCompra().getFechaalmacenamiento()) + "\","
                            + "\"tipo\":\"" + dc.getProducto().getIdttipo() + "\","
                            + "\"serie\":\"" + dc.getCompra().getSeriecomprobante() + "\","
                            + "\"numero\":\"" + dc.getCompra().getNrocomprobante() + "\","
                            + "\"tipooperacion\":2,"
                            + "\"entradas\":" + dc.getSubtotal() + ","
                            + "\"salidas\":0.0,"
                            + "\"saldos\":\"" + Double.parseDouble(formatd.format(saldo)) + "\"}";

                    lstr.add(cadena);
                }

                List<Detalleventa> ldv = detalleventaDao.consultList("from Detalleventa dv where dv.venta.fechasalida = '" + sdf.format(c.getTime()) + "' and dv.producto.id=" + p.getId());
                for (Detalleventa dv : ldv) {
                    saldo -= dv.getSubtotal();
                    cadena = "{\"fecha\":\"" + sdf.format(dv.getVenta().getFechasalida()) + "\","
                            + "\"tipo\":\"" + dv.getProducto().getIdttipo() + "\","
                            + "\"serie\":\"" + dv.getVenta().getSeriecomprobante() + "\","
                            + "\"numero\":\"" + dv.getVenta().getNrocomprobante() + "\","
                            + "\"tipooperacion\":1,"
                            + "\"entradas\":0.0,"
                            + "\"salidas\":" + dv.getSubtotal() + ","
                            + "\"saldos\":\"" + Double.parseDouble(formatd.format(saldo)) + "\"}";

                    lstr.add(cadena);
                }

                c.add(Calendar.DATE, 1);
            }
        }
        return lstr;
    }

    @Override
    public List<String> listarMovimientosvalorizados(Producto p) {
        List<String> lstr = new ArrayList<>();
        Date f = new Date(p.getIdusuariocrea() + "/" + (p.getIdusuariomod() + 1) + "/01");

        Calendar c = Calendar.getInstance();
        c.setTime(f);

        Calendar c2 = Calendar.getInstance();
        c2.setTime(f);
        c2.add(Calendar.MONTH, 1);

        String cadena;
        Double cantidad = 0.0;

        //INVENTARIO INICIO MES
        Inventarioiniciomes iim = (Inventarioiniciomes) inventarioiniciomesDao.consultUnique("from Inventarioiniciomes iim where iim.anio=" + p.getIdusuariocrea() + " and iim.mes=" + p.getIdusuariomod() + " and iim.producto.id=" + p.getId());
        if (iim != null) {
            cantidad += iim.getCantidad();
            cadena = "{\"fecha\":\"" + sdf.format(iim.getFecha()) + "\","
                    + "\"serie\":\"-\","
                    + "\"numero\":\"-\","
                    + "\"tipooperacion\":16,"
                    + "\"cantidadc\":" + iim.getCantidad() + ","
                    + "\"preciounitarioc\":" + iim.getPrecio() + ","
                    + "\"subtotalc\":" + (iim.getCantidad() * iim.getPrecio()) + ","
                    + "\"cantidadv\":0.0,"
                    + "\"preciounitariov\":0.0,"
                    + "\"subtotalv\":0.0,"
                    + "\"cantidad\":" + cantidad + ","
                    + "\"preciounitario\":" + iim.getPrecio() + ","
                    + "\"subtotal\":" + Double.parseDouble(formatd.format(cantidad * iim.getPrecio())) + "}";

            lstr.add(cadena);

            while (c.before(c2)) {
                List<Detallecompra> ldc = detallecompraDao.consultList("from Detallecompra dc where dc.compra.fechaalmacenamiento = '" + sdf.format(c.getTime()) + "' and dc.producto.id=" + p.getId());
                for (Detallecompra dc : ldc) {
                    cantidad += dc.getCantidad();
                    cadena = "{\"fecha\":\"" + sdf.format(dc.getCompra().getFechaalmacenamiento()) + "\","
                            + "\"serie\":\"" + dc.getCompra().getSeriecomprobante() + "\","
                            + "\"numero\":\"" + dc.getCompra().getNrocomprobante() + "\","
                            + "\"tipooperacion\":2,"
                            + "\"cantidadc\":" + dc.getCantidad() + ","
                            + "\"preciounitarioc\":" + dc.getPreciounitario() + ","
                            + "\"subtotalc\":" + dc.getSubtotal() + ","
                            + "\"cantidadv\":0.0,"
                            + "\"preciounitariov\":0.0,"
                            + "\"subtotalv\":0.0,"
                            + "\"cantidad\":" + cantidad + ","
                            + "\"preciounitario\":" + dc.getPreciounitario() + ","
                            + "\"subtotal\":" + Double.parseDouble(formatd.format(cantidad * dc.getPreciounitario())) + "}";

                    lstr.add(cadena);
                }

                List<Detalleventa> ldv = detalleventaDao.consultList("from Detalleventa dv where dv.venta.fechasalida = '" + sdf.format(c.getTime()) + "' and dv.producto.id=" + p.getId());
                for (Detalleventa dv : ldv) {
                    cantidad -= dv.getCantidad();
                    cadena = "{\"fecha\":\"" + sdf.format(dv.getVenta().getFechasalida()) + "\","
                            + "\"serie\":\"" + dv.getVenta().getSeriecomprobante() + "\","
                            + "\"numero\":\"" + dv.getVenta().getNrocomprobante() + "\","
                            + "\"tipooperacion\":2,"
                            + "\"cantidadc\":" + dv.getCantidad() + ","
                            + "\"preciounitarioc\":" + dv.getPreciounitario() + ","
                            + "\"subtotalc\":" + dv.getSubtotal() + ","
                            + "\"cantidadv\":0.0,"
                            + "\"preciounitariov\":0.0,"
                            + "\"subtotalv\":0.0,"
                            + "\"cantidad\":" + cantidad + ","
                            + "\"preciounitario\":" + dv.getPreciounitario() + ","
                            + "\"subtotal\":" + Double.parseDouble(formatd.format(cantidad * dv.getPreciounitario())) + "}";

                    lstr.add(cadena);
                }

                c.add(Calendar.DATE, 1);
            }
        }
        return lstr;
    }

    @Override
    public List<Producto> buscarProductoAutocomplete(Producto p) {
        if (p.getId() == 1) {
            return productoDao.consultList("from Producto p where p.codigo like '%" + p.getCodigo() + "%'");
        } else {
            return productoDao.consultList("from Producto p where p.nombre like '%" + p.getNombre() + "%'");
        }
    }
}
