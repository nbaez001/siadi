/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Proveedornatural;
import com.romaqui.siadi.entity.Proveedorjuridico;
import com.romaqui.siadi.entity.Proveedor;
import com.romaqui.siadi.entity.Representantelegal;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ProveedorDao extends GenericDao<Proveedor> {

    Proveedor registrarProveedorjuridico(Proveedorjuridico pj, Proveedor p, List<Representantelegal> lrl);

    int eliminarProveedorjuridico(Proveedor p, List<Representantelegal> lrl, Proveedorjuridico pj);

    Proveedor actualizarProveedorjuridico(Proveedorjuridico pj, Proveedor p, List<Representantelegal> lrle, List<Representantelegal> lrln, List<Representantelegal> lrl);

    Proveedor registrarProveedornatural(Proveedornatural pn, Proveedor p);

    int eliminarProveedornatural(Proveedor p, Proveedornatural pn);

    Proveedor actualizarProveedornatural(Proveedornatural pn, Proveedor p);

}
