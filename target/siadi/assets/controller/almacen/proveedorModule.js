angular.module('proveedorModule', ['ngValidate', 'dirPagination', 'components'])
        .controller('proveedornaturalController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];
                s.tipoproveedores = [];
                s.paises = [];
                s.departamentos = [];
                s.provincias = [];
                s.distritos = [];
                s.departamentos2 = [];
                s.provincias2 = [];
                s.distritos2 = [];
                s.proveedores = [];
                s.generos = [];
                s.estadociviles = [];

                s.proveedor = {};
                s.proveedor.proveedornatural = {};

                s.pais = {};
                s.departamento = {};
                s.provincia = {};
                s.distrito = {};
                s.pais2 = {};
                s.departamento2 = {};
                s.provincia2 = {};
                s.distrito2 = {};

                s.proveedor.estado = s.estados[0];

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 3})
                        .success(function (data) {
                            s.tipoproveedores = data;
                            s.proveedor.idttipoproveedor = s.tipoproveedores[1];
                            s.obtenerCodigoproveedor(s.proveedor.idttipoproveedor);
                            s.listarProveedores();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 1})
                        .success(function (data) {
                            s.generos = data;
                            s.proveedor.proveedornatural.idtgenero = s.generos[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 2})
                        .success(function (data) {
                            s.estadociviles = data;
                            s.proveedor.proveedornatural.idtestadocivil = s.estadociviles[0];
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

                s.listarProveedores = function () {
                    h.post(contextPath + '/common/listarproveedor', s.tipoproveedores[1])
                            .success(function (data) {
                                s.proveedores = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigoproveedor = function (tp) {
                    h.post(contextPath + '/almacen/proveedor/obtcodigoprov', tp)
                            .success(function (data) {
                                s.proveedor.codigo = 'PN-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatepn = {
                    rules: {
                        codigo: {
                            required: true
                        },
                        estado: {
                            required: true
                        },
                        tipoproveedor: {
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
                        apellidopaterno: {
                            required: true
                        },
                        apellidomaterno: {
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
                            required: true
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
                        estado: {
                            required: 'Campo obligatorio'
                        },
                        tipoproveedor: {
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
                        apellidopaterno: {
                            required: 'Campo obligatorio'
                        },
                        apellidomaterno: {
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
                            required: 'Campo obligatorio',
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

                s.registrarpn = function (form) {
                    if (form.validate()) {
                        var pre = s.proveedor;
                        s.proveedor.estado = s.proveedor.estado.id;
                        s.proveedor.idttipoproveedor = s.proveedor.idttipoproveedor.id;
                        s.proveedor.proveedornatural.idtestadocivil = s.proveedor.proveedornatural.idtestadocivil.id;
                        s.proveedor.proveedornatural.idtgenero = s.proveedor.proveedornatural.idtgenero.id;
                        s.proveedor.idusuariocrea = s.user.id;
                        s.proveedor.fechusuariocrea = new Date();
                        if (typeof s.distrito !== 'undefined') {
                            s.proveedor.proveedornatural.iddistrito = s.distrito.id;
                        }

                        h.post(contextPath + '/almacen/proveedor/proveedornatural', s.proveedor)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente el proveedor natural');

                                        s.proveedor = {estado: s.estados[0], idttipoproveedor: s.tipoproveedores[1], proveedornatural: {idtgenero: s.generos[0], idtestadocivil: s.estadociviles[0]}};
                                        s.obtenerCodigoproveedor(s.proveedor.idttipoproveedor);

                                        s.pais = s.paises[0];
                                        s.departamento = s.departamentos[0];
                                        s.provincia = s.provincias[0];
                                        s.distrito = s.distritos[0];

                                        s.proveedores.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al registrar proveedor natural');
                                        s.proveedor = pre;
                                    }
                                })
                                .error(function (status, error, http) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.proveedor = pre;
                                });
                    }
                };

                s.eliminarpn = function (p) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/almacen/proveedor/eliminarpn', p)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se elimino el proveedor correctamente');

                                        s.index = s.proveedores.indexOf(p);
                                        s.proveedores.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar proveedor');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostrarpn = function (p) {
                    s.index = s.proveedores.indexOf(p);
                    s.proveedora = {
                        id: p.id,
                        proveedornatural: {
                            id: p.proveedornatural.id,
                            idtgenero: {id: p.proveedornatural.idtgenero},
                            idtestadocivil: {id: p.proveedornatural.idtestadocivil},
                            dni: p.proveedornatural.dni,
                            nombre: p.proveedornatural.nombre,
                            apellidopat: p.proveedornatural.apellidopat,
                            apellidomat: p.proveedornatural.apellidomat,
                            celular: p.proveedornatural.celular,
                            direccion: p.proveedornatural.direccion,
                            email: p.proveedornatural.email,
                            ruc: p.proveedornatural.ruc,
                            fechanac: p.proveedornatural.fechanac
                        },
                        proveedorjuridico: p.proveedorjuridico,
                        idttipoproveedor: {id: p.idttipoproveedor},
                        codigo: p.codigo,
                        observacion: p.observacion,
                        estado: {id: p.estado},
                        idusuariocrea: p.idusuariocrea,
                        fechusuariocrea: p.fechusuariocrea,
                        idusuariomod: p.idusuariomod,
                        fechusuariomod: p.fechusuariomod
                    };
                };

                s.actualizarpn = function (form) {
                    if (form.validate()) {
                        var pre = s.proveedora;
                        s.proveedora.estado = s.proveedora.estado.id;
                        s.proveedora.idttipoproveedor = s.proveedora.idttipoproveedor.id;
                        s.proveedora.proveedornatural.idtestadocivil = s.proveedora.proveedornatural.idtestadocivil.id;
                        s.proveedora.proveedornatural.idtgenero = s.proveedora.proveedornatural.idtgenero.id;
                        s.proveedora.idusuariomod = s.user.id;
                        s.proveedora.fechusuariomod = new Date();

                        if (typeof s.distrito2 !== 'undefined') {
                            s.proveedora.proveedornatural.iddistrito = s.distrito2.id;
                        }

                        h.post(contextPath + '/almacen/proveedor/actualizarpn', s.proveedora)
                                .success(function (data) {
                                    if (data !== null) {
                                        angular.element('#modalpn').modal('hide');
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente el proveedor natural');

                                        s.proveedora = {};

                                        s.proveedores.splice(s.index, 1);
                                        s.proveedores.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar proveedor natural');
                                        s.proveedora = pre;
                                    }
                                })
                                .error(function (status, error, http) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.proveedora = pre;
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
                    t(s.sesion, 60000);
                };

                t(s.sesion, 60000);
            }
        ])
        .controller('proveedorjuridicoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];
                s.tipoproveedores = [];
                s.paises = [];
                s.departamentos = [];
                s.provincias = [];
                s.distritos = [];
                s.proveedores = [];
                s.representantelegals = [];
                s.representantelegalsa = [];
                s.representantelegalse = [];

                s.proveedor = {estado: s.estados[0], proveedorjuridico: {}};

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

                h.post(contextPath + '/common/listartipo', {idtabla: 3})
                        .success(function (data) {
                            s.tipoproveedores = data;
                            s.proveedor.idttipoproveedor = s.tipoproveedores[0];

                            s.obtenerCodigoproveedor(s.proveedor.idttipoproveedor);
                            s.listarProveedor();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarpais')
                        .success(function (data) {
                            s.paises.push({id: 0, denominacion: 'SELECCIONE'});
                            s.pais = s.paises[0];
                            $.each(data, function (index, value) {
                                s.paises.push(value);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarProveedor = function () {
                    s.proveedores = [];
                    h.post(contextPath + '/common/listarproveedor', s.tipoproveedores[0])
                            .success(function (data) {
                                s.proveedores = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

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

                s.obtenerCodigoproveedor = function (tp) {
                    h.post(contextPath + '/almacen/proveedor/obtcodigoprov', tp)
                            .success(function (data) {
                                s.proveedor.codigo = 'PJ-00' + data;
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
                        telefono: {
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
                        telefono: {
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
                        s.representantelegals.push({dni: s.representantelegal.dni, nombre: s.representantelegal.nombre, apellidopat: s.representantelegal.apellidopat, apellidomat: s.representantelegal.apellidomat, cargo: s.representantelegal.cargo, celular: s.representantelegal.celular, email: s.representantelegal.email});
                        s.representantelegal = {};
                    }
                };

                s.eliminarrl = function (rl) {
                    var index = s.representantelegals.indexOf(rl);
                    s.representantelegals.splice(index, 1);
                };

                s.validatepj = {
                    rules: {
                        codigo: {
                            required: true
                        },
                        estado: {
                            required: true
                        },
                        tipoproveedor: {
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
                        nombrecomercial: {
                            required: true
                        },
                        jironegocio: {
                            required: true
                        },
                        telefono: {
                            required: true,
                            minlength: 6,
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
                        estado: {
                            required: 'Campo obligatorio'
                        },
                        tipoproveedor: {
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
                        nombrecomercial: {
                            required: 'Campo obligatorio'
                        },
                        jironegocio: {
                            required: 'Campo obligatorio'
                        },
                        telefono: {
                            required: 'Campo obligatorio',
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

                s.registrarpj = function (form) {
                    if (form.validate()) {
                        if (s.representantelegals.length > 0) {
                            var pre = JSON.parse(JSON.stringify(s.proveedor));
                            s.proveedor.estado = s.proveedor.estado.id;
                            s.proveedor.idusuariocrea = s.user.id;
                            s.proveedor.fechusuariocrea = new Date();
                            s.proveedor.idttipoproveedor = s.proveedor.idttipoproveedor.id;

                            $.each(s.representantelegals, function (i, val) {
                                s.representantelegals[i].idusuariocrea = s.user.id;
                                s.representantelegals[i].fechusuariocrea = new Date();
                            });

                            h.post(contextPath + '/almacen/proveedor/proveedorjuridico', {proveedor: s.proveedor, rl: s.representantelegals})
                                    .success(function (data) {
                                        if (data !== null) {
                                            n.notificar('Notificacion', 'success', 'Se registro correctamente el proveedor juridico');

                                            s.proveedor = {estado: s.estados[0], idttipoproveedor: s.tipoproveedores[0], proveedorjuridico: {}};
                                            s.pais = s.paises[0];
                                            s.obtenerCodigoproveedor(s.proveedor.idttipoproveedor);

                                            s.representantelegals = [];
                                            s.proveedores.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error al registrar proveedor juridico');
                                            s.proveedor = pre;
                                        }
                                    })
                                    .error(function (status, error, http) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.proveedor = pre;
                                    });
                        } else {
                            n.notificar('Notificacion', 'warning', 'Error, registre al menos un representante legal');
                        }
                    }
                };

                s.mostrarpj = function (p) {
                    s.representantelegalse = [];
                    s.index = s.proveedores.indexOf(p);
                    s.proveedora = {
                        id: p.id,
                        personanatural: p.personanatural,
                        proveedorjuridico: {id: p.proveedorjuridico.id, iddistrito: p.proveedorjuridico.iddistrito, ruc: p.proveedorjuridico.ruc, razonsocial: p.proveedorjuridico.razonsocial, nombrecomercial: p.proveedorjuridico.nombrecomercial, jironegocio: p.proveedorjuridico.jironegocio, telefono: p.proveedorjuridico.telefono, direccion: p.proveedorjuridico.direccion, email: p.proveedorjuridico.email, fechafundacion: p.proveedorjuridico.fechafundacion},
                        idttipoproveedor: {id: p.idttipoproveedor},
                        codigo: p.codigo,
                        observacion: p.observacion,
                        estado: {id: p.estado},
                        idusuariocrea: p.idusuariocrea,
                        fechausuariocrea: p.fechausuariocrea,
                        idusuariomod: p.idusuariomod,
                        fechusuariomod: p.fechusuariomod
                    };

                    s.representantelegalsa = [];
                    h.post(contextPath + '/common/listarrepresentantelegal', p.proveedorjuridico)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.representantelegalsa.push(value);
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });

                    angular.element('#modalpj').modal('show');
                };

                s.registrarrla = function (form) {
                    if (form.validate()) {
                        s.representantelegalsa.push({id: 0, dni: s.representantelegala.dni, nombre: s.representantelegala.nombre, apellidopat: s.representantelegala.apellidopat, apellidomat: s.representantelegala.apellidomat, cargo: s.representantelegala.cargo, celular: s.representantelegala.celular, email: s.representantelegala.email});

                        s.representantelegala = {};
                    }
                };

                s.eliminarrla = function (rl) {
                    if (rl.id !== 0) {
                        s.representantelegalse.push(rl);
                    }
                    var index = s.representantelegalsa.indexOf(rl);
                    s.representantelegalsa.splice(index, 1);
                };

                s.actualizarpj = function (form) {
                    if (form.validate()) {
                        if (s.representantelegalsa.length > 0) {
                            var pre = JSON.parse(JSON.stringify(s.proveedora));
                            s.proveedora.estado = s.proveedora.estado.id;
                            s.proveedora.idusuariocrea = s.user.id;
                            s.proveedora.fechusuariocrea = new Date();
                            s.proveedora.idttipoproveedor = s.proveedora.idttipoproveedor.id;
                            s.proveedora.proveedorjuridico.iddistrito = s.distrito.id;

                            $.each(s.representantelegalsa, function (i, val) {
                                if (s.representantelegalsa[i].id === 0) {
                                    s.representantelegalsa[i].idusuariocrea = s.user.id;
                                    s.representantelegalsa[i].fechusuariocrea = new Date();
                                } else {
                                    s.representantelegalsa[i].idusuariomod = s.user.id;
                                    s.representantelegalsa[i].fechusuariomod = new Date();
                                }
                            });

                            h.post(contextPath + '/almacen/proveedor/actualizarpj', {proveedor: s.proveedora, rl: s.representantelegalsa, rle: s.representantelegalse})
                                    .success(function (data) {
                                        if (data !== null) {
                                            angular.element('#modalpj').modal('hide');
                                            n.notificar('Notificacion', 'success', 'Se actualizo correctamente el proveedor');
                                            s.proveedora = {};

                                            s.proveedores.splice(s.index, 1);
                                            s.proveedores.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error al registrar proveedor');
                                            s.proveedora = pre;
                                        }
                                    })
                                    .error(function (status, error, http) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.proveedora = pre;
                                    });
                        } else {
                            n.notificar('Notificacion', 'warning', 'Error, registre al menos un representante legal');
                        }
                    }
                };

                //PARA ELIMINAR
                s.eliminarpj = function (p) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/almacen/proveedor/eliminarpj', p)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se elimino el proveedor correctamente');

                                        s.index = s.proveedores.indexOf(p);
                                        s.proveedores.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al aliminar proveedor');
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
                    t(s.sesion, 60000);
                };

                t(s.sesion, 60000);
            }
        ]);