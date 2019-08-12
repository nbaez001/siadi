/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Detallecompra;
import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Proveedornatural;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
public interface CompraService extends GenericService<Compra> {

    int obtenerCodigocompra(Agencia a);

    List<Compra> listarPorAgencia(Agencia a);

    Compra registrarCompra(Compra c, MultipartFile comp, MultipartFile ordc, List<Detallecompra> ldc, HttpServletRequest hsr);

    int eliminarCompra(Compra c);

    List<Compra> listarCompraFechas(Compra c);

    List<Compra> listarCompraPJ(Compra c);

    List<Compra> listarCompraPN(Compra c);

    List<Compra> listarCompraCodigo(Compra c);
}
