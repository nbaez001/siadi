/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Categoria;
import com.romaqui.siadi.entity.Producto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
public interface ProductoService extends GenericService<Producto> {

    int obtenerCodigoproducto(Categoria c);

    Producto registrarProducto(Producto p, MultipartFile f, HttpServletRequest request);

    Producto actualizarProducto(Producto p, MultipartFile f, HttpServletRequest request);

    int eliminarProducto(Producto p);

    List<Producto> buscarProducto(Producto p);

    List<String> listarMovimientos(Producto p);

    List<String> listarMovimientosvalorizados(Producto p);
    
    List<Producto> buscarProductoAutocomplete(Producto p);
}
