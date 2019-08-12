/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.ClienteDao;
import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.nuevo.ClienteRepresentlegal;
import com.romaqui.siadi.service.ClienteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class ClienteServiceImpl extends GenericServiceImpl<Cliente> implements ClienteService {

    @Autowired
    ClienteDao clienteDao;

    @Override
    public List<Cliente> listarCliente(Tablamaestra t) {
        return clienteDao.consultList("from Cliente c where c.idttipocliente=" + t.getId());
    }

    @Override
    public List<Cliente> listarClientejuridico(Cliente c) {
        if (c.getId() == 1) {
            return clienteDao.consultList("from Cliente c where c.clientejuridico.ruc=" + c.getClientejuridico().getRuc() + "");
        } else {
            return clienteDao.consultList("from Cliente c where c.clientejuridico.razonsocial like '%" + c.getClientejuridico().getRazonsocial() + "%' or  c.clientejuridico.nombrecomercial like '%" + c.getClientejuridico().getNombrecomercial() + "%'");
        }
    }

    @Override
    public List<Cliente> listarClientenatural(Cliente c) {
        if (c.getId() == 1) {
            return clienteDao.consultList("from Cliente c where c.clientenatural.dni=" + c.getClientenatural().getDni() + "");
        } else {
            return clienteDao.consultList("from Cliente c where c.clientenatural.nombre like '%" + c.getClientenatural().getNombre() + "%' or  c.clientenatural.apellidopat like '%" + c.getClientenatural().getApellidopat() + "%' or  c.clientenatural.apellidomat like '%" + c.getClientenatural().getApellidomat() + "%'");
        }
    }

    @Override
    public int obtenerCodigocliente(Tablamaestra tm) {
        int dato;
        try {
            if (tm.getId() == 1) {
                dato = Integer.parseInt(clienteDao.consultUnique("select count(p) from Cliente p where p.idttipocliente=" + tm.getId()).toString());
            } else {
                dato = Integer.parseInt(clienteDao.consultUnique("select count(p) from Cliente p where p.idttipocliente=" + tm.getId()).toString());
            }
        } catch (Exception e) {
            dato = 0;
        }
        return dato + 1;
    }

    @Override
    public Cliente registrarClientejuridico(ClienteRepresentlegal crl) {
        return clienteDao.registrarClientejuridico(crl.getCliente(),crl.getLrl());
    }

    @Override
    public int eliminarClientejuridico(Cliente c) {
        return clienteDao.eliminarClientejuridico(c);
    }

    @Override
    public Cliente actualizarClientenatural(Cliente c) {
        return clienteDao.actualizarClientenatural(c);
    }

    @Override
    public Cliente registrarClientenatural(Cliente c) {
        return clienteDao.registrarClientenatural(c);
    }

    @Override
    public int eliminarClientenatural(Cliente c) {
        return clienteDao.eliminarClientenatural(c);
    }

    @Override
    public Cliente actualizarClientejuridico(Cliente c) {
        return clienteDao.actualizarClientejuridico(c);
    }
}
