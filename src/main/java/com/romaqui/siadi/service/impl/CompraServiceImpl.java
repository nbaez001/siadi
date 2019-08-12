/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.CompraDao;
import com.romaqui.siadi.dao.DetallecompraDao;
import com.romaqui.siadi.dao.ProveedorDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Detallecompra;
import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Proveedornatural;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.service.CompraService;
import com.romaqui.siadi.util.FileUploaderUtil;
import java.text.SimpleDateFormat;
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
public class CompraServiceImpl extends GenericServiceImpl<Compra> implements CompraService {

    @Autowired
    CompraDao compraDao;
    @Autowired
    DetallecompraDao detallecompraDao;
    @Autowired
    ProveedorDao proveedorDao;

    SimpleDateFormat sdf;

    public CompraServiceImpl() {
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    public int obtenerCodigocompra(Agencia a) {
        int dato;
        try {
            dato = Integer.parseInt(compraDao.consultUnique("select count(c) from Compra c where c.agencia.id=" + a.getId()).toString());
        } catch (Exception e) {
            dato = 0;
        }
        return dato + 1;
    }

    @Override
    public List<Compra> listarPorAgencia(Agencia a) {
        return compraDao.consultList("from Compra c where c.agencia.id=" + a.getId());
    }

    @Override
    public Compra registrarCompra(Compra c, MultipartFile comp, MultipartFile ordc, List<Detallecompra> ldc, HttpServletRequest hsr) {
        String url = "/assets/files/img/compra/" + c.getCodigo().toLowerCase() + "/";
        String urlcomprobante = FileUploaderUtil.simpleUpload(comp, hsr, url, FileUploaderUtil.listaArchivos(hsr, url));
        String urlordencompra = FileUploaderUtil.simpleUpload(ordc, hsr, url, FileUploaderUtil.listaArchivos(hsr, url));

        if (urlcomprobante != null) {
            c.setUrlcomprobante(url + urlcomprobante);
        }
        if (urlordencompra != null) {
            c.setUrlordencompra(url + urlordencompra);
        }
        return compraDao.registrarCompra(c, ldc);
    }

    @Override
    public int eliminarCompra(Compra c) {
        List<Detallecompra> ldc = detallecompraDao.consultList("from Detallecompra dc where dc.compra.id=" + c.getId());
        return compraDao.eliminarCompra(c, ldc);
    }

    @Override
    public List<Compra> listarCompraFechas(Compra c) {
        return compraDao.consultList("from Compra c where c.fechusuariocrea>='" + sdf.format(c.getFechusuariocrea()) + "' and c.fechusuariocrea<='" + sdf.format(c.getFechusuariomod()) + "' and c.idtestadocompra=" + c.getIdtestadocompra());
    }

    @Override
    public List<Compra> listarCompraPJ(Compra c) {
        if (c.getProveedor().getProveedorjuridico().getId() == 1) {
            return compraDao.consultList("from Compra c where c.idtestadocompra=" + c.getIdtestadocompra() + " and c.proveedor.proveedorjuridico.ruc=" + c.getProveedor().getProveedorjuridico().getRuc());
        } else {
            return compraDao.consultList("from Compra c where c.idtestadocompra=" + c.getIdtestadocompra() + " and (c.proveedor.proveedorjuridico.razonsocial like '%" + c.getProveedor().getProveedorjuridico().getRazonsocial() + "%' or  c.proveedor.proveedorjuridico.nombrecomercial like '%" + c.getProveedor().getProveedorjuridico().getNombrecomercial() + "%')");
        }
    }

    @Override
    public List<Compra> listarCompraPN(Compra c) {
        if (c.getProveedor().getProveedornatural().getId() == 1) {
            return compraDao.consultList("from Compra c where c.idtestadocompra=" + c.getIdtestadocompra() + " and c.proveedor.proveedornatural.dni=" + c.getProveedor().getProveedornatural().getDni());
        } else {
            return compraDao.consultList("from Compra c where c.idtestadocompra=" + c.getIdtestadocompra() + " and (c.proveedor.proveedornatural.nombre like '%" + c.getProveedor().getProveedornatural().getNombre() + "%' or  c.proveedor.proveedornatural.apellidopat like '%" + c.getProveedor().getProveedornatural().getApellidopat() + "%' or  c.proveedor.proveedornatural.apellidomat like '%" + c.getProveedor().getProveedornatural().getApellidomat() + "%')");
        }
    }

    @Override
    public List<Compra> listarCompraCodigo(Compra c) {
        return compraDao.consultList("from Compra c where c.codigo like '%" + c.getCodigo() + "%' and c.idtestadocompra=" + c.getIdtestadocompra());
    }

}
