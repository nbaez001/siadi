/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Cliente;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.nuevo.ClienteRepresentlegal;
import java.util.List;

/**
 *
 * @author nerio
 */
public interface ClienteService extends GenericService<Cliente> {

    List<Cliente> listarCliente(Tablamaestra tm);

    List<Cliente> listarClientejuridico(Cliente p);

    List<Cliente> listarClientenatural(Cliente p);

    int obtenerCodigocliente(Tablamaestra tm);

    Cliente registrarClientejuridico(ClienteRepresentlegal crl);

    int eliminarClientejuridico(Cliente p);

    Cliente actualizarClientejuridico(Cliente c);

    Cliente registrarClientenatural(Cliente p);

    int eliminarClientenatural(Cliente p);

    Cliente actualizarClientenatural(Cliente p);
}
