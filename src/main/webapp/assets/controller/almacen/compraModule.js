angular.module('compraModule', ['ngValidate', 'dirPagination', 'components'])
        .directive('ngFileModel', ['$parse', function (p) {
                return {
                    restrict: 'A',
                    link: function (scope, iElement, iAttrs) {
                        iElement.on('change', function (e) {
                            p(iAttrs.ngFileModel).assign(scope, iElement[0].files[0]);
                        });
                    }
                };
            }
        ])
        .controller('registroController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {

                s.user = {};
                s.agencia = {};
                s.compra = {seriecomprobante: '0001', nrocomprobante: '000000', proveedor: {codigo: 'PJ-0000'}};
                s.compra.proveedor = {};
                s.detallecompra = {producto: {}};
                s.personajuridicab = {};

                s.estadocompras = [];
                s.compras = [];
                s.proveedores = [];
                s.tipoproveedores = [];
                s.detallecompras = [];
                s.tipocomprobantes = [];

                //parametros de busqueda de productos
                s.categorias = [];
                s.marcas = [];
                s.unidadmedidas = [];
                s.productos = [];
                s.productob = {};

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
                            s.obtenerCodigocompra();
                            s.listarCompras();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 4})
                        .success(function (data) {
                            s.tipocomprobantes = data;
                            s.compra.idttipocomprobante = s.tipocomprobantes[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 5})
                        .success(function (data) {
                            s.estadocompras = data;
                            s.compra.idtestadocompra = s.estadocompras[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarproveedor', {idtabla: 3})
                        .success(function (data) {
                            s.tipoproveedores = data;
                            s.tipoproveedor = s.tipoproveedores[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarCompras = function () {
                    h.post(contextPath + '/common/listarcompra', s.agencia)
                            .success(function (data) {
                                s.compras = data;
                                s.compras.forEach(function (val, i) {
                                    val.idtestadocompra = s.estadocompras.filter(function (item) {
                                        return item.id === val.idtestadocompra;
                                    })[0];
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigocompra = function () {
                    h.post(contextPath + '/almacen/compra/obtcodigocomp', s.agencia)
                            .success(function (data) {
                                s.compra.codigo = 'CP-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarProductoPorCodigo = function (request, response) {
                    s.detallecompra = {producto: {}};
                    h.post(contextPath + '/almacen/administracion/buscarproducto', {id: 1, codigo: s.codigoproducto})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].codigo;
                                }
                                return response(data);
                            });
                };

                s.buscarProductoPorNombre = function (request, response) {
                    s.detallecompra = {producto: {}};
                    h.post(contextPath + '/almacen/administracion/buscarproducto', {id: 2, nombre: s.nombreproducto})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].nombre;
                                }
                                return response(data);
                            });
                };

                s.seleccion = function (data) {
                    s.$apply(function () {
                        s.detallecompra.producto = data;
                        s.nombreproducto = data.nombre;
                        s.codigoproducto = data.codigo;
                        delete s.detallecompra.producto.label;
                        delete s.detallecompra.producto.value;
                    });
                };

                s.buscarProveedorPorDocumento = function (request, response) {
                    h.post(contextPath + '/almacen/compra/buscarproveedor', {id: 1, proveedornatural: {dni: s.documento}, proveedorjuridico: {ruc: s.documento}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].proveedorjuridico === null || typeof data[i].proveedorjuridico === 'undefined') {
                                        data[i].label = data[i].proveedornatural.dni;
                                    } else {
                                        data[i].label = data[i].proveedorjuridico.ruc;
                                    }
                                }
                                return response(data);
                            });
                };

                s.buscarProveedorPorNombre = function (request, response) {
                    h.post(contextPath + '/almacen/compra/buscarproveedor', {id: 2, proveedornatural: {nombre: s.nombreproveedor, apellidopat: s.nombreproveedor, apellidomat: s.nombreproveedor}, proveedorjuridico: {razonsocial: s.nombreproveedor, nombrecomercial: s.nombreproveedor}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].proveedorjuridico === null || typeof data[i].proveedorjuridico === 'undefined') {
                                        data[i].label = data[i].proveedornatural.nombre + ' ' + data[i].proveedornatural.apellidopat + ' ' + data[i].proveedornatural.apellidomat;
                                    } else {
                                        data[i].label = data[i].proveedorjuridico.razonsocial + ' (' + data[i].proveedorjuridico.nombrecomercial + ')';
                                    }
                                }
                                return response(data);
                            });
                };

                s.seleccion2 = function (data) {
                    console.log('llego a seleccion 2');
                    s.$apply(function () {
                        s.compra.proveedor = data;

                        if (data.proveedorjuridico === null || typeof data.proveedorjuridico === 'undefined') {
                            s.nombreproveedor = data.proveedornatural.nombre + ' ' + data.proveedornatural.apellidopat + ' ' + data.proveedornatural.apellidomat;
                            s.documento = data.proveedornatural.dni;
                        } else {
                            s.nombreproveedor = data.proveedorjuridico.razonsocial + ' (' + data.proveedorjuridico.nombrecomercial + ')';
                            s.documento = data.proveedorjuridico.ruc;
                        }
                        delete s.compra.proveedor.label;
                        delete s.compra.proveedor.value;
                    });
                };

                //FUNCIONES DE DETALLE COMPRA
                s.validatedtc = {
                    rules: {},
                    messages: {}
                };

                s.agregarDetallecompra = function (form) {
                    if (Object.keys(s.detallecompra.producto).length > 0) {
                        var fil = s.detallecompras.filter(function (item) {
                            return item.producto.id === s.detallecompra.producto.id;
                        });
                        if (fil.length <= 0) {
                            s.detallecompras.push({producto: s.detallecompra.producto, cantidad: 0, cantidadperfecto: 0, cantidaddaniado: 0, preciounitario: 0, subtotal: 0});
                            s.detallecompra = {producto: {}};
                            s.nombreproducto = '';
                            s.codigoproducto = '';
                        } else {
                            n.notificar('Notificacion', 'info', 'Error, ya se agrego el PRODUCTO ' + s.detallecompra.producto.nombre);
                        }
                    }
                };

                s.quitarDetallecompra = function (dc) {
                    s.index = s.detallecompras.indexOf(dc);
                    s.detallecompras.splice(s.index, 1);
                    s.calcularTotal();
                };

                s.calcularSubtotal = function (dc) {
                    dc.subtotal = (dc.cantidad * dc.preciounitario);
                    s.calcularTotal();
                    s.calcularPerfecto(dc);
                };

                s.calcularTotal = function () {
                    var montot = 0.0;
                    s.detallecompras.forEach(function (val, i) {
                        montot = montot + val.subtotal;
                    });
                    s.compra.montototal = montot;
                };

                s.calcularPerfecto = function (dc) {
                    dc.cantidadperfecto = (dc.cantidad - dc.cantidaddaniado);
                };

                s.validatec = {
                    rules: {
                        codigocompra: {
                            required: true
                        },
                        codigoproveedor: {
                            required: true
                        },
                        documento: {
                            required: true
                        },
                        nombreproveedor: {
                            required: true
                        },
                        estadocompra: {
                            required: true
                        },
                        tipocomprobante: {
                            required: true
                        },
                        montototal: {
                            required: true
                        },
                        fechacompra: {
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
                        codigo2: {
                            required: 'Campo obligatorio'
                        },
                        documento: {
                            required: 'Campo obligatorio'
                        },
                        nombreproveedor: {
                            required: 'Campo obligatorio'
                        },
                        estadocompra: {
                            required: 'Campo obligatorio'
                        },
                        tipocomprobante: {
                            required: 'Campo obligatorio'
                        },
                        montototal: {
                            required: 'Campo obligatorio'
                        },
                        fechacompra: {
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

                s.registrarc = function (form) {
                    if (form.validate()) {
                        if (s.detallecompras.length > 0) {
                            if (s.compra.idttipocomprobante.codigo === '01' || s.compra.idttipocomprobante.codigo === '03') {
                                if (s.compra.nrocomprobante.length > 0 && s.compra.seriecomprobante.length > 0) {
                                    h.post(contextPath + '/almacen/compra/agregardetallecompra', s.detallecompras)
                                            .success(function (data) {
                                                if (data === 1) {
                                                    var formData = new FormData();
                                                    formData.append('proveedor.id', s.compra.proveedor.id);
                                                    formData.append('proveedor.idttipoproveedor', s.compra.proveedor.idttipoproveedor);
                                                    formData.append('proveedor.codigo', s.compra.proveedor.codigo);
                                                    formData.append('agencia.id', s.agencia.id);
                                                    formData.append('idttipocomprobante', s.compra.idttipocomprobante.id);
                                                    formData.append('idtestadocompra', s.compra.idtestadocompra.id);
                                                    formData.append('codigo', s.compra.codigo);
                                                    formData.append('montototal', s.compra.montototal);
                                                    formData.append('observacion', s.compra.observacion);
                                                    formData.append('nrocomprobante', s.compra.nrocomprobante);
                                                    formData.append('seriecomprobante', s.compra.seriecomprobante);
                                                    formData.append('codordencompra', s.compra.codordencompra);
                                                    formData.append('fechacompra', s.compra.fechacompra);
                                                    formData.append('fechaalmacenamiento', s.compra.fechacompra);
                                                    formData.append('idusuariocrea', s.user.id);
                                                    formData.append('fechusuariocrea', new Date());
                                                    formData.append('comprobante', s.file);
                                                    formData.append('ordencompra', s.file2);

                                                    h.post(contextPath + '/almacen/compra/registro', formData, {headers: {'Content-type': undefined}, transformRequest: angular.identity})
                                                            .success(function (data) {
                                                                if (data !== null) {
                                                                    n.notificar('Notificacion', 'success', 'Se registro correctamente la compra');

                                                                    data.idtestadocompra = s.estadocompras.filter(function (item) {
                                                                        return item.id === data.idtestadocompra;
                                                                    })[0];

                                                                    s.compras.push(data);

                                                                    s.compra = {proveedor: {codigo: 'PJ-0000'}, seriecomprobante: 0, nrocomprobante: 0, idtestadocompra: s.estadocompras[0]};
                                                                    s.obtenerCodigocompra();
                                                                    s.file = {};
                                                                    s.file2 = {};

                                                                    s.detallecompras = [];
                                                                } else {
                                                                    n.notificar('Notificacion', 'error', 'Error al registrar compra');
                                                                }
                                                            })
                                                            .error(function (msg, status) {
                                                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                                                            });
                                                } else {
                                                    n.notificar('Notificacion', 'error', 'Error: no se pudo cargar el detalle de compra');
                                                }
                                            })
                                            .error(function (error, status) {
                                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                                            });
                                } else {
                                    n.notificar('Notificacion', 'warning', 'Error, especifique SERIE y NUMERO del COMPROBANTE DE PAGO');
                                }
                            } else {
                                h.post(contextPath + '/almacen/compra/agregardetallecompra', s.detallecompras)
                                        .success(function (data) {
                                            if (data === 1) {
                                                var formData = new FormData();
                                                formData.append('proveedor.id', s.compra.proveedor.id);
                                                formData.append('proveedor.idttipoproveedor', s.compra.proveedor.idttipoproveedor);
                                                formData.append('proveedor.codigo', s.compra.proveedor.codigo);
                                                formData.append('agencia.id', s.agencia.id);
                                                formData.append('idttipocomprobante', s.compra.idttipocomprobante.id);
                                                formData.append('idtestadocompra', s.compra.idtestadocompra.id);
                                                formData.append('codigo', s.compra.codigo);
                                                formData.append('montototal', s.compra.montototal);
                                                formData.append('observacion', s.compra.observacion);
                                                formData.append('nrocomprobante', s.compra.nrocomprobante);
                                                formData.append('seriecomprobante', s.compra.seriecomprobante);
                                                formData.append('codordencompra', s.compra.codordencompra);
                                                formData.append('fechacompra', s.compra.fechacompra);
                                                formData.append('fechaalmacenamiento', s.compra.fechacompra);
                                                formData.append('idusuariocrea', s.user.id);
                                                formData.append('fechusuariocrea', new Date());
                                                formData.append('comprobante', s.file);
                                                formData.append('ordencompra', s.file2);

                                                h.post(contextPath + '/almacen/compra/registro', formData, {headers: {'Content-type': undefined}, transformRequest: angular.identity})
                                                        .success(function (data) {
                                                            if (data !== null) {
                                                                n.notificar('Notificacion', 'success', 'Se registro correctamente la compra');
                                                                s.compras.push(data);

                                                                s.compra = {proveedor: {codigo: 'PJ-0000'}, seriecomprobante: 001, nrocomprobante: 000000, idtestadocompra: s.estadocompras[0]};
                                                                s.obtenerCodigocompra();
                                                                s.file = {};
                                                                s.file2 = {};

                                                                s.detallecompras = [];
                                                            } else {
                                                                n.notificar('Notificacion', 'error', 'Error al registrar compra');
                                                            }
                                                        })
                                                        .error(function (msg, status) {
                                                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                                                        });
                                            } else {
                                                n.notificar('Notificacion', 'error', 'Error: no se pudo cargar el detalle de compra');
                                            }
                                        })
                                        .error(function (error, status) {
                                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        });
                            }
                        } else {
                            n.notificar('Notificacion', 'warning', 'Error, registre al menos un detalle de compra');
                        }
                    }
                };

                s.eliminarc = function (c) {
                    h.post(contextPath + '/almacen/compra/eliminarcompra', c)
                            .success(function (data) {
                                if (data === 1) {
                                    n.notificar('Notificacion', 'success', 'Se elimino correctamente el registro de compra');
                                    s.index = s.compras.indexOf(c);

                                    s.compras.splice(s.index, 1);
                                } else {
                                    n.notificar('Notificacion', 'error', 'Error, no se pudo eliminar el registro de compra');
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
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
                    t(s.sesion, 60000);
                };

                t(s.sesion, 60000);
            }
        ])
        .controller('almacenamientoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.compra = {id: 0};

                s.estadocompras = [];
                s.compras = [];
                s.detallecompras = [];
                s.inventarios = [];
                s.inventarios2 = [];
                s.almacenes = [];
                s.andamios = [];

                s.comprab = {};

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
                            s.listarAlmacenes();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 5})
                        .success(function (data) {
                            s.estadocompras = data;
                            s.comprab.idtestadocompra = s.estadocompras[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarAlmacenes = function () {
                    h.post(contextPath + '/common/listaralmacen', s.agencia)
                            .success(function (data) {
                                s.almacenes = data;
                                s.almacen = s.almacenes[0];
                                s.listarAndamios(s.almacen);
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.listarAndamios = function (a) {
                    h.post(contextPath + '/common/listarandamio', a)
                            .success(function (data) {
                                s.andamios = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarCompraPorFecha = function () {
                    angular.element('#modalCompra').modal('show');
                };

                s.buscarCompraPorFechaCompl = function () {
                    s.compras = [];
                    h.post(contextPath + '/almacen/compra/buscarcompraf', {idtestadocompra: s.comprab.idtestadocompra.id, fechusuariocrea: s.comprab.fechusuariocrea, fechusuariomod: s.comprab.fechusuariomod})
                            .success(function (data) {
                                s.compras = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarCompraPorCodigo = function (request, response) {
                    h.post(contextPath + '/almacen/compra/buscarcomprac', {idtestadocompra: s.estadocompras[0].id, codigo: s.compra.codigo})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].codigo;
                                }
                                return response(data);
                            });
                };

                s.buscarCompraPorProveedor = function (request, response) {
                    h.post(contextPath + '/almacen/compra/buscarcomprap', {idtestadocompra: s.estadocompras[0].id, proveedor: {proveedorjuridico: {id: 2, razonsocial: s.nombreproveedor, nombrecomercial: s.nombreproveedor}, proveedornatural: {id: 2, nombre: s.nombreproveedor, apellidopat: s.nombreproveedor, apellidomat: s.nombreproveedor}}})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    if (data[i].proveedor.proveedorjuridico === null || typeof data[i].proveedor.proveedorjuridico === 'undefined') {
                                        data[i].label = data[i].proveedor.proveedornatural.nombre + ' ' + data[i].proveedor.proveedornatural.apellidopat + ' ' + data[i].proveedor.proveedornatural.apellidomat + ' - ' + data[i].fechacompra;
                                    } else {
                                        data[i].label = data[i].proveedor.proveedorjuridico.razonsocial + ' (' + data[i].proveedor.proveedorjuridico.nombrecomercial + ')' + ' - ' + data[i].fechacompra;
                                    }
                                }
                                return response(data);
                            });
                };

                s.buscarDetallecompra = function () {
                    if (s.compra.proveedor.proveedorjuridico === null || typeof s.compra.proveedor.proveedorjuridico === 'undefined') {
                        s.nombreproveedor = s.compra.proveedor.proveedornatural.nombre + ' ' + s.compra.proveedor.proveedornatural.apellidopat + ' ' + s.compra.proveedor.proveedornatural.apellidomat + ' - ' + s.compra.fechacompra;
                    } else {
                        s.nombreproveedor = s.compra.proveedor.proveedorjuridico.razonsocial + ' (' + s.compra.proveedor.proveedorjuridico.nombrecomercial + ')' + ' - ' + s.compra.fechacompra;
                    }
                    delete s.compra.label;
                    delete s.compra.value;
                    angular.element('#modalCompra').modal('hide');

                    h.post(contextPath + '/almacen/compra/listardetallecompra', s.compra)
                            .success(function (data) {
                                if (data.length > 0) {
                                    s.detallecompras = data;
                                    s.inventarios = [];

                                    s.detallecompras.forEach(function (value, index) {
                                        h.post(contextPath + '/almacen/administracion/buscartodoinv', {producto: s.detallecompras[index].producto, agencia: s.agencia})
                                                .success(function (d) {
                                                    if (d.length > 0) {
                                                        var item = {
                                                            id: d[0].id,
                                                            andamio: d[0].andamio,
                                                            producto: d[0].producto,
                                                            cantidad: d[0].cantidad + s.detallecompras[index].cantidadperfecto,
                                                            preciomenmin: d[0].preciomenmin,
                                                            preciomenmax: d[0].preciomenmax,
                                                            preciomaymin: d[0].preciomaymin,
                                                            preciomaymax: d[0].preciomaymax,
                                                            estado: true,
                                                            idusuariocrea: d[0].idusuariocrea,
                                                            fechusuariocrea: d[0].fechusuariocrea,
                                                            cantidadant: d[0].cantidad,
                                                            cantidadcomp: s.detallecompras[index].cantidadperfecto,
                                                            preciounitario: s.detallecompras[index].preciounitario,
                                                            ganancia: parseFloat((d[0].preciomenmin - (118 * s.detallecompras[index].preciounitario) / 100).toFixed(2)),
                                                            cambio: false,
                                                            inventarios: d
                                                        };
                                                        s.inventarios.push(item);
                                                    } else {
                                                        var item = {
                                                            id: 0,
                                                            andamio: s.andamios[0],
                                                            producto: s.detallecompras[index].producto,
                                                            cantidad: s.detallecompras[index].cantidadperfecto,
                                                            preciomenmin: s.detallecompras[index].preciounitario * 1.18,
                                                            preciomenmax: s.detallecompras[index].preciounitario * 1.18,
                                                            preciomaymin: s.detallecompras[index].preciounitario * 1.18,
                                                            preciomaymax: s.detallecompras[index].preciounitario * 1.18,
                                                            estado: true,
                                                            cantidadant: 0,
                                                            cantidadcomp: s.detallecompras[index].cantidadperfecto,
                                                            preciounitario: s.detallecompras[index].preciounitario,
                                                            ganancia: 0.0,
                                                            cambio: false,
                                                            inventarios: []
                                                        };
                                                        s.inventarios.push(item);
                                                    }
                                                })
                                                .error(function (error, status) {
                                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                                });
                                    });
                                } else {
                                    s.detallecompras = [];
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.seleccion = function (data) {
                    s.$apply(function () {
                        s.compra = data;
                        s.buscarDetallecompra();
                    });
                };

                s.seleccion2 = function (data) {
                    s.compra = data;
                    s.buscarDetallecompra();
                };

                s.calcularPrecio = function (inv) {
                    inv.preciomenmin = parseFloat((parseFloat(inv.preciounitario) * ((118 + parseFloat(inv.ganancia)) / 100)).toFixed(2));
                };

                s.calcularPrecioInv = function (inv) {
                    inv.ganancia = parseFloat((100 * parseFloat(inv.preciomenmin) / parseFloat(inv.preciounitario) - 118).toFixed(2));
                };

                s.editarInventario = function (inv) {
                    var index = s.inventarios.indexOf(inv);
                    s.inventarios.forEach(function (val, i) {
                        if (i === index) {
                            val.cambio = !val.cambio;
                        } else {
                            val.cambio = false;
                        }
                    });
                };

                s.editarUbicacioninventario = function (inv, i) {
                    var cantidadant = i.cantidad;
                    inv.id = i.id;
                    inv.andamio = i.andamio;
                    inv.cantidad = i.cantidad + inv.cantidadcomp;
                    inv.preciomenmin = i.preciomenmin;
                    inv.preciomenmax = i.preciomenmax;
                    inv.preciomaymin = i.preciomaymin;
                    inv.preciomaymax = i.preciomaymax;
                    inv.estado = true;
                    inv.idusuariocrea = i.idusuariocrea;
                    inv.fechusuariocrea = i.fechusuariocrea;
                    inv.cantidadant = cantidadant;
                    inv.ganancia = parseFloat((i.preciomenmin - (118 * inv.preciounitario) / 100).toFixed(2));
                    inv.cambio = false;
                };

                s.validateinv = {
                    rules: {
                        codigo: {
                            required: true
                        },
                        nombreproveedor: {
                            required: true
                        },
                        fechacompra: {
                            required: true
                        },
                        montototal: {
                            required: true
                        }
                    },
                    messages: {
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        nombreproveedor: {
                            required: 'Campo obligatorio'
                        },
                        fechacompra: {
                            required: 'Campo obligatorio'
                        },
                        montototal: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrarinv = function (form) {
                    s.inventarios2 = [];
                    if (form.validate()) {
                        var message = '';
                        s.inventarios.forEach(function (v, i) {
                            if (s.inventarios[i].preciomenmin <= 0) {
                                message += '* No se ha especificado el precio de venta del producto ' + s.inventarios[i].producto.nombre + '\n';
                            }
                        });

                        if (message.length <= 0) {
                            s.inventarios.forEach(function (v, i) {
                                if (s.inventarios[i].id === 0) {
                                    s.inventarios2.push({
                                        id: s.inventarios[i].id,
                                        producto: s.inventarios[i].producto,
                                        andamio: s.inventarios[i].andamio,
                                        cantidad: s.inventarios[i].cantidad,
                                        preciomenmin: s.inventarios[i].preciomenmin,
                                        preciomenmax: s.inventarios[i].preciomenmax,
                                        preciomaymin: s.inventarios[i].preciomaymin,
                                        preciomaymax: s.inventarios[i].preciomaymax,
                                        estado: s.inventarios[i].estado,
                                        idusuariocrea: s.user.id,
                                        fechusuariocrea: new Date()
                                    });
                                } else {
                                    s.inventarios2.push({
                                        id: s.inventarios[i].id,
                                        producto: s.inventarios[i].producto,
                                        andamio: s.inventarios[i].andamio,
                                        cantidad: s.inventarios[i].cantidad,
                                        preciomenmin: s.inventarios[i].preciomenmin,
                                        preciomenmax: s.inventarios[i].preciomenmax,
                                        preciomaymin: s.inventarios[i].preciomaymin,
                                        preciomaymax: s.inventarios[i].preciomaymax,
                                        estado: s.inventarios[i].estado,
                                        idusuariocrea: s.inventarios[i].idusuariocrea,
                                        fechusuariocrea: s.inventarios[i].fechusuariocrea,
                                        idusuariomod: s.user.id,
                                        fechusuariomod: new Date()
                                    });
                                }
                            });
                            s.compra.idusuariomod = s.user.id;
                            s.compra.fechusuariomod = new Date();
                            s.compra.fechaalmacenamiento = new Date();
                            s.compra.idtestadocompra = s.estadocompras[1].id;

                            h.post(contextPath + '/almacen/compra/almacenamiento', {compra: s.compra, li: s.inventarios2})
                                    .success(function (data) {
                                        if (data === 1) {
                                            n.notificar('Notificacion', 'success', 'Se ingreso correctamente al inventario');

                                            s.compra = {montototal: 0.0};
                                            s.nombreproveedor = '';
                                            s.inventarios = [];
                                            s.inventarios2 = [];
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error, al ingresar compra a inventario');
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    });
                        } else {
                            n.notificar('Notificacion', 'info', message);
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
                    t(s.sesion, 60000);
                };

                t(s.sesion, 60000);
            }
        ]);
