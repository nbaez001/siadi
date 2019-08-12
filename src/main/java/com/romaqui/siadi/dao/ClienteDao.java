/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.dao;

import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Representantlegal;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ClienteDao extends GenericDao<Cliente> {

    Cliente registrarClientejuridico(Cliente c, List<Representantlegal> lrl);

    int eliminarClientejuridico(Cliente p);

    Cliente actualizarClientejuridico(Cliente p);

    Cliente registrarClientenatural(Cliente p);

    int eliminarClientenatural(Cliente p);

    Cliente actualizarClientenatural(Cliente p);
}
