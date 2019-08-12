angular.module('administracionModule', ['ngValidate', 'dirPagination', 'components'])
        .controller('comprobanteController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];
                var cad = '000000000000000';

                s.tipocomprobantes = [];
                s.comprobantes = [];
                s.comprobante = {id: 0, estado: s.estados[0]};

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
                            s.comprobante.agencia = s.agencia;
                            s.listarComprobantes(s.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 4})
                        .success(function (data) {
                            s.tipocomprobantes = data;
                            s.comprobante.idttipocomprobante = s.tipocomprobantes[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarComprobantes = function (a) {
                    h.post(contextPath + '/common/listarcomprobante', a)
                            .success(function (data) {
                                s.comprobantes = data;

                                s.comprobantes.forEach(function (val, i) {
                                    s.comprobantes[i].numeroc = s.convertirDigitos(s.comprobantes[i].numero, s.comprobantes[i].longnumero);
                                    s.comprobantes[i].seriec = s.convertirDigitos(s.comprobantes[i].serie, s.comprobantes[i].longserie);
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatec = {
                    rules: {
                        nombre: {
                            required: true
                        },
                        abreviatura: {
                            required: true
                        },
                        numero: {
                            required: true,
                            min: 1
                        },
                        serie: {
                            required: true,
                            min: 1
                        },
                        longnumero: {
                            required: true,
                            min: 3
                        },
                        longserie: {
                            required: true,
                            min: 6
                        },
                        estado: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        abreviatura: {
                            required: 'Campo obligatorio'
                        },
                        numero: {
                            required: 'Campo obligatorio',
                            min: 'valor minimo aceptable {0}'
                        },
                        serie: {
                            required: 'Campo obligatorio',
                            min: 'valor minimo aceptable {0}'
                        },
                        longnumero: {
                            required: 'Campo obligatorio',
                            min: 'valor minimo aceptable {0}'
                        },
                        longserie: {
                            required: 'Campo obligatorio',
                            min: 'valor minimo aceptable {0}'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrarc = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.comprobante));
                        s.comprobante.estado = s.comprobante.estado.id;
                        s.comprobante.idttipocomprobante = s.comprobante.idttipocomprobante.id;
                        s.comprobante.idusuariocrea = s.user.id;
                        s.comprobante.fechusuariocrea = new Date();

                        console.log(s.comprobante);

                        h.post(contextPath + '/pos/administracion/registrarc', s.comprobante)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.comprobante = {id: 0, idttipocomprobante: pre.idttipocomprobante, estado: s.estados[0], agencia: s.agencia};

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                        data.numeroc = s.convertirDigitos(data.numero, data.longnumero);
                                        data.seriec = s.convertirDigitos(data.serie, data.longserie);

                                        s.comprobantes.push(data);
                                    } else {
                                        s.comprobante = pre;
                                        n.notificar('Notificacion', 'error', 'Error al registrar');
                                    }
                                })
                                .error(function (error, status) {
                                    s.comprobante = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });

                    }
                };

                s.mostrarc = function (c) {
                    s.index = s.comprobantes.indexOf(c);
                    s.comprobante = {
                        id: c.id,
                        agencia: c.agencia,
                        idttipocomprobante: {id: c.idttipocomprobante},
                        nombre: c.nombre,
                        abreviatura: c.abreviatura,
                        numero: c.numero,
                        serie: c.serie,
                        longnumero: c.longnumero,
                        longserie: c.longserie,
                        estado: {id: c.estado},
                        idusuariocrea: c.idusuariocrea,
                        fechusuariocrea: c.fechusuariocrea,
                        idusuariomod: c.idusuariomod,
                        fechusuariomod: c.fechusuariomod
                    };
                };

                s.actualizarc = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.comprobante));
                        s.comprobante.estado = s.comprobante.estado.id;
                        s.comprobante.idttipocomprobante = s.comprobante.idttipocomprobante.id;
                        s.comprobante.idusuariomod = s.user.id;
                        s.comprobante.fechusuariomod = new Date();

                        delete s.comprobante.numeroc;
                        delete s.comprobante.seriec;

                        h.post(contextPath + '/pos/administracion/actualizarc', s.comprobante)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.comprobante = {id: 0, idttipocomprobante: s.tipocomprobantes[0], estado: s.estados[0], agencia: s.agencia};
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente');

                                        data.numeroc = s.convertirDigitos(data.numero, data.longnumero);
                                        data.seriec = s.convertirDigitos(data.serie, data.longserie);

                                        s.comprobantes.splice(s.index, 1);
                                        s.comprobantes.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar');
                                        s.comprobante = pre;
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.comprobante = pre;
                                });
                    }
                };

                s.eliminarc = function (c) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/pos/administracion/eliminarc', {id: c.id})
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente el item');

                                        s.index = s.comprobantes.indexOf(c);
                                        s.comprobantes.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.cancelarc = function () {
                    s.comprobante = {id: 0, estado: s.estados[0], idttipocomprobante: s.tipocomprobantes[0], agencia: s.agencia};
                };

                s.convertirDigitos = function (valor, longvalor) {
                    if (valor.toString().length > longvalor) {
                        return valor.toString();
                    } else {
                        return cad.substr(0, longvalor).substr(0, longvalor - valor.toString().length) + valor.toString();
                    }
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
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
        .controller('paramsventaController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];

                s.cajas = [];
                s.caja = {id: 0, estado: s.estados[0]};

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
                            s.caja.agencia = s.agencia;
                            s.listarCajas(s.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarCajas = function (a) {
                    h.post(contextPath + '/common/listarcaja', a)
                            .success(function (data) {
                                s.cajas = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatec = {
                    rules: {
                        nombre: {
                            required: true
                        },
                        ip: {
                            required: true
                        },
                        nroserie: {
                            required: true
                        },
                        nroautorizacion: {
                            required: true
                        },
                        estado: {
                            required: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        ip: {
                            required: 'Campo obligatorio'
                        },
                        nroserie: {
                            required: 'Campo obligatorio'
                        },
                        nroautorizacion: {
                            required: 'Campo obligatorio'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrarc = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.caja));
                        s.caja.estado = s.caja.estado.id;
                        s.caja.idusuariocrea = s.user.id;
                        s.caja.fechusuariocrea = new Date();

                        console.log(s.caja);

                        h.post(contextPath + '/pos/administracion/registrarca', s.caja)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.caja = {id: 0, estado: s.estados[0], agencia: s.agencia};

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                        s.cajas.push(data);
                                    } else {
                                        s.caja = pre;
                                        n.notificar('Notificacion', 'error', 'Error al registrar');
                                    }
                                })
                                .error(function (error, status) {
                                    s.caja = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });

                    }
                };

                s.mostrarc = function (c) {
                    s.index = s.cajas.indexOf(c);
                    s.caja = {
                        id: c.id,
                        agencia: c.agencia,
                        nombre: c.nombre,
                        ip: c.ip,
                        nroserie: c.nroserie,
                        nroautorizacion: c.nroautorizacion,
                        estado: {id: c.estado},
                        idusuariocrea: c.idusuariocrea,
                        fechusuariocrea: c.fechusuariocrea,
                        idusuariomod: c.idusuariomod,
                        fechusuariomod: c.fechusuariomod
                    };
                };

                s.actualizarc = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.caja));
                        s.caja.estado = s.caja.estado.id;
                        s.caja.idusuariomod = s.user.id;
                        s.caja.fechusuariomod = new Date();

                        h.post(contextPath + '/pos/administracion/actualizarca', s.caja)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.caja = {id: 0, estado: s.estados[0], agencia: s.agencia};
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente');

                                        s.cajas.splice(s.index, 1);
                                        s.cajas.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar');
                                        s.caja = pre;
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.caja = pre;
                                });
                    }
                };

                s.eliminarc = function (c) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/pos/administracion/eliminarca', {id: c.id})
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente el item');

                                        s.index = s.cajas.indexOf(c);
                                        s.cajas.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.cancelarc = function () {
                    s.caja = {id: 0, estado: s.estados[0], agencia: s.agencia};
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
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
        .controller('bobedaController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];

                s.bobeda = {};
                s.transferenciac = {cajero: {estado: true, saldoapertura: 0.0, fechaapertura: new Date()}, diezc: 0, veintec: 0, cincuentac: 0, uns: 0, doss: 0, cincos: 0, diezs: 0, veintes: 0, cincuentas: 0, ciens: 0, doscientoss: 0};

                s.cajeros = [];
                s.cajas = [];
                s.usuarios = [];
                s.transferencias = [];
                s.tipotransferencias = [];

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

                            s.obtenerBobeda(s.agencia);
                            s.listarCajas(s.agencia);
                            s.listarCajeros(s.agencia);
                            s.listarUsuarios(s.agencia);
                            s.listarTransferencias(s.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 8})
                        .success(function (data) {
                            s.tipotransferencias = data;
                            s.transferenciac.idttipotransferencia = s.tipotransferencias[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarCajas = function (a) {
                    h.post(contextPath + '/common/listarcaja', a)
                            .success(function (data) {
                                s.cajas = data;
                                s.transferenciac.cajero.caja = s.cajas[0];
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.listarCajeros = function (a) {
                    var f = new Date();
                    f.setDate(f.getDate() - 60);
                    h.post(contextPath + '/common/listarcajero', {id: a.id, datelimit: f})
                            .success(function (data) {
                                s.cajeros = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.listarTransferencias = function (a) {
                    var f = new Date();
                    f.setDate(f.getDate() - 60);
                    h.post(contextPath + '/common/listartransferencia', {id: a.id, datelimit: f})
                            .success(function (data) {
                                data.forEach(function (val, i) {
                                    val.idttipotransferencia = s.tipotransferencias.filter(function (v) {
                                        return v.id === val.idttipotransferencia;
                                    })[0];
                                    s.transferencias.push(val);
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.listarUsuarios = function (a) {
                    s.usuarios = [];
                    h.post(contextPath + '/common/listarusuariocaja', a)
                            .success(function (data) {
                                data.forEach(function (val, i) {
                                    val.nombres = val.colaborador.nombre + ' ' + val.colaborador.apellidopat + ' (' + val.usuario + ')';
                                    s.usuarios.push(val);
                                });
                                s.transferenciac.cajero.idusuario = s.usuarios[0];
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerBobeda = function (a) {
                    h.post(contextPath + '/pos/administracion/obtenerbob', a)
                            .success(function (data) {
                                s.bobeda = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.calcularTotal = function () {
                    s.transferenciac.cajero.saldoapertura = parseFloat((s.transferenciac.diezc * 0.10 + s.transferenciac.veintec * 0.20 + s.transferenciac.cincuentac * 0.50 + s.transferenciac.uns * 1.0 + s.transferenciac.doss * 2.0 + s.transferenciac.cincos * 5.0 + s.transferenciac.diezs * 10.0 + s.transferenciac.veintes * 20.0 + s.transferenciac.cincuentas * 50.0 + s.transferenciac.ciens * 100.0 + s.transferenciac.doscientoss * 200.0).toFixed(2));
                    s.transferenciac.montototal = s.transferenciac.cajero.saldoapertura;
                    s.transferenciac.cajero.saldocierre = s.transferenciac.cajero.saldoapertura;
                };

                s.agregarTodo = function () {
                    s.transferenciac.diezc = s.bobeda.diezcz;
                    s.transferenciac.veintec = s.bobeda.veintecz;
                    s.transferenciac.cincuentac = s.bobeda.cincuentacz;
                    s.transferenciac.uns = s.bobeda.unsz;
                    s.transferenciac.doss = s.bobeda.dossz;
                    s.transferenciac.cincos = s.bobeda.cincosz;
                    s.transferenciac.diezs = s.bobeda.diezsz;
                    s.transferenciac.veintes = s.bobeda.veintesz;
                    s.transferenciac.cincuentas = s.bobeda.cincuentasz;
                    s.transferenciac.ciens = s.bobeda.ciensz;
                    s.transferenciac.doscientoss = s.bobeda.doscientossz;
                    s.calcularTotal();
                };

                s.validatec = {
                    rules: {
                        caja: {
                            required: true,
                            min: 0
                        },
                        idusuario: {
                            required: true,
                            min: 0
                        },
                        diezc: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        veintec: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        cincuentac: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        uns: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        doss: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        cincos: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        diezs: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        veintes: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        cincuentas: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        ciens: {
                            required: true,
                            step: 1,
                            min: 0
                        },
                        doscientoss: {
                            required: true,
                            step: 1,
                            min: 0
                        }
                    },
                    messages: {
                        caja: {
                            required: 'Campo obligatorio',
                            min: 'Selecciones una caja'
                        },
                        idusuario: {
                            required: 'Campo obligatorio',
                            min: 'Selecciones un usuario'
                        },
                        diezc: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        veintec: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        cincuentac: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        uns: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        doss: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        cincos: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        diezs: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        veintes: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        cincuentas: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        ciens: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        },
                        doscientoss: {
                            required: 'Campo obligatorio',
                            step: 'Solo enteros',
                            min: 'No negativos'
                        }
                    }
                };

                s.registrarc = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.transferenciac));
                        s.transferenciac.cajero.nombres = s.transferenciac.cajero.idusuario.nombres;
                        s.transferenciac.cajero.idusuario = s.transferenciac.cajero.idusuario.id;
                        s.transferenciac.idttipotransferencia = s.transferenciac.idttipotransferencia.id;
                        s.transferenciac.cajero.idusuariocrea = s.user.id;
                        s.transferenciac.cajero.pendiente = true;
                        s.transferenciac.cajero.fechusuariocrea = new Date();
                        s.transferenciac.idusuariocrea = s.user.id;
                        s.transferenciac.fechusuariocrea = new Date();
                        s.transferenciac.fecha = new Date();
                        s.transferenciac.glosa = 'TRANSFERENCIA DE APERTURA DE CAJA';
                        s.transferenciac.bobeda = s.bobeda;

                        console.log(s.transferenciac);
                        h.post(contextPath + '/pos/administracion/registrarcaj', s.transferenciac)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.listarUsuarios(s.agencia);

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                        s.cajeros.push(data.cajero);
                                        s.obtenerBobeda(s.agencia);

                                        s.transferenciac = {idttipotransferencia: s.tipotransferencias[0], cajero: {idusuario: s.usuarios[0], caja: s.cajas[0], estado: true, saldoapertura: 0.0, fechaapertura: new Date()}, diezc: 0, veintec: 0, cincuentac: 0, uns: 0, doss: 0, cincos: 0, diezs: 0, veintes: 0, cincuentas: 0, ciens: 0, doscientoss: 0};

                                        if (data.id > 0) {
                                            s.transferencias.push(data);
                                        }
                                    } else {
                                        s.transferenciac = pre;
                                        n.notificar('Notificacion', 'error', 'Error al registrar');
                                    }
                                })
                                .error(function (error, status) {
                                    s.transferenciac = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });

                    }
                };

                s.eliminarc = function (c) {
                    if (confirm('¿Esta seguro que desea ingresar el monto recibido?')) {
                        h.post(contextPath + '/pos/administracion/ingresosaldo', c)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente el item');

                                        s.index = s.cajeros.indexOf(c);
                                        s.cajeros.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.confirmarc = function (c) {
                    s.index = s.cajeros.indexOf(c);
                    var transferencia = {
                        cajero: c,
                        bobeda: s.bobeda,
                        idttipotransferencia: s.tipotransferencias[1].id,
                        glosa: 'TRANSFERENCIA DE CIERRE CAJA:' + c.caja.nombre,
                        montototal: c.saldocierre,
                        fecha: new Date(),
                        diezc: c.diezc,
                        veintec: c.veintec,
                        cincuentac: c.cincuentac,
                        uns: c.uns,
                        doss: c.doss,
                        cincos: c.cincos,
                        diezs: c.diezs,
                        veintes: c.veintes,
                        cincuentas: c.cincuentas,
                        ciens: c.ciens,
                        doscientoss: c.doscientoss,
                        idusuariocrea: s.user.id,
                        fechusuariocrea: new Date()
                    };

                    h.post(contextPath + '/pos/administracion/confcierrecajero', transferencia)
                            .success(function (data) {
                                if (data !== null) {
                                    s.listarUsuarios(s.agencia);

                                    n.notificar('Notificacion', 'success', 'Se ingreso el monto a bobeda');

                                    s.cajeros.splice(s.index, 1);
                                    s.cajeros.push(data.cajero);
                                    s.obtenerBobeda(s.agencia);

                                    if (data.id > 0) {
                                        s.transferencias.push(data);
                                    }
                                } else {
                                    n.notificar('Notificacion', 'error', 'Error al registrar');
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
                };

                s.sortt = function (keyname) {
                    s.sortKeyt = keyname;
                    s.reverset = !s.reverset;
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