angular.module('clienteModule', ['ngValidate', 'dirPagination', 'components'])
        .controller('clientenaturalController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];
                s.tipoclientes = [];
                s.paises = [];
                s.departamentos = [];
                s.provincias = [];
                s.distritos = [];
                s.departamentos2 = [];
                s.provincias2 = [];
                s.distritos2 = [];

                s.clientes = [];
                s.generos = [];
                s.estadociviles = [];

                s.cliente = {clientenatural: {}, estado: s.estados[0]};

                s.pais = {};
                s.departamento = {};
                s.provincia = {};
                s.distrito = {};
                s.pais2 = {};
                s.departamento2 = {};
                s.provincia2 = {};
                s.distrito2 = {};

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 13})
                        .success(function (data) {
                            s.tipoclientes = data;
                            s.cliente.idttipocliente = s.tipoclientes[1];
                            s.obtenerCodigocliente(s.cliente.idttipocliente);
                            s.listarClientes();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 1})
                        .success(function (data) {
                            s.generos = data;
                            s.cliente.clientenatural.idtgenero = s.generos[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 2})
                        .success(function (data) {
                            s.estadociviles = data;
                            s.cliente.clientenatural.idtestadocivil = s.estadociviles[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarpais')
                        .success(function (data) {
                            s.paises.push({id: 0, denominacion: 'SELECCIONE'});
                            s.pais = s.paises[0];
                            s.pais2 = s.paises[0];
                            $.each(data, function (i, value) {
                                s.paises.push(value);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarDepartamento = function () {
                    s.departamentos = [];
                    s.departamentos.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardepartamento', s.pais)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.departamentos.push(value);
                                });
                                s.departamento = s.departamentos[0];
                            });
                };

                s.listarProvincia = function () {
                    s.provincias = [];
                    s.provincias.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listarprovincia', s.departamento)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.provincias.push(value);
                                });
                                s.provincia = s.provincias[0];
                            });
                };

                s.listarDistrito = function () {
                    s.distritos = [];
                    s.distritos.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardistrito', s.provincia)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.distritos.push(value);
                                });
                                s.distrito = s.distritos[0];
                            });
                };

                s.listarDepartamento2 = function () {
                    s.departamentos2 = [];
                    s.departamentos2.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardepartamento', s.pais2)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.departamentos2.push(value);
                                });
                                s.departamento2 = s.departamentos2[0];
                            });
                };

                s.listarProvincia2 = function () {
                    s.provincias2 = [];
                    s.provincias2.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listarprovincia', s.departamento2)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.provincias2.push(value);
                                });
                                s.provincia2 = s.provincias2[0];
                            });
                };

                s.listarDistrito2 = function () {
                    s.distritos2 = [];
                    s.distritos2.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardistrito', s.provincia2)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.distritos2.push(value);
                                });
                                s.distrito2 = s.distritos2[0];
                            });
                };

                s.listarClientes = function () {
                    h.post(contextPath + '/common/listarcliente', s.tipoclientes[1])
                            .success(function (data) {
                                s.clientes = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigocliente = function (tc) {
                    h.post(contextPath + '/pos/cliente/obtcodigoclient', tc)
                            .success(function (data) {
                                s.cliente.codigo = 'CN-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatecn = {
                    rules: {
                        codigo: {
                            required: true
                        },
                        idttipocliente: {
                            required: true
                        },
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        nombre: {
                            required: true
                        },
                        apellidopat: {
                            required: true
                        },
                        apellidomat: {
                            required: true
                        },
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 9
                        },
                        genero: {
                            required: true
                        },
                        estadocivil: {
                            required: true
                        },
                        ruc: {
                            minlength: 11,
                            maxlength: 11
                        },
                        direccion: {
                            required: true
                        },
                        email: {
                            email: true
                        }
                    },
                    messages: {
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        idttipocliente: {
                            required: 'Campo obligatorio'
                        },
                        dni: {
                            required: 'Campo obligatorio',
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        apellidopat: {
                            required: 'Campo obligatorio'
                        },
                        apellidomat: {
                            required: 'Campo obligatorio'
                        },
                        celular: {
                            required: 'Campo obligatorio',
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        genero: {
                            required: 'Campo obligatorio'
                        },
                        estadocivil: {
                            required: 'Campo obligatorio'
                        },
                        ruc: {
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        direccion: {
                            required: 'Campo obligatorio'
                        },
                        email: {
                            email: 'Formato incorrecto para email, ejm: nombre@romaqui.com'
                        }
                    }
                };

                s.registrarcn = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.cliente));
                        s.cliente.estado = s.cliente.estado.id;
                        s.cliente.idttipocliente = s.cliente.idttipocliente.id;
                        s.cliente.clientenatural.idtestadocivil = s.cliente.clientenatural.idtestadocivil.id;
                        s.cliente.clientenatural.idtgenero = s.cliente.clientenatural.idtgenero.id;
                        s.cliente.idusuariocrea = s.user.id;
                        s.cliente.fechusuariocrea = new Date();
                        if (typeof s.distrito !== 'undefined') {
                            if (typeof s.distrito.id !== 'undefined') {
                                s.cliente.clientenatural.iddistrito = s.distrito.id;
                            }
                        }
                        console.log(s.cliente);

                        h.post(contextPath + '/pos/cliente/natural', s.cliente)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                        s.cliente = {estado: s.estados[0], idttipocliente: s.tipoclientes[1], clientenatural: {idtgenero: s.generos[0], idtestadocivil: s.estadociviles[0]}};
                                        s.obtenerCodigocliente(s.cliente.idttipocliente);

                                        s.pais = s.paises[0];
                                        s.departamento = s.departamentos[0];
                                        s.provincia = s.provincias[0];
                                        s.distrito = s.distritos[0];

                                        s.clientes.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al registrar');
                                        s.cliente = pre;
                                    }
                                })
                                .error(function (status, error, http) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + error);
                                    s.cliente = pre;
                                });
                    }
                };

                s.eliminarcn = function (c) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/pos/cliente/eliminarcn', c)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se elimino el cliente correctamente');

                                        s.index = s.clientes.indexOf(c);
                                        s.clientes.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar cliente');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostrarcn = function (c) {
                    s.index = s.clientes.indexOf(c);
                    s.clientea = {
                        id: c.id,
                        clientenatural: {
                            id: c.clientenatural.id,
                            idtgenero: {id: c.clientenatural.idtgenero},
                            idtestadocivil: {id: c.clientenatural.idtestadocivil},
                            dni: c.clientenatural.dni,
                            nombre: c.clientenatural.nombre,
                            apellidopat: c.clientenatural.apellidopat,
                            apellidomat: c.clientenatural.apellidomat,
                            celular: c.clientenatural.celular,
                            direccion: c.clientenatural.direccion,
                            email: c.clientenatural.email,
                            ruc: c.clientenatural.ruc,
                            fechanac: c.clientenatural.fechanac
                        },
                        clientejuridico: c.clientejuridico,
                        idttipocliente: {id: c.idttipocliente},
                        codigo: c.codigo,
                        observacion: c.observacion,
                        estado: {id: c.estado},
                        idusuariocrea: c.idusuariocrea,
                        fechusuariocrea: c.fechusuariocrea,
                        idusuariomod: c.idusuariomod,
                        fechusuariomod: c.fechusuariomod
                    };
                };

                s.actualizarcn = function (form) {
                    if (form.validate()) {
                        var pre = s.clientea;
                        s.clientea.estado = s.clientea.estado.id;
                        s.clientea.idttipocliente = s.clientea.idttipocliente.id;
                        s.clientea.clientenatural.idtestadocivil = s.clientea.clientenatural.idtestadocivil.id;
                        s.clientea.clientenatural.idtgenero = s.clientea.clientenatural.idtgenero.id;
                        s.clientea.idusuariomod = s.user.id;
                        s.clientea.fechusuariomod = new Date();

                        if (typeof s.distrito2 !== 'undefined') {
                            s.clientea.clientenatural.iddistrito = s.distrito2.id;
                        }

                        h.post(contextPath + '/pos/cliente/actualizarcn', s.clientea)
                                .success(function (data) {
                                    if (data !== null) {
                                        angular.element('#modalcn').modal('hide');
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente el cliente natural');

                                        s.clientea = {};

                                        s.clientes.splice(s.index, 1);
                                        s.clientes.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar cliente natural');
                                        s.clientea = pre;
                                    }
                                })
                                .error(function (status, error, http) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.clientea = pre;
                                });
                    }
                };


                //CONTADOR
                s.countUp = function () {
                    s.tiempo = new Date();

                    s.fecha = s.dias[s.tiempo.getDay()] + ' ' + s.tiempo.getDate() + ' ' + s.meses[s.tiempo.getMonth()] + ' ' + s.tiempo.getFullYear() + ' (' + s.tiempo.getHours() + ':' + s.tiempo.getMinutes() + ':' + s.tiempo.getSeconds() + ') Horas';
                    t(s.countUp, 1000);
                };

                t(s.countUp, 1000);

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
                    t(s.sesion, 5000);
                };

                t(s.sesion, 5000);
            }
        ])
        .controller('clientejuridicoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];
                s.tipoclientes = [];
                s.paises = [];
                s.departamentos = [];
                s.provincias = [];
                s.distritos = [];
                s.clientes = [];

                s.representantlegals = [];
                s.representantlegalsa = [];
                s.representantlegalse = [];

                s.cliente = {estado: s.estados[0], clientejuridico: {}};

                s.pais = {};
                s.departamento = {};
                s.provincia = {};
                s.distrito = {};

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 13})
                        .success(function (data) {
                            s.tipoclientes = data;
                            s.cliente.idttipocliente = s.tipoclientes[0];

                            s.obtenerCodigocliente(s.cliente.idttipocliente);
                            s.listarCliente();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarpais')
                        .success(function (data) {
                            s.paises.push({id: 0, denominacion: 'SELECCIONE'});
                            s.pais = s.paises[0];
                            data.forEach(function (value, i) {
                                s.paises.push(value);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarDepartamento = function () {
                    s.departamentos = [];
                    s.departamentos.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardepartamento', s.pais)
                            .success(function (data) {
                                data.forEach(function (val, i) {
                                    s.departamentos.push(val);
                                });
                                s.departamento = s.departamentos[0];
                            });
                };

                s.listarProvincia = function () {
                    s.provincias = [];
                    s.provincias.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listarprovincia', s.departamento)
                            .success(function (data) {
                                data.forEach(function (val, i) {
                                    s.provincias.push(val);
                                });
                                s.provincia = s.provincias[0];
                            });
                };

                s.listarDistrito = function () {
                    s.distritos = [];
                    s.distritos.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardistrito', s.provincia)
                            .success(function (data) {
                                data.forEach(function (val, i) {
                                    s.distritos.push(val);
                                });
                                s.distrito = s.distritos[0];
                            });
                };

                s.listarCliente = function () {
                    s.clientes = [];
                    h.post(contextPath + '/common/listarcliente', s.tipoclientes[0])
                            .success(function (data) {
                                s.clientes = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigocliente = function (tc) {
                    h.post(contextPath + '/pos/cliente/obtcodigoclient', tc)
                            .success(function (data) {
                                s.cliente.codigo = 'CJ-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validaterl = {
                    rules: {
                        dni: {
                            required: true,
                            minlength: 8,
                            maxlength: 8
                        },
                        nombre: {
                            required: true
                        },
                        apellidopat: {
                            required: true
                        },
                        apellidomat: {
                            required: true
                        },
                        cargo: {
                            required: true
                        },
                        celular: {
                            minlength: 6,
                            maxlength: 11
                        },
                        email: {
                            email: true
                        }
                    },
                    messages: {
                        dni: {
                            required: 'Campo obligatorio',
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        apellidopat: {
                            required: 'Campo obligatorio'
                        },
                        apellidomat: {
                            required: 'Campo obligatorio'
                        },
                        cargo: {
                            required: 'Campo obligatorio'
                        },
                        celular: {
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        email: {
                            email: 'Formato incorrecto para email, ejm: nombre@romaqui.com'
                        }
                    }
                };

                s.registrarrl = function (form) {
                    if (form.validate()) {
                        s.representantlegals.push({dni: s.representantlegal.dni, nombre: s.representantlegal.nombre, apellidopat: s.representantlegal.apellidopat, apellidomat: s.representantlegal.apellidomat, cargo: s.representantlegal.cargo, celular: s.representantlegal.celular, email: s.representantlegal.email});

                        s.representantlegal = {};
                    }
                };

                s.eliminarrl = function (rl) {
                    var index = s.representantlegals.indexOf(rl);
                    s.representantlegals.splice(index, 1);
                };

                s.validatecj = {
                    rules: {
                        codigo: {
                            required: true
                        },
                        estado: {
                            required: true
                        },
                        idttipocliente: {
                            required: true
                        },
                        ruc: {
                            required: true,
                            minlength: 11,
                            maxlength: 11
                        },
                        razonsocial: {
                            required: true
                        },
                        telefono: {
                            minlength: 6,
                            maxlength: 11
                        },
                        email: {
                            email: true
                        }
                    },
                    messages: {
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        },
                        idttipocliente: {
                            required: 'Campo obligatorio'
                        },
                        ruc: {
                            required: 'Campo obligatorio',
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        razonsocial: {
                            required: 'Campo obligatorio'
                        },
                        telefono: {
                            minlength: 'Minimo de {0} digitos son permitidos',
                            maxlength: 'Maximo de {0} digitos son permitidos'
                        },
                        email: {
                            email: 'Formato incorrecto para email, ejm: nombre@romaqui.com'
                        }
                    }
                };

                s.registrarcj = function (form) {
                    if (form.validate()) {
                        if (s.representantlegals.length > 0) {
                            var pre = JSON.parse(JSON.stringify(s.cliente));
                            s.cliente.estado = s.cliente.estado.id;
                            s.cliente.idusuariocrea = s.user.id;
                            s.cliente.fechusuariocrea = new Date();
                            s.cliente.idttipocliente = s.cliente.idttipocliente.id;
                            s.representantlegals.forEach(function (val, i) {
                                s.representantlegals[i].idusuariocrea = s.user.id;
                                s.representantlegals[i].fechusuariocrea = new Date();
                            });
                            console.log(s.cliente);
                            console.log(s.representantlegals);

                            h.post(contextPath + '/pos/cliente/juridico', {cliente: s.cliente, lrl: s.representantlegals})
                                    .success(function (data) {
                                        if (data !== null) {
                                            n.notificar('Notificacion', 'success', 'Se registro correctamente el cliente juridico');

                                            s.cliente = {estado: s.estados[0], idttipocliente: s.tipoclientes[0], clientejuridico: {}};
                                            s.pais = s.paises[0];
                                            s.obtenerCodigocliente(s.cliente.idttipocliente);

                                            s.representantlegals = [];
                                            s.clientes.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error al registrar cliente juridico');
                                            s.cliente = pre;
                                        }
                                    })
                                    .error(function (status, error, http) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.cliente = pre;
                                    });
                        } else {
                            n.notificar('Notificacion', 'warning', 'Error, registre al menos un representante legal');
                        }
                    }
                };

                s.mostrarcj = function (c) {
                    s.index = s.clientes.indexOf(c);
                    s.clientea = {
                        id: c.id,
                        clientenatural: c.clientenatural,
                        clientejuridico: {id: c.clientejuridico.id, iddistrito: c.clientejuridico.iddistrito, ruc: c.clientejuridico.ruc, razonsocial: c.clientejuridico.razonsocial, nombrecomercial: c.clientejuridico.nombrecomercial, jironegocio: c.clientejuridico.jironegocio, telefono: c.clientejuridico.telefono, direccion: c.clientejuridico.direccion, email: c.clientejuridico.email, fechafundacion: c.clientejuridico.fechafundacion},
                        idttipocliente: {id: c.idttipocliente},
                        codigo: c.codigo,
                        observacion: c.observacion,
                        estado: {id: c.estado},
                        idusuariocrea: c.idusuariocrea,
                        fechausuariocrea: c.fechausuariocrea,
                        idusuariomod: c.idusuariomod,
                        fechusuariomod: c.fechusuariomod
                    };
                    angular.element('#modalcj').modal('show');
                };

                s.actualizarcj = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.clientea));
                        s.clientea.estado = s.clientea.estado.id;
                        s.clientea.idusuariocrea = s.user.id;
                        s.clientea.fechusuariocrea = new Date();
                        s.clientea.idttipocliente = s.clientea.idttipocliente.id;
                        s.clientea.clientejuridico.iddistrito = s.distrito.id;

                        h.post(contextPath + '/pos/cliente/actualizarcj', {cliente: s.clientea})
                                .success(function (data) {
                                    if (data !== null) {
                                        angular.element('#modalcj').modal('hide');
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente el cliente juridico');
                                        s.clientea = {};

                                        s.clientes.splice(s.index, 1);
                                        s.clientes.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al registrar cliente juridico');
                                        s.clientea = pre;
                                    }
                                })
                                .error(function (status, error, http) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.clientea = pre;
                                });
                    }
                };

                //PARA ELIMINAR
                s.eliminarcj = function (c) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/pos/cliente/eliminarcj', c)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se elimino el cliente correctamente');

                                        s.index = s.clientes.indexOf(c);
                                        s.clientes.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al aliminar cliente');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };


                //CONTADOR
                s.countUp = function () {
                    s.tiempo = new Date();

                    s.fecha = s.dias[s.tiempo.getDay()] + ' ' + s.tiempo.getDate() + ' ' + s.meses[s.tiempo.getMonth()] + ' ' + s.tiempo.getFullYear() + ' (' + s.tiempo.getHours() + ':' + s.tiempo.getMinutes() + ':' + s.tiempo.getSeconds() + ') Horas';
                    t(s.countUp, 1000);
                };

                t(s.countUp, 1000);

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
                    t(s.sesion, 5000);
                };

                t(s.sesion, 5000);
            }
        ]);