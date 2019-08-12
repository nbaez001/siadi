/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.CompraDao;
import com.romaqui.siadi.dao.InventarioDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Compra;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Producto;
import com.romaqui.siadi.service.InventarioService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class InventarioServiceImpl extends GenericServiceImpl<Inventario> implements InventarioService {

    @Autowired
    InventarioDao inventarioDao;
    @Autowired
    CompraDao compraDao;

    @Override
    public int registrarIngreso(Compra c, List<Inventario> li) {
        return inventarioDao.registrarIngreso(c, li);
    }

    @Override
    public List<Inventario> listarPorProducto(Producto p, Agencia a) {
        return inventarioDao.consultList("from Inventario i where i.estado=true and i.producto.id=" + p.getId() + " and i.andamio.almacen.agencia.id=" + a.getId());
    }

    @Override
    public List<Inventario> listarPorProducto2(Producto p, Agencia a) {
        if (p.getId() == 1) {
            return inventarioDao.consultList("from Inventario i where i.estado=true and i.producto.codigo like '%" + p.getCodigo() + "%' and i.andamio.almacen.agencia.id=" + a.getId());
        } else {
            return inventarioDao.consultList("from Inventario i where i.estado=true and i.producto.nombre like '%" + p.getNombre() + "%' and i.andamio.almacen.agencia.id=" + a.getId());
        }
    }

    @Override
    public List<Inventario> listarTodosPorProducto(Producto p, Agencia a) {
        return inventarioDao.consultList("from Inventario i where i.producto.id=" + p.getId() + " and i.andamio.almacen.agencia.id=" + a.getId());
    }

    /*
     @Override
     public List<Inventario> listarPorProductoresumen(Producto p) {
     String sql = "from Inventario i where i.estado=true ";

     if (p.getId() == 1) {
     sql += " and i.producto.codigo like '%" + p.getCodigo() + "%'";
     } else {
     sql += " and i.producto.nombre like '%" + p.getNombre() + "%'";
     }

     if (p.getCategoria().getId() != 0) {
     sql += " and i.producto.categoria.id=" + p.getCategoria().getId();
     }

     if (p.getMarca().getId() != 0) {
     sql += " and i.producto.marca.id=" + p.getMarca().getId();
     }

     if (p.getUnidadmedida().getId() != 0) {
     sql += " and i.producto.unidadmedida.id=" + p.getUnidadmedida().getId();
     }
     List<Inventario> li = inventarioDao.consultList(sql);
     List<Inventario> lin = new ArrayList<>();

     for (Inventario i : li) {
     int aux = contieneProducto(i, lin);
     if (aux != -1) {
     //lin.get(aux).setCantidadact(i.getCantidadact() + lin.get(aux).getCantidadact());
     } else {
     lin.add(i);
     }
     }
     return lin;
     }

     @Override
     public Inventario obtenerPorProductoresumen(Producto p) {
     List<Inventario> li = inventarioDao.consultList("from Inventario i where i.estado=true and i.producto.id=" + p.getId() + " order by i.id asc");
     Inventario in = new Inventario(0, null, p, 0, 0, true, 0, null);

     if (li.size() > 0) {
     for (Inventario i : li) {
     //in.setCantidadact(in.getCantidadact() + i.getCantidadact());
     in.setPrecio(i.getPrecio());
     }
     }

     return in;
     }

     @Override
     public List<Inventario> listarPorProducto(Producto p) {
     return inventarioDao.consultList("from Inventario i where i.producto.id=" + p.getId());
     }

     @Override
     public List<Inventario> listarPorProducto2(Producto p) {
     String sql = "from Inventario i where i.cantidadact>0 ";

     if (p.getId() == 1) {
     sql += " and i.producto.codigo like '%" + p.getCodigo() + "%'";
     } else {
     sql += " and i.producto.nombre like '%" + p.getNombre() + "%'";
     }

     if (p.getCategoria().getId() != 0) {
     sql += " and i.producto.categoria.id=" + p.getCategoria().getId();
     }

     if (p.getMarca().getId() != 0) {
     sql += " and i.producto.marca.id=" + p.getMarca().getId();
     }

     if (p.getUnidadmedida().getId() != 0) {
     sql += " and i.producto.unidadmedida.id=" + p.getUnidadmedida().getId();
     }
     List<Inventario> li = inventarioDao.consultList(sql);
     return li;
     }

     public int contieneProducto(Inventario i, List<Inventario> li) {
     int r = -1;
     for (int j = 0; j < li.size(); j++) {
     Inventario i2 = li.get(j);
     if (i2.getProducto().equals(i.getProducto())) {
     return j;
     }
     }
     return r;
     }*/
    @Override
    public List<Inventario> listarPorAgencia(Agencia a) {
        return inventarioDao.consultList("from Inventario i where i.estado=true and i.andamio.almacen.agencia.id=" + a.getId());
    }

    @Override
    public Inventario registrarInventario(Inventario i) {
        List<Inventario> li = inventarioDao.consultList("from Inventario i where i.andamio.almacen.agencia.id=" + i.getAndamio().getAlmacen().getAgencia().getId() + " and i.producto.id=" + i.getProducto().getId());
        Inventario existe = null;
        for (Inventario ia : li) {
            if (ia.getAndamio().getId() == i.getAndamio().getId()) {
                existe = ia;
            }
        }
        if (existe == null) {
            return inventarioDao.save(i);
        } else {
            if (existe.isEstado()) {
                return null;
            } else {
                existe.setAndamio(i.getAndamio());
                existe.setCantidad(i.getCantidad());
                existe.setEstado(true);
                existe.setFechusuariocrea(i.getFechusuariocrea());
                existe.setIdusuariocrea(i.getIdusuariocrea());
                existe.setFechusuariomod(null);
                existe.setIdusuariomod(null);
                existe.setPreciomenmax(i.getPreciomenmax());
                existe.setPreciomenmin(i.getPreciomenmin());
                existe.setPreciomaymax(i.getPreciomaymax());
                existe.setPreciomaymin(i.getPreciomaymin());
                existe.setProducto(i.getProducto());

                return inventarioDao.update(existe);
            }
        }
    }

    @Override
    public Inventario actualizarInventario(Inventario i) {
        List<Inventario> li = inventarioDao.consultList("from Inventario i where i.andamio.almacen.agencia.id=" + i.getAndamio().getAlmacen().getAgencia().getId() + " and i.producto.id=" + i.getProducto().getId());
        boolean existe = false;
        for (Inventario ia : li) {
            if (ia.getAndamio().getId() == i.getAndamio().getId() && ia.getId() != i.getId()) {
                existe = true;
            }
        }
        if (!existe) {
            return inventarioDao.update(i);
        } else {
            return null;
        }
    }

    @Override
    public int eliminarInventario(Inventario i) {
        Inventario in = inventarioDao.read(i.getId());
        if (in.getCantidad() <= 0) {
            in.setEstado(false);
            i = inventarioDao.update(in);
            if (i != null) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }
}
