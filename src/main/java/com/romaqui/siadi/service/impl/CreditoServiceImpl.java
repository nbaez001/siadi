/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.CreditoDao;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Comprobante;
import com.romaqui.siadi.entity.Credito;
import com.romaqui.siadi.entity.Cuota;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.Transaccion;
import com.romaqui.siadi.service.ComprobanteService;
import com.romaqui.siadi.service.CreditoService;
import com.romaqui.siadi.service.TablamaestraService;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NERIO
 */
@Service
public class CreditoServiceImpl extends GenericServiceImpl<Credito> implements CreditoService {

    @Autowired
    CreditoDao creditoDao;
    @Autowired
    TablamaestraService tablamaestraService;
    @Autowired
    ComprobanteService comprobanteService;

    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat df;

    public CreditoServiceImpl() {
        simbolo.setDecimalSeparator('.');
        df = new DecimalFormat("####.#", simbolo);
    }

    @Override
    public List<Credito> listarCreditos(Cliente c) {
        return creditoDao.consultList("from Credito c where c.cliente.id=" + c.getId() + " and (c.pagado=false or c.montoa>0.0)");
    }

    @Override
    public Cuota pagarCuota(Credito cr, Cuota cu, Transaccion tr, Comprobante comp, HttpSession s) {
        Cajero c = (Cajero) s.getAttribute("cajero");
        c.setSaldocierre(Double.parseDouble(df.format(c.getSaldocierre() + cu.getMonto())));

        if (cr.getMontoa() > cu.getMonto()) {
            cr.setMontoa(Double.parseDouble(df.format(cr.getMontoa() - cu.getMonto())));
        } else {
            if (cr.getMontoa() == cu.getMonto()) {
                cr.setMontoa(Double.parseDouble(df.format(cr.getMontoa() - cu.getMonto())));
                cr.setPagado(true);
            } else {
                return null;
            }
        }
        
        cu.setCredito(cr);
        tr.setIdttipotransaccion(tablamaestraService.obtenerTipoIdItem(new Tablamaestra(9, 1)).getId());
        tr.setCajero(c);

        comp = comprobanteService.get(comp.getId());
        comp.setSerie(comp.getSerie() + 1);

        return creditoDao.pagarCuota(cr, cu, tr, c, comp, s);
    }

}
