/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.interceptor;

import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Inventario;
import com.romaqui.siadi.entity.Inventarioiniciomes;
import com.romaqui.siadi.entity.Producto;
import com.romaqui.siadi.service.InventarioService;
import com.romaqui.siadi.service.InventarioiniciomesService;
import com.romaqui.siadi.service.ProductoService;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author nerio
 */
@Component
public class InventarioInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    InventarioiniciomesService inventarioiniciomesService;
    @Autowired
    ProductoService productoService;
    @Autowired
    InventarioService inventarioService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Calendar c = Calendar.getInstance();
        Agencia a = (Agencia) request.getSession().getAttribute("agencia");

        try {
            List<Producto> lp = productoService.list();
            for (Producto p : lp) {
                if (!inventarioiniciomesService.existeRegistro(p, c.get(Calendar.YEAR), c.get(Calendar.MONTH))) {
                    List<Inventario> li = inventarioService.listarPorProducto(p, a);
                    Inventarioiniciomes iim;
                    if (li != null && !li.isEmpty()) {
                        iim = new Inventarioiniciomes(p, a, 0, 0, new Date(), c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE));
                    } else {
                        double cant = 0;
                        double prec = 0;
                        for (Inventario i : li) {
                            cant += i.getCantidad();
                            prec = i.getPreciomenmin();
                        }
                        iim = new Inventarioiniciomes(p, a, cant, prec, new Date(), c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE));
                    }
                    inventarioiniciomesService.create(iim);
                }
            }
            return true;
        } catch (Exception e) {
            return true;
        }
    }
}
