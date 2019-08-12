/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.BobedaDao;
import com.romaqui.siadi.dao.CajeroDao;
import com.romaqui.siadi.dao.UsuarioDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.entity.Bobeda;
import com.romaqui.siadi.entity.Cajero;
import com.romaqui.siadi.entity.Transferencia;
import com.romaqui.siadi.entity.Usuario;
import com.romaqui.siadi.service.CajeroService;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class CajeroServiceImpl extends GenericServiceImpl<Cajero> implements CajeroService {

    @Autowired
    CajeroDao cajeroDao;
    @Autowired
    UsuarioDao usuarioDao;
    @Autowired
    BobedaDao bobedaDao;

    SimpleDateFormat sdf;
    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    DecimalFormat df;

    public CajeroServiceImpl() {
        sdf = new SimpleDateFormat("yyyy-MM-dd");
        simbolo.setDecimalSeparator('.');
        df = new DecimalFormat("####.#", simbolo);
    }

    @Override
    public List<Cajero> listarPorAgencia(Agencia a) {
        List<Cajero> listaCajero;
        if (a.getDatelimit() != null) {
            listaCajero = cajeroDao.consultList("from Cajero c where c.caja.agencia.id=" + a.getId() + " and c.fechusuariocrea>'" + sdf.format(a.getDatelimit()) + "'");
        } else {
            listaCajero = cajeroDao.consultList("from Cajero c where c.caja.agencia.id=" + a.getId());
        }

        for (Cajero c : listaCajero) {
            String s = usuarioDao.consultUnique("select u.colaborador.nombre||' '||u.colaborador.apellidopat||' ('||u.usuario||')' from Usuario u where u.id=" + c.getIdusuario()).toString();
            c.setNombres(s);
        }
        return listaCajero;
    }

    @Override
    public Transferencia crearCajero(Transferencia t) {
        Bobeda bo = bobedaDao.read(t.getBobeda().getId());
        if (t.getMontototal() > 0.0) {
            if (bo.getDiezcz() >= t.getDiezc() && bo.getVeintecz() >= t.getVeintec() && bo.getCincuentacz() >= t.getCincuentac() && bo.getUnsz() >= t.getUns() && bo.getDossz() >= t.getDoss() && bo.getCincosz() >= t.getCincos() && bo.getDiezsz() >= t.getDiezs() && bo.getVeintesz() >= t.getVeintes() && bo.getCincuentasz() >= t.getCincuentas() && bo.getCiensz() >= t.getCiens() && bo.getDoscientossz() >= t.getDoscientoss()) {
                bo.setDiezcz(bo.getDiezcz() - t.getDiezc());
                bo.setVeintecz(bo.getVeintecz() - t.getVeintec());
                bo.setCincuentacz(bo.getCincuentacz() - t.getCincuentac());
                bo.setUnsz(bo.getUnsz() - t.getUns());
                bo.setDossz(bo.getDossz() - t.getDoss());
                bo.setCincosz(bo.getCincosz() - t.getCincos());
                bo.setDiezsz(bo.getDiezsz() - t.getDiezs());
                bo.setVeintesz(bo.getVeintesz() - t.getVeintes());
                bo.setCincuentasz(bo.getCincuentasz() - t.getCincuentas());
                bo.setCiensz(bo.getCiensz() - t.getCiens());
                bo.setDoscientossz(bo.getDoscientossz() - t.getDoscientoss());

                bo.setMontocierre(Double.parseDouble(df.format(bo.getDiezcz() * 0.10 + bo.getVeintecz() * 0.20 + bo.getCincuentacz() * 0.50 + bo.getUnsz() * 1.0 + bo.getDossz() * 2.0 + bo.getCincosz() * 5.0 + bo.getDiezsz() * 10.0 + bo.getVeintesz() * 20.0 + bo.getCincuentasz() * 50.0 + bo.getCiensz() * 100.0 + bo.getDoscientossz() * 200.0)));
                t.setBobeda(bo);
                return cajeroDao.crearCajero(t);
            } else {
                return null;
            }
        } else {
            t.setBobeda(bo);
            return cajeroDao.crearCajero(t);
        }
    }

    @Override
    public Cajero obtenerCajero(HttpSession s) {
        try {
            Usuario user = (Usuario) s.getAttribute("user");
            Agencia agen = (Agencia) s.getAttribute("agencia");
            Cajero c = (Cajero) cajeroDao.consultUnique("from Cajero c where c.idusuario=" + user.getId() + " and c.caja.agencia.id=" + agen.getId() + " and c.estado=true");
            if (c != null) {
                s.setAttribute("cajero", c);
                return c;
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Transferencia cerrarCajero(Transferencia tr) {
        Bobeda b = bobedaDao.read(tr.getBobeda().getId());
        tr.getCajero().setPendiente(false);

        b.setDiezcz(b.getDiezcz() + tr.getDiezc());
        b.setVeintecz(b.getVeintecz() + tr.getVeintec());
        b.setCincuentacz(b.getCincuentacz() + tr.getCincuentac());
        b.setUnsz(b.getUnsz() + tr.getUns());
        b.setDossz(b.getDossz() + tr.getDoss());
        b.setCincosz(b.getCincosz() + tr.getCincos());
        b.setDiezsz(b.getDiezsz() + tr.getDiezs());
        b.setVeintesz(b.getVeintesz() + tr.getVeintes());
        b.setCincuentasz(b.getCincuentasz() + tr.getCincuentas());
        b.setCiensz(b.getCiensz() + tr.getCiens());
        b.setDoscientossz(b.getDoscientossz() + tr.getDoscientoss());

        b.setMontocierre(Double.parseDouble(df.format(b.getDiezcz() * 0.10 + b.getVeintecz() * 0.20 + b.getCincuentacz() * 0.50 + b.getUnsz() * 1.0 + b.getDossz() * 2.0 + b.getCincosz() * 5.0 + b.getDiezsz() * 10.0 + b.getVeintesz() * 20.0 + b.getCincuentasz() * 50.0 + b.getCiensz() * 100.0 + b.getDoscientossz() * 200.0)));

        tr.setBobeda(b);

        return cajeroDao.cerrarCajero(tr);
    }

}
