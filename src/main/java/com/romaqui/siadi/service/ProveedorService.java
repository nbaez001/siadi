/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Proveedornatural;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.nuevo.Data;
import com.romaqui.siadi.entity.nuevo.Data2;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ProveedorService extends GenericService<Proveedor> {

    List<Proveedor> listarProveedor(Tablamaestra tm);

    List<Proveedor> listarProveedorjuridico(Proveedor p);

    List<Proveedor> listarProveedornatural(Proveedor p);

    int obtenerCodigoproveedor(Tablamaestra tm);

    Proveedor registrarProveedorjuridico(Data data);

    int eliminarProveedorjuridico(Proveedor p);

    Proveedor actualizarProveedorjuridico(Data2 data);

    Proveedor registrarProveedornatural(Proveedor p);

    int eliminarProveedornatural(Proveedor p);

    Proveedor actualizarProveedornatural(Proveedor p);

}
