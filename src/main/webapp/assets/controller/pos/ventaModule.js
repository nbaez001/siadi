angular.module('ventaModule', ['ngValidate', 'dirPagination', 'components'])
        .controller('registroController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};
                s.cajero = {};
                s.venta = {cliente: {id: 0}, montototal: 0.0, fechasalida: new Date()};
                s.detalleventa = {producto: {}};
                s.cuota = {};
                s.estadoventas = [];
                s.ventas = [];
                s.cuotas = [];
                s.detalleventas = [];
                s.tipocomprobantes = [];
                s.tipocomprobantes2 = [];
                s.tipoventas = [];
                s.tipoprecios = [{id: 1, nombre: 'POR MENOR'}, {id: 2, nombre: 'POR MAYOR'}];
                s.tipoprecio = s.tipoprecios[0];
                s.creditos = [];
                var cad = '000000000000000';
                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/sessionagencia')
                        .success(function (data) {
                            s.agencia = data;
                            s.obtenerSesioncajero();
                            s.obtenerCodigoventa();
                            s.listarVentas();
                            s.listarCuotas();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/common/listartipo', {idtabla: 4})
                        .success(function (data) {
                            data.forEach(function (val, i) {
                                if (val.codigo === '01' || val.codigo === '03' || val.codigo === '04') {
                                    s.tipocomprobantes2.push(val);
                                    s.tipocomprobantes.push(val);
                                }
                            });
                            s.tipocomprobante = s.tipocomprobantes[0];
                            s.listarComprobantes();
                            s.tipocomprobante2 = s.tipocomprobantes2[0];
                            s.listarComprobantes2();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/common/listartipo', {idtabla: 12})
                        .success(function (data) {
                            s.tipoventas = data;
                            s.venta.idttipoventa = s.tipoventas[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/common/listartipo', {idtabla: 6})
                        .success(function (data) {
                            s.estadoventas = data;
                            s.venta.idtestadoventa = s.estadoventas[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                s.obtenerSesioncajero = function () {
                    h.post(contextPath + '/sessioncajero')
                            .success(function (data) {
                                s.cajero = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.listarComprobantes = function () {
                    s.comprobantes = [];
                    if (s.tipocomprobante.codigo === '60') {
                        s.comprobante = {};
                    } else {
                        h.post(contextPath + '/common/listarcomprobante', {id: s.agencia.id, idtipo: s.tipocomprobante.id, estado: true})
                                .success(function (data) {
                                    s.comprobantes = data;
                                    s.comprobantes.forEach(function (val, i) {
                                        s.comprobantes[i].numeroc = s.convertirDigitos(s.comprobantes[i].numero, s.comprobantes[i].longnumero);
                                        s.comprobantes[i].seriec = s.convertirDigitos(s.comprobantes[i].serie, s.comprobantes[i].longserie);
                                    });
                                    s.comprobante = s.comprobantes[0];
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.listarComprobantes2 = function () {
                    s.comprobantes2 = [];
                    h.post(contextPath + '/common/listarcomprobante', {id: s.agencia.id, idtipo: s.tipocomprobante2.id, estado: true})
                            .success(function (data) {
                                s.comprobantes2 = data;
                                s.comprobantes2.forEach(function (val, i) {
                                    s.comprobantes2[i].numeroc = s.convertirDigitos(s.comprobantes2[i].numero, s.comprobantes2[i].longnumero);
                                    s.comprobantes2[i].seriec = s.convertirDigitos(s.comprobantes2[i].serie, s.comprobantes2[i].longserie);
                                });
                                s.comprobante2 = s.comprobantes2[0];
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.actualizarComprobante = function (c) {
                    h.post(contextPath + '/common/obtcomprobante', {id: c.id})
                            .success(function (data) {
                                c.numeroc = s.convertirDigitos(data.numero, data.longnumero);
                                c.seriec = s.convertirDigitos(data.serie, data.longserie);
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigoventa = function () {
                    h.post(contextPath + '/pos/venta/obtenercodigoventa', s.agencia)
                            .success(function (data) {
                                s.venta.codigo = 'CV-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.listarVentas = function () {
                    var f = new Date();
                    f.setDate(f.getDate() - 30);
                    s.ventas = [];
                    h.post(contextPath + '/common/listarventa', {id: s.agencia.id, datelimit: f})
                            .success(function (data) {
                                s.ventas = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.listarCuotas = function () {
                    var f = new Date();
                    f.setDate(f.getDate() - 7);
                    s.cuotas = [];
                    h.post(contextPath + '/common/listarcuota', {id: s.agencia.id, datelimit: f})
                            .success(function (data) {
                                s.cuotas = data;
                                s.cuotas.forEach(function (v, i) {
                                    if (typeof v.credito.cliente.clientenatural !== 'undefined') {
                                        v.nombrecliente = v.credito.cliente.clientenatural.nombre + ' ' + v.credito.cliente.clientenatural.apellidopat;
                                    } else {
                                        v.nombrecliente = v.credito.cliente.clientejuridico.razonsocial;
                                    }
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.buscarProductoPorCodigo = function (request, response) {
                    s.detalleventa = {producto: {}};
                    h.post(contextPath + '/pos/venta/buscarinventario', {agencia: s.agencia, producto: {id: 1, codigo: s.codigoproducto}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].producto.codigo;
                                }
                                return response(data);
                            });
                };
                s.buscarProductoPorNombre = function (request, response) {
                    s.detalleventa = {producto: {}};
                    h.post(contextPath + '/pos/venta/buscarinventario', {agencia: s.agencia, producto: {id: 2, nombre: s.nombreproducto}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (s.tipoprecio.id === 1) {
                                        data[i].label = data[i].producto.nombre + ' - (Precio descontado: ' + data[i].preciomenmin + ', Precio estable:' + data[i].preciomenmax + ') - [' + data[i].andamio.almacen.nombre + ' - ' + data[i].andamio.nombre + ']';
                                    } else {
                                        data[i].label = data[i].producto.nombre + ' - (Precio descontado: ' + data[i].preciomaymin + ', Precio estable:' + data[i].preciomaymax + ') - [' + data[i].andamio.almacen.nombre + ' - ' + data[i].andamio.nombre + ']';
                                    }
                                }
                                return response(data);
                            });
                };
                s.seleccion = function (data) {
                    s.$apply(function () {
                        s.detalleventa.producto = data.producto;
                        s.detalleventa.inventario = data;
                        s.codigoproducto = data.producto.codigo;
                        s.nombreproducto = data.label;
                        delete s.detalleventa.inventario.label;
                        delete s.detalleventa.inventario.value;
                    });
                };

                s.buscarCNombre = function (request, response) {
                    h.post(contextPath + '/pos/venta/buscarcliente', {id: 2, clientenatural: {nombre: s.venta.nombrecliente, apellidopat: s.venta.nombrecliente, apellidomat: s.venta.nombrecliente}, clientejuridico: {razonsocial: s.venta.nombrecliente}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (typeof data[i].clientenatural !== 'undefined') {
                                        data[i].label = data[i].clientenatural.nombre + ' ' + data[i].clientenatural.apellidopat + ' ' + data[i].clientenatural.apellidomat + ' - [' + data[i].codigo + ']';
                                    } else {
                                        data[i].label = data[i].clientejuridico.razonsocial + ' - [' + data[i].codigo + ']';
                                    }
                                }
                                return response(data);
                            });
                };

                s.buscarCDni = function (request, response) {
                    h.post(contextPath + '/pos/venta/buscarcliente', {id: 1, clientenatural: {dni: s.dniruc}, clientejuridico: {ruc: s.dniruc}})
                            .success(function (data) {
                                console.log(data);
                                for (var i = 0; i < data.length; i++) {
                                    if (typeof data[i].clientenatural !== 'undefined') {
                                        data[i].label = data[i].clientenatural.dni;
                                    } else {
                                        data[i].label = data[i].clientejuridico.ruc;
                                    }
                                }
                                return response(data);
                            });
                };

                s.seleccion2 = function (data) {
                    s.$apply(function () {
                        s.venta.cliente = data;
                        if (typeof data.clientenatural !== 'undefined') {
                            s.venta.nombrecliente = data.clientenatural.nombre + ' ' + data.clientenatural.apellidopat + ' ' + data.clientenatural.apellidomat;
                            s.dniruc = data.clientenatural.dni;
                        } else {
                            s.venta.nombrecliente = data.clientejuridico.razonsocial;
                            s.dniruc = data.clientejuridico.ruc;
                        }
                        delete s.venta.cliente.label;
                        delete s.venta.cliente.value;
                    });
                };

                s.listarCreditos = function (c) {
                    s.creditos = [];
                    h.post(contextPath + '/pos/venta/listarcredito', {id: c.id})
                            .success(function (data) {
                                s.creditos = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarCNombre2 = function (request, response) {
                    h.post(contextPath + '/pos/venta/buscarcliente', {id: 2, clientenatural: {nombre: s.busqueda.nombrecliente, apellidopat: s.busqueda.nombrecliente, apellidomat: s.busqueda.nombrecliente}, clientejuridico: {razonsocial: s.busqueda.nombrecliente}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (typeof data[i].clientenatural !== 'undefined') {
                                        data[i].label = data[i].clientenatural.nombre + ' ' + data[i].clientenatural.apellidopat + ' ' + data[i].clientenatural.apellidomat + ' - [' + data[i].codigo + ']';
                                    } else {
                                        data[i].label = data[i].clientejuridico.razonsocial + ' - [' + data[i].codigo + ']';
                                    }
                                }
                                return response(data);
                            });
                };

                s.buscarCDni2 = function (request, response) {
                    h.post(contextPath + '/pos/venta/buscarcliente', {id: 1, clientenatural: {dni: s.busqueda.dniruc}, clientejuridico: {ruc: s.busqueda.dniruc}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (typeof data[i].clientenatural !== 'undefined') {
                                        data[i].label = data[i].clientenatural.dni;
                                    } else {
                                        data[i].label = data[i].clientejuridico.ruc;
                                    }
                                }
                                return response(data);
                            });
                };

                s.seleccion3 = function (data) {
                    s.$apply(function () {
                        s.busqueda.cliente = data;
                        if (typeof data.clientenatural !== 'undefined') {
                            s.busqueda.nombrecliente = data.clientenatural.nombre + ' ' + data.clientenatural.apellidopat + ' ' + data.clientenatural.apellidomat;
                            s.busqueda.dniruc = data.clientenatural.dni;
                        } else {
                            s.busqueda.nombrecliente = data.clientejuridico.razonsocial;
                            s.busqueda.dniruc = data.clientejuridico.ruc;
                        }
                        delete s.busqueda.cliente.label;
                        delete s.busqueda.cliente.value;

                        s.listarCreditos(s.busqueda.cliente);
                    });
                };

                s.validatedtv = {
                    rules: {},
                    messages: {}
                };
                s.agregarDetalleventa = function (form) {
                    if (Object.keys(s.detalleventa.producto).length > 0) {
                        var fil = s.detalleventas.filter(function (item) {
                            return item.inventario.id === s.detalleventa.inventario.id;
                        });
                        if (fil.length <= 0) {
                            if (s.tipoprecio.id === 1) {
                                s.detalleventas.push({producto: s.detalleventa.producto, cantidad: 0, cantidadperfecto: 0, cantidaddaniado: 0, preciounitario: s.detalleventa.inventario.preciomenmax, subtotal: 0.0, inventario: s.detalleventa.inventario});
                            } else {
                                s.detalleventas.push({producto: s.detalleventa.producto, cantidad: 0, cantidadperfecto: 0, cantidaddaniado: 0, preciounitario: s.detalleventa.inventario.preciomaymax, subtotal: 0.0, inventario: s.detalleventa.inventario});
                            }
                            s.detalleventa = {producto: {}};
                            s.nombreproducto = '';
                            s.codigoproducto = '';
                        } else {
                            n.notificar('Notificacion', 'info', 'Error, ya se agrego el PRODUCTO ' + s.detalleventa.producto.nombre);
                        }
                    }
                };
                s.quitarDetalleventa = function (dv) {
                    s.index = s.detalleventas.indexOf(dv);
                    s.detalleventas.splice(s.index, 1);
                    s.calcularTotal(); 
                };
                s.calcularSubtotal = function (dv) {
                    dv.subtotal = (dv.cantidad * dv.preciounitario);
                    s.calcularTotal(); 
               };
               s.calcularTotal=function(){
                   var montot = 0.0;
                    s.detalleventas.forEach(function (val, i) {
                        montot = montot + val.subtotal;
                    });
                    s.venta.montototal = montot;
               };
                s.validatev = {
                    rules: {
                        codigo: {
                            required: true
                        },
                        idcliente: {
                            required: true
                        },
                        nombrecliente: {
                            required: true
                        },
                        idtestadoventa: {
                            required: true
                        },
                        idttipocomprobante: {
                            required: true
                        },
                        comprobante: {
                            required: true,
                            min: 1
                        },
                        montototal: {
                            required: true
                        },
                        nrocomprobante: {
                            number: true
                        },
                        seriecomprobante: {
                            number: true
                        }
                    },
                    messages: {
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        idcliente: {
                            required: 'Campo obligatorio'
                        },
                        nombrecliente: {
                            required: 'Campo obligatorio'
                        },
                        idtestadoventa: {
                            required: 'Campo obligatorio'
                        },
                        idttipocomprobante: {
                            required: 'Campo obligatorio'
                        },
                        comprobante: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione un comprobante'
                        },
                        montototal: {
                            required: 'Campo obligatorio'
                        },
                        nrocomprobante: {
                            number: 'Ingrese solo numeros'
                        },
                        seriecomprobante: {
                            number: 'Ingrese solo numeros'
                        }
                    }
                };
                s.registrarv = function (form, formd) {
                    if (form.validate()) {
                        if (s.detalleventas.length > 0) {
                            if (formd.validate()) {
                                if (s.venta.idttipoventa.iditem === 2) {
                                    if (s.venta.cliente.id === 0) {
                                        n.notificar('Notificacion', 'warning', 'Error, seleccione un cliente');
                                    } else {
                                        var pre = JSON.parse(JSON.stringify(s.venta));
                                        var pred = JSON.parse(JSON.stringify(s.detalleventas));
                                        s.venta.idttipocomprobante = s.tipocomprobantes[5].id;
                                        s.venta.idttipoventa = s.venta.idttipoventa.id;
                                        s.venta.idtestadoventa = s.venta.idtestadoventa.id;
                                        s.venta.idcajero = s.cajero.id;
                                        s.venta.idusuariocrea = s.user.id;
                                        s.venta.fechusuariocrea = new Date();
                                        s.venta.agencia = s.agencia;

                                        s.detalleventas.forEach(function (val, i) {
                                            s.detalleventas[i].cantidadperfecto = s.detalleventas[i].cantidad;
                                            s.detalleventas[i].inventario = {id: s.detalleventas[i].inventario.id};
                                        });

                                        h.post(contextPath + '/pos/venta/registroc', {venta: s.venta, ldv: s.detalleventas})
                                                .success(function (data) {
                                                    if (data !== null) {
                                                        if (data.id === -1) {
                                                            n.notificar('Notificacion', 'error', 'Error, no hay suficientes items del producto ' + data.nombrecliente + ' disponibles en STOCK');
                                                        } else {
                                                            n.notificar('Notificacion', 'success', 'Se registro correctamente');
                                                            s.ventas.push(data);
                                                            s.venta = {idtestadoventa: s.estadoventas[0], idttipoventa: s.tipoventas[0], cliente: {id: 0}, montototal: 0.0, fechasalida: new Date()};
                                                            s.detalleventas = [];
                                                            s.detalleventa = {producto: {}};
                                                            s.obtenerSesioncajero();
                                                            s.obtenerCodigoventa();

                                                            s.impComp(data);
                                                        }
                                                    } else {
                                                        s.venta = pre;
                                                        s.detalleventas = pred;
                                                        n.notificar('Notificacion', 'error', 'Error: no se pudo registrar');
                                                    }
                                                })
                                                .error(function (error, status) {
                                                    s.venta = pre;
                                                    s.detalleventas = pred;
                                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                                });
                                    }
                                } else {
                                    var pre = JSON.parse(JSON.stringify(s.venta));
                                    var pred = JSON.parse(JSON.stringify(s.detalleventas));
                                    s.venta.idttipocomprobante = s.tipocomprobante.id;
                                    s.venta.idttipoventa = s.venta.idttipoventa.id;
                                    s.venta.idtestadoventa = s.venta.idtestadoventa.id;
                                    s.venta.idcajero = s.cajero.id;
                                    s.venta.nrocomprobante = s.comprobante.numeroc;
                                    s.venta.seriecomprobante = s.comprobante.seriec;
                                    s.venta.idusuariocrea = s.user.id;
                                    s.venta.fechusuariocrea = new Date();
                                    s.venta.agencia = s.agencia;
                                    if (s.venta.cliente.id === 0) {
                                        delete s.venta.cliente;
                                    }

                                    s.detalleventas.forEach(function (val, i) {
                                        s.detalleventas[i].cantidadperfecto = s.detalleventas[i].cantidad;
                                        s.detalleventas[i].inventario = {id: s.detalleventas[i].inventario.id};
                                    });

                                    h.post(contextPath + '/pos/venta/registro', {venta: s.venta, ldv: s.detalleventas, comprobante: {id: s.comprobante.id}})
                                            .success(function (data) {
                                                if (data !== null) {
                                                    if (data.id === -1) {
                                                        n.notificar('Notificacion', 'error', 'Error, no hay suficientes items del producto ' + data.nombrecliente + ' disponibles en STOCK');
                                                    } else {
                                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');
                                                        s.ventas.push(data);
                                                        s.venta = {idtestadoventa: s.estadoventas[0], idttipoventa: s.tipoventas[0], cliente: {id: 0}, montototal: 0.0, fechasalida: new Date()};
                                                        s.detalleventas = [];
                                                        s.detalleventa = {producto: {}};
                                                        s.obtenerSesioncajero();
                                                        s.obtenerCodigoventa();

                                                        s.actualizarComprobante(s.comprobante);

                                                        s.impComp(data);
                                                    }
                                                } else {
                                                    s.venta = pre;
                                                    s.detalleventas = pred;
                                                    n.notificar('Notificacion', 'error', 'Error: no se pudo registrar');
                                                }
                                            })
                                            .error(function (error, status) {
                                                s.venta = pre;
                                                s.detalleventas = pred;
                                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                                            });
                                }
                            }
                        } else {
                            n.notificar('Notificacion', 'warning', 'Error, registre al menos un detalle de venta');
                        }
                    }
                };

                s.cobrarCuota = function (c, f) {
                    if (f.validate()) {
                        s.index = s.creditos.indexOf(c);
                        var pre = JSON.parse(JSON.stringify(c));

                        var cct = {
                            credito: c,
                            cuota: {
                                idcajero: s.user.id,
                                idttipocomprobante: s.tipocomprobante2.id,
                                nrocomprobante: s.comprobante2.numeroc,
                                seriecomprobante: s.comprobante2.seriec,
                                monto: c.cuota,
                                fecha: new Date(),
                                detalle: 'AMORTIZACION DE CREDITO DE VENTA ' + c.venta.codigo,
                                idusuariocrea: s.user.id,
                                fechusuariocrea: new Date()
                            },
                            transaccion: {
                                idttipocomprobante: s.tipocomprobante2.id,
                                monto: c.cuota,
                                fecha: new Date(),
                                nrocomprobante: s.comprobante2.numeroc,
                                srecomprobante: s.comprobante2.seriec,
                                idusuariocrea: s.user.id,
                                fechusuariocrea: new Date()
                            },
                            comprobante: {
                                id: s.comprobante2.id
                            }
                        };

                        delete c.cuota;
                        h.post(contextPath + '/pos/venta/pagarcuota', cct)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Pago realizado');
                                        if (typeof data.credito.cliente.clientenatural !== 'undefined') {
                                            data.nombrecliente = data.credito.cliente.clientenatural.nombre + ' ' + data.credito.cliente.clientenatural.apellidopat;
                                        } else {
                                            data.nombrecliente = data.credito.cliente.clientejuridico.razonsocial;
                                        }
                                        s.cuotas.push(data);

                                        if (data.pagado) {
                                            s.creditos.splice(s.index, 1);
                                        } else {
                                            c.montoa = data.montoa;
                                        }
                                        s.obtenerSesioncajero();

                                        s.actualizarComprobante(s.comprobante2);
                                        s.actualizarComprobante(s.comprobante);

                                        s.impCompCuota(data);
                                    } else {
                                        c = pre;
                                        n.notificar('Notificacion', 'error', 'Ocurrio un error en la transaccion');
                                    }
                                })
                                .error(function (error, status) {
                                    c = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.impComp = function (v) {
                    window.open(contextPath + "/pos/venta/comprobantev?type=pdf&&id=" + v.id + "&&ida=" + v.agencia.id + "&&idc=" + v.idcajero + "&&idttc=" + v.idttipocomprobante, '_blank');
                };
                s.impCompCuota = function (c) {
                    window.open(contextPath + "/pos/venta/comprobantec?type=pdf&&id=" + c.id + "&&ida=" + c.credito.venta.agencia.id + "&&idc=" + c.idcajero + "&&idttc=" + c.idttipocomprobante, '_blank');
                };
                s.sesion = function () {
                    h.post(contextPath + '/session')
                            .success(function (data) {
                                if (data === null) {
                                    window.location.href = contextPath + '/login';
                                } else {
                                    s.user = data;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                    t(s.sesion, 3000);
                };
                t(s.sesion, 3000);
                s.convertirDigitos = function (valor, longvalor) {
                    if (valor.toString().length > longvalor) {
                        return valor.toString();
                    } else {
                        return cad.substr(0, longvalor).substr(0, longvalor - valor.toString().length) + valor.toString();
                    }
                };
            }
        ])
        .controller('cierrecajaController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};
                s.cajero = {};
                s.hoy = new Date();
                s.monto = 0.0;

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/sessionagencia')
                        .success(function (data) {
                            s.agencia = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/sessioncajero')
                        .success(function (data) {
                            s.cajero = data;
                            s.cajero.diezc = 0.0;
                            s.cajero.veintec = 0.0;
                            s.cajero.cincuentac = 0.0;
                            s.cajero.uns = 0.0;
                            s.cajero.doss = 0.0;
                            s.cajero.cincos = 0.0;
                            s.cajero.diezs = 0.0;
                            s.cajero.veintes = 0.0;
                            s.cajero.cincuentas = 0.0;
                            s.cajero.ciens = 0.0;
                            s.cajero.doscientoss = 0.0;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                s.calcularTotal = function () {
                    s.monto = parseFloat((s.cajero.diezc * 0.1 + s.cajero.veintec * 0.2 + s.cajero.cincuentac * 0.5 + s.cajero.uns * 1.0 + s.cajero.doss * 2.0 + s.cajero.cincos * 5.0 + s.cajero.diezs * 10.0 + s.cajero.veintes * 20.0 + s.cajero.cincuentas * 50.0 + s.cajero.ciens * 100.0 + s.cajero.doscientoss * 200.0).toFixed(2));
                };
                s.cerrarCajero = function (form) {
                    if (form.validate()) {
                        if (s.monto === s.cajero.saldocierre) {
                            var pre = JSON.parse(JSON.stringify(s.cajero));
                            s.cajero.estado = false;
                            s.cajero.fechacierre = new Date();
                            h.post(contextPath + '/pos/venta/cierrecajero', s.cajero)
                                    .success(function (data) {
                                        if (data === 0) {
                                            n.notificar('Notificacion', 'error', 'Error, no se pudo cerrar el cajero');
                                        } else {
                                            n.notificar('Notificacion', 'success', 'Cerrado correctamente');

                                            window.location.href = contextPath + '/pos/home';
                                        }
                                    })
                                    .error(function (error, status) {
                                        s.cajero = pre;
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    });
                        } else {
                            s.mostrarError = true;
                            s.error = 'La suma de los billetes y monedas ingresadas no coinciden con el total';

                            t(function () {
                                s.mostrarError = false;
                            }, 8000);
                        }
                    }
                };
                s.sesion = function () {
                    h.post(contextPath + '/session')
                            .success(function (data) {
                                if (data === null) {
                                    window.location.href = contextPath + '/login';
                                } else {
                                    s.user = data;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                    t(s.sesion, 3000);
                };
                t(s.sesion, 3000);
            }
        ]);

        