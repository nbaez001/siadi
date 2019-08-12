angular.module("ventaModule", ['ngValidate', 'dirPagination', 'components'])
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
        .controller("registroController", ["$scope", "$http", function (s, h) {
                s.notificar = function (titulo, tipo, mensaje) {
                    new PNotify({
                        title: titulo,
                        type: tipo,
                        text: mensaje,
                        nonblock: {
                            nonblock: true
                        },
                        before_close: function (PNotify) {
                            PNotify.update({
                                title: PNotify.options.title + " - Enjoy your Stay",
                                before_close: null
                            });
                            PNotify.queueRemove();
                            return false;
                        }
                    });
                };

                s.venta = {};
                s.venta.idcliente = 1;
                s.detalleventa = {};
                s.detalleventa.producto = {};

                s.estadoventas = [];
                s.ventas = [];

                //PARAMETROS DE BUSQUERDA DE PRODUCTOS
                s.categorias = [];
                s.marcas = [];
                s.unidadmedidas = [];
                s.inventarios = [];
                s.productob = {};

                s.detalleventas = [];
                s.detalleinventario = [];
                s.tipocomprobantes = [];

                h.post(contextPath + '/common/listartipocomprobante')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.tipocomprobantes.push(JSON.parse(value));
                            });
                            s.venta.tipocomprobante = s.tipocomprobantes[0];
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/venta/obtenercodigoventa')
                        .success(function (data) {
                            s.venta.codigo = 'CV-00' + data;
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarestadoventa')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.estadoventas.push(JSON.parse(value));
                            });
                            s.venta.estadoventa = s.estadoventas[0];
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarcategoria')
                        .success(function (data) {
                            s.categorias.push({id: 0, codigo: 'TOD', denominacion: 'TODOS'});

                            $.each(data, function (index, value) {
                                s.categorias.push(JSON.parse(value));
                            });
                            s.productob.categoria = s.categorias[0];
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarmarca')
                        .success(function (data) {
                            s.marcas.push({id: 0, codigo: 'TOD', denominacion: 'TODOS'});

                            $.each(data, function (index, value) {
                                s.marcas.push(JSON.parse(value));
                            });
                            s.productob.marca = s.marcas[0];
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarunidadmedida')
                        .success(function (data) {
                            s.unidadmedidas.push({id: 0, codigo: 'TOD', denominacion: 'TODOS'});

                            $.each(data, function (index, value) {
                                s.unidadmedidas.push(JSON.parse(value));
                            });
                            s.productob.unidadmedida = s.unidadmedidas[0];
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarventa')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.ventas.push(JSON.parse(value));
                            });
                        })
                        .error(function (error, status) {
                            s.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.obtenerCodigoventa = function () {
                    h.post(contextPath + '/venta/obtenercodigoventa')
                            .success(function (data) {
                                s.venta.codigo = 'CV-00' + data;
                            })
                            .error(function (error, status) {
                                s.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarInventarios = function () {
                    s.inventarios = [];
                    h.post(contextPath + '/producto/buscarinventario', s.productob)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.inventarios.push(JSON.parse(value));
                                });
                            })
                            .error(function (error, status) {
                                s.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                //FUNCIONES DE DETALLE VENTA
                s.validatedtv = {
                    rules: {
                        cantidad: {
                            required: true,
                            min: 1
                        }
                    },
                    messages: {
                        cantidad: {
                            required: "Campo obligatorio",
                            min: "La cantidad minima aceptada es {0}"
                        }
                    }
                };

                s.selecionarDetalleventa = function (i) {
                    s.inventario = i;
                    s.detalleventa.producto = i.producto;
                    s.detalleventa.preciounitario = i.precio;

                    //SETEO DE VALIDACCION
                    var settings = $('form[name=formulariodtv]').validate().settings;
                    settings.rules.cantidad = {required: true, min: 1, max: s.inventario.cantidadact};
                    settings.messages.cantidad = {required: "Campo obligatorio", min: "La cantidad minima de compra es {0} items", max: "Solo se tiene {0} items en inventario"};
                };

                s.agregarDetalleventa = function (form) {
                    if (form.validate()) {
                        if (Object.keys(s.detalleventa.producto).length > 0) {
                            var enc = 0;
                            $.each(s.detalleventas, function (i, val) {
                                if (s.detalleventas[i].producto.id === s.detalleventa.producto.id) {
                                    enc += 1;
                                }
                            });

                            if (enc > 0) {
                                s.notificar('Notificacion', 'warning', 'Ya se agregó este producto en lista de compras');
                            } else {
                                s.detalleventas.push({id: s.inventario.id, producto: s.detalleventa.producto, cantidad: s.detalleventa.cantidad, cantidadperfecto: s.detalleventa.cantidad, cantidaddaniado: 0, preciounitario: s.detalleventa.preciounitario, subtotal: s.detalleventa.subtotal});

                                s.inventario.cantidadact = s.inventario.cantidadact - s.detalleventa.cantidad;

                                s.detalleventa = {};
                                s.detalleventa.producto = {};
                                s.detalleventa.cantidad = 0;
                                s.detalleventa.preciounitario = 0;
                            }
                        } else {
                            s.notificar('Notificacion', 'warning', 'Error, no se seleccionó NINGUN PRODUCTO');
                        }
                    }
                };

                s.quitarDetalleventa = function (dv) {
                    s.index = s.detalleventas.indexOf(dv);
                    s.detalleventas.splice(s.index, 1);
                };

                s.calcularSubtotal = function () {
                    s.detalleventa.subtotal = parseFloat((s.detalleventa.cantidad * s.detalleventa.preciounitario).toFixed(2));
                };

                s.$watch(function () {
                    var tt = 0;
                    $.each(s.detalleventas, function (i, val) {
                        tt += s.detalleventas[i].subtotal;
                    });

                    s.venta.montototal = tt;
                });

                //METODOS DE REGISTRO VENTA CLIENTE

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
                        estadoventa: {
                            required: true
                        },
                        tipocomprobante: {
                            required: true
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
                            required: "Campo obligatorio"
                        },
                        idcliente: {
                            required: "Campo obligatorio"
                        },
                        nombrecliente: {
                            required: "Campo obligatorio"
                        },
                        estadoventa: {
                            required: "Campo obligatorio"
                        },
                        tipocomprobante: {
                            required: "Campo obligatorio"
                        },
                        montototal: {
                            required: "Campo obligatorio"
                        },
                        nrocomprobante: {
                            number: "Ingrese solo numeros"
                        },
                        seriecomprobante: {
                            number: "Ingrese solo numeros"
                        }
                    }
                };

                s.registrarv = function (form) {
                    if (form.validate()) {
                        if (s.detalleventas.length > 0) {
                            var data = s.venta.tipocomprobante;
                            delete s.venta.tipocomprobante;

                            s.venta.idtipocomprobante = data.id;
                            s.venta.idusuariocrea = 1;
                            s.venta.fechusuariocrea = new Date();

                            $.each(s.detalleventas, function (i, val) {
                                s.detalleventas[i].venta = s.venta;
                            });

                            h.post(contextPath + '/venta/registro', s.detalleventas)
                                    .success(function (data) {
                                        if (data !== null) {
                                            if (data.id === -1) {
                                                s.notificar('Notificacion', 'error', 'Error, no hay suficientes items del producto ' + data.nombrecliente + " disponibles en STOCK");
                                            } else {
                                                s.notificar('Notificacion', 'success', 'Se registro correctamente la venta');
                                                s.ventas.push(data);

                                                s.venta = {};
                                                s.venta.estadoventa = s.estadoventas[0];
                                                s.venta.tipocomprobante = data;
                                                s.venta.idcliente = 1;
                                                s.obtenerCodigoventa();

                                                s.detalleventas = [];
                                                s.inventarios = [];
                                            }
                                        } else {
                                            s.notificar('Notificacion', 'error', 'Error: no se pudo registrar la venta');
                                        }
                                    })
                                    .error(function (error, status) {
                                        s.notificar('Notificacion', 'error', 'Error: ' + status);
                                    });
                        } else {
                            s.notificar('Notificacion', 'warning', 'Error, registre al menos un detalle de venta');
                        }
                    }
                };

                s.eliminarv = function (v) {
                    h.post(contextPath + '/venta/eliminarventa', v)
                            .success(function (data) {
                                if (data === 1) {
                                    s.notificar('Notificacion', 'success', 'Se elimino correctamente el registro de venta');
                                    s.index = s.ventas.indexOf(v);

                                    s.ventas.splice(s.index, 1);
                                } else {
                                    s.notificar('Notificacion', 'error', 'Error, no se pudo eliminar el registro de venta');
                                }
                            })
                            .error(function (error, status) {
                                s.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
            }
        ]);

        