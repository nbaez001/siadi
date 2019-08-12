angular.module("colaboradorModule", ['ngValidate', 'dirPagination', 'components'])
        .controller("registroController", ["$scope", "$http", "$timeout", 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.paises = [];
                s.agencias = [];
                s.colaboradores = [];
                s.colaborador = {};

                var f = new Date();
                f.setDate(f.getDate() - 365);

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
                            s.colaborador.agencia = data;
                            s.listarColaborador(s.colaborador.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarpais')
                        .success(function (data) {
                            s.paises.push({id: 0, denominacion: 'SELECCIONE'});
                            s.pais = s.paises[0];
                            s.pais2 = s.paises[0];
                            $.each(data, function (index, value) {
                                s.paises.push(value);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarColaborador = function (ag) {
                    h.post(contextPath + '/common/listarcolaborador', ag)
                            .success(function (data) {
                                s.colaboradores = data;
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

                s.validateu = {
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
                            required: true},
                        apellidomat: {required: true
                        },
                        celular: {
                            required: true,
                            minlength: 9,
                            maxlength: 11
                        },
                        email: {
                            email: true
                        },
                        ruc: {
                            minlength: 11,
                            maxlength: 11
                        },
                        direccion: {
                            required: true
                        },
                        agencia: {
                            required: true
                        },
                        cargo: {
                            required: true
                        }
                    },
                    messages: {
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Ingrese {0} caracteres",
                            maxlength: "Ingrese {0} caracteres"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidopat: {
                            required: "Campo obligatorio"
                        },
                        apellidomat: {
                            required: "Campo obligatorio"
                        },
                        celular: {
                            required: "Campo obligatorio",
                            minlength: "Ingrese un minimo de {0} caracteres",
                            maxlength: "Ingrese un maximo de {0} caracteres"},
                        email: {
                            email: "Ingrese un email valido"
                        },
                        ruc: {
                            minlength: "Ingrese {0} caracteres",
                            maxlength: "Ingrese {0} caracteres"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        },
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        cargo: {required: "Campo obligatorio"
                        }
                    }
                };

                s.registraru = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.colaborador));
                        if (typeof s.distrito !== 'undefined') {
                            s.colaborador.iddistrito = s.distrito.id;
                        }
                        h.post(contextPath + '/personal/colaborador/registro', s.colaborador)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.colaborador = {agencia: s.agencia};
                                        s.pais = s.paises[0];
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');
                                        s.colaboradores.push(data);
                                    } else {
                                        s.colaborador = pre;
                                        n.notificar('Notificacion', 'error', 'Error al registrar usuario');
                                    }
                                })
                                .error(function (error, status) {
                                    s.colaborador = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostraru = function (u) {
                    s.index = s.colaboradores.indexOf(u);
                    s.colaboradora = {
                        id: u.id,
                        agencia: {
                            id: u.agencia.id,
                            iddistrito: u.agencia.iddistrito,
                            razonsocial: u.agencia.razonsocial,
                            ruc: u.agencia.ruc,
                            telefono: u.agencia.telefono,
                            urllogo: u.agencia.urllogo,
                            direccion: u.agencia.direccion
                        },
                        iddistrito: u.iddistrito,
                        idtestadocivil: u.idtestadocivil,
                        idtgenero: u.idtgenero,
                        dni: u.dni,
                        nombre: u.nombre,
                        apellidopat: u.apellidopat,
                        apellidomat: u.apellidomat,
                        celular: u.celular,
                        cargo: u.cargo,
                        direccion: u.direccion,
                        email: u.email,
                        ruc: u.ruc,
                        fechanac: u.fechanac
                    };
                    s.pais2 = s.paises[0];
                    angular.element('#modalUsuario').modal('show');
                };

                s.actualizaru = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.colaboradora));
                        if (typeof s.distrito2 !== 'undefined') {
                            s.colaboradora.iddistrito = s.distrito2.id;
                        }
                        h.post(contextPath + '/personal/colaborador/actualizar', s.colaboradora)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se modifico los datos correctamente');
                                        angular.element('#modalUsuario').modal('hide');

                                        s.colaboradora = {};
                                        s.colaboradores.splice(s.index, 1);
                                        s.colaboradores.push(data);
                                    } else {
                                        s.colaboradora = pre;
                                        n.notificar('Notificacion', 'error', 'Error al modificar los datos');
                                    }
                                })
                                .error(function (error, status) {
                                    s.colaboradora = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminaru = function (u) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/personal/colaborador/eliminar', u)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');
                                        s.index = s.colaboradores.indexOf(u);
                                        s.colaboradores.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
                };

                //AUTENTICACION
                s.sesion = function () {
                    h.post(contextPath + '/session')
                            .success(function (data) {
                                if (data === null) {
                                    window.location.href = contextPath + "/login";
                                } else {
                                    s.user = data;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                    t(s.sesion, 6000);
                };

                t(s.sesion, 6000);
            }
        ])
        .controller("usuarioController", ["$scope", '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.disDni = true;
                s.disNombre = true;
                s.disApellidopat = true;
                s.disApellidomat = true;

                s.agencia = {};

                s.usuario = {colaborador: {}};
                s.usuarioa = {colaborador: {}};

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
                            s.usuario.colaborador.agencia = data;
                            s.listarUsuarios(s.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarmodulo')
                        .success(function (data) {
                            s.modulos = data;
                            s.modulosa = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarUsuarios = function (a) {
                    h.post(contextPath + '/common/listarusuario', a)
                            .success(function (data) {
                                s.usuarios = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarColDni = function (request, response) {
                    s.usuario.colaborador.id = 1;
                    s.usuario.colaborador.tipobusqueda = 1;
                    h.post(contextPath + '/personal/colaborador/buscarcol', s.usuario.colaborador)
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].dni;
                                }
                                return response(data);
                            });
                };
                s.buscarColNombre = function (request, response) {
                    s.usuario.colaborador.id = 2;
                    s.usuario.colaborador.tipobusqueda = 1;
                    h.post(contextPath + '/personal/colaborador/buscarcol', s.usuario.colaborador)
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].nombre + ' ' + data[i].apellidopat + ' ' + data[i].apellidomat;
                                }
                                return response(data);
                            });
                };
                s.seleccion = function (data) {
                    s.$apply(function () {
                        s.usuario.colaborador = data;
                        delete s.usuario.colaborador.label;
                        delete s.usuario.colaborador.value;
                    });
                };

                s.validateu = {
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
                            required: true},
                        apellidomat: {required: true
                        },
                        usuario: {
                            required: true,
                            remote: contextPath + '/existeusuario'
                        },
                        contrasena: {
                            required: true
                        },
                        contrasena2: {
                            required: true,
                            equalTo: "#contrasena"
                        }
                    },
                    messages: {
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Ingrese {0} caracteres",
                            maxlength: "Ingrese {0} caracteres"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidopat: {
                            required: "Campo obligatorio"
                        },
                        apellidomat: {
                            required: "Campo obligatorio"
                        },
                        usuario: {
                            required: "Campo obligatorio",
                            remote: 'Ya existe un usuario con ese nombre'
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        },
                        contrasena2: {
                            required: "Campo obligatorio",
                            equalTo: "Las contraseñas no coinciden"
                        }
                    }
                };

                s.registraru = function (form) {
                    if (form.validate()) {
                        s.usuario.idusuariocrea = s.user.id;
                        s.usuario.fechusuariocrea = new Date();
                        h.post(contextPath + '/personal/colaborador/registrou', {usuario: s.usuario, lm: s.modulos})
                                .success(function (data) {
                                    if (data !== null) {
                                        s.usuario = {colaborador: {}};
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');
                                        s.usuarios.push(data);

                                        s.contrasena2 = '';
                                        for (var i = 0; i < s.modulos.length; i++) {
                                            for (var j = 0; j < s.modulos[i].roles.length; j++) {
                                                for (var k = 0; k < s.modulos[i].roles[j].funciones.length; k++) {
                                                    s.modulos[i].roles[j].funciones[k].estado = false;
                                                }
                                            }
                                        }
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al registrar usuario');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostraru = function (u) {
                    s.usuarioa = {
                        id: u.id,
                        colaborador: {
                            id: u.colaborador.id,
                            iddistrito: u.colaborador.iddistrito,
                            idtestadocivil: u.colaborador.idtestadocivil,
                            idtgenero: u.colaborador.idtgenero,
                            dni: u.colaborador.dni,
                            nombre: u.colaborador.nombre,
                            apellidopat: u.colaborador.apellidopat,
                            apellidomat: u.colaborador.apellidomat,
                            celular: u.colaborador.celular,
                            cargo: u.colaborador.cargo,
                            direccion: u.colaborador.direccion,
                            email: u.colaborador.email,
                            ruc: u.colaborador.ruc,
                            fechanac: u.colaborador.fechanac
                        },
                        usuario: u.usuario,
                        contrasena: '',
                        estado: u.estado,
                        idusuariocrea: u.idusuariocrea,
                        fechusuariocrea: u.fechusuariocrea,
                        idusuariomod: u.idusuariomod,
                        fechusuariomod: u.fechusuariomod
                    };
                    s.useract = s.usuarioa.usuario;
                    angular.element('#modalUsuario').modal('show');
                };

                s.validateua = {
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
                            required: true},
                        apellidomat: {required: true
                        },
                        usuario: {
                            required: true,
                            'remote': {url: contextPath + '/existeusuarioa', type: "get",
                                data: {
                                    usuario: function () {
                                        return s.usuarioa.usuario;
                                    },
                                    actual: function () {
                                        return s.useract;
                                    }
                                }
                            }
                        },
                        contrasena: {
                            required: true
                        },
                        contrasena2: {
                            required: true,
                            equalTo: "#contrasenaa"
                        }
                    },
                    messages: {
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Ingrese {0} caracteres",
                            maxlength: "Ingrese {0} caracteres"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidopat: {
                            required: "Campo obligatorio"
                        },
                        apellidomat: {
                            required: "Campo obligatorio"
                        },
                        usuario: {
                            required: "Campo obligatorio",
                            remote: 'Ya existe un usuario con ese nombre'
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        },
                        contrasena2: {
                            required: "Campo obligatorio",
                            equalTo: "Las contraseñas no coinciden"
                        }
                    }
                };

                s.actualizaru = function (form) {
                    if (form.validate()) {
                        s.usuarioa.idusuariomod = s.user.id;
                        s.usuarioa.fechusuariomod = new Date();
                        h.post(contextPath + '/personal/colaborador/actualizaru', {usuario: s.usuarioa, lm: s.modulosa})
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se modifico los datos correctamente');
                                        angular.element('#modalUsuario').modal('hide');

                                        s.usuarioa = {};
                                        s.usuarios.splice(s.index, 1);
                                        s.usuarios.push(data);
                                        s.contrasena3 = '';
                                        for (var i = 0; i < s.modulosa.length; i++) {
                                            for (var j = 0; j < s.modulosa[i].roles.length; j++) {
                                                for (var k = 0; k < s.modulosa[i].roles[j].funciones.length; k++) {
                                                    s.modulosa[i].roles[j].funciones[k].estado = false;
                                                }
                                            }
                                        }
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al modificar los datos');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminaru = function (u) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/personal/colaborador/eliminaru', u)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');
                                        s.index = s.usuarios.indexOf(u);
                                        s.usuarios.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
                };

                //AUTENTICACION
                s.sesion = function () {
                    h.post(contextPath + '/session')
                            .success(function (data) {
                                if (data === null) {
                                    window.location.href = contextPath + "/login";
                                } else {
                                    s.user = data;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                    t(s.sesion, 6000);
                };

                t(s.sesion, 6000);
            }
        ])
        .controller("contratoController", ["$scope", '$http', '$timeout', 'notify', 'dateParser', function (s, h, t, n, dp) {
                s.user = {};

                s.disDni = true;
                s.disNombre = true;
                s.disApellidopat = true;
                s.disApellidomat = true;

                s.agencia = {};

                s.contrato = {colaborador: {}};
                s.contratoa = {colaborador: {}};
                s.turno = {};
                s.turnoa = {};

                s.contratos = [];
                s.dependencias = [];
                s.listaturno = [];
                s.listaturnoa = [];

                s.tipocargos = [];
                s.tipoempleados = [];
                s.tipoturnos = [];
                s.tipodias = [];

                s.regturno = true;

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
                            s.contrato.colaborador.agencia = data;
                            s.listarContratos(s.agencia);
                            s.listarDependencias(s.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/common/listartipo', {idtabla: 14})
                        .success(function (data) {
                            s.tipocargos = data;
                            s.contrato.idttipocargo = s.tipocargos[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/common/listartipo', {idtabla: 15})
                        .success(function (data) {
                            s.tipoempleados = data;
                            s.contrato.idttipoempleado = s.tipoempleados[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                h.post(contextPath + '/common/listartipo', {idtabla: 16})
                        .success(function (data) {
                            s.tipoturnos = data;
                            s.tipodias=[{id:1,nombre:'DOMINGO'},{id:2,nombre:'LUNES'},{id:3,nombre:'MARTES'},{id:4,nombre:'MIERCOLES'},{id:5,nombre:'JUEVES'},{id:6,nombre:'VIERNES'},{id:7,nombre:'SABADO'}];
                            
                            s.turno.idttipoturno = s.tipoturnos[0];
                            s.turnoa.idttipoturno = s.tipoturnos[0];
                            s.turno.dia = s.tipodias[1];
                            s.turnoa.dia = s.tipodias[1];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });
                s.listarContratos = function (a) {
                    h.post(contextPath + '/common/listarcontrato', a)
                            .success(function (data) {
                                s.contratos = data;
                                s.contratos.forEach(function (val, i) {
                                    val.idttipocargo = s.tipocargos.filter(function (nick) {
                                        return nick.id === val.idttipocargo;
                                    })[0];
                                    val.idttipoempleado = s.tipoempleados.filter(function (nick) {
                                        return nick.id === val.idttipoempleado;
                                    })[0];
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.listarDependencias = function (a) {
                    h.post(contextPath + '/common/listardependencia', a)
                            .success(function (data) {
                                s.dependencias = data;
                                s.contrato.dependencia = s.dependencias[0];
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.buscarColDni = function (request, response) {
                    s.contrato.colaborador.id = 1;
                    s.contrato.colaborador.tipobusqueda = 2;
                    h.post(contextPath + '/personal/colaborador/buscarcol', s.contrato.colaborador)
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].dni;
                                }
                                return response(data);
                            });
                };
                s.buscarColNombre = function (request, response) {
                    s.contrato.colaborador.id = 2;
                    s.contrato.colaborador.tipobusqueda = 2;
                    h.post(contextPath + '/personal/colaborador/buscarcol', s.contrato.colaborador)
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].nombre + ' ' + data[i].apellidopat + ' ' + data[i].apellidomat;
                                }
                                return response(data);
                            });
                };
                s.seleccion = function (data) {
                    s.$apply(function () {
                        s.contrato.colaborador = data;
                        delete s.contrato.colaborador.label;
                        delete s.contrato.colaborador.value;
                    });
                };
                s.validatec = {
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
                            required: true},
                        apellidomat: {required: true
                        },
                        dependencia: {
                            required: true,
                            min: 1
                        },
                        idttipocargo: {
                            required: true,
                            min: 1
                        },
                        idttipoempleado: {
                            required: true,
                            min: 1
                        },
                        fechainicio: {
                            required: true
                        },
                        fechafin: {
                            required: true
                        },
                        sueldo: {
                            required: true
                        }
                    },
                    messages: {
                        dni: {
                            required: "Campo obligatorio",
                            minlength: "Ingrese {0} caracteres",
                            maxlength: "Ingrese {0} caracteres"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        apellidopat: {
                            required: "Campo obligatorio"
                        },
                        apellidomat: {
                            required: "Campo obligatorio"
                        },
                        dependencia: {
                            required: "Campo obligatorio",
                            min: 'Seleccione una opcion'
                        },
                        idttipocargo: {
                            required: "Campo obligatorio",
                            min: 'Seleccione una opcion'
                        },
                        idttipoempleado: {
                            required: "Campo obligatorio",
                            min: 'Seleccione una opcion'
                        },
                        fechainicio: {
                            required: "Campo obligatorio"
                        },
                        fechafin: {
                            required: "Campo obligatorio"
                        },
                        sueldo: {
                            required: "Campo obligatorio"
                        }
                    }
                };
                s.validatet = {
                    rules: {
                        idttipoturno: {
                            required: true,
                            min: 8
                        },
                        horaentrada: {
                            required: true
                        },
                        horasalida: {
                            required: true
                        }
                    },
                    messages: {
                        idttipoturno: {
                            required: "Campo obligatorio",
                            min: "Seleccione una opcion"
                        },
                        horaentrada: {
                            required: "Campo obligatorio"
                        },
                        horasalida: {
                            required: "Campo obligatorio"
                        }
                    }
                };
                s.agregart = function (form) {
                    if (form.validate()) {
                        if (s.listaturno.length < 14) {
                            s.listaturno.push(JSON.parse(JSON.stringify(s.turno)));
                            s.turno = {idttipoturno: s.tipoturnos[0],dia:s.tipodias[1]};
                        } else {
                            n.notificar('Notificacion', 'info', 'SOLO SE PERMITE HASTA 2 TURNOS POR DIA');
                        }
                    }
                };
                s.quitart = function (t) {
                    s.index = s.listaturno.indexOf(t);
                    s.listaturno.splice(s.index, 1);
                };
                s.registrarc = function (form) {
                    if (form.validate()) {
                        if (typeof s.contrato.colaborador.id !== 'undefined') {
                            var pre = JSON.parse(JSON.stringify(s.contrato));
                            var prelist = JSON.parse(JSON.stringify(s.listaturno));
                            s.contrato.idusuariocrea = s.user.id;
                            s.contrato.fechusuariocrea = new Date();
                            s.contrato.estado = true;
                            s.contrato.idttipocargo = s.contrato.idttipocargo.id;
                            s.contrato.idttipoempleado = s.contrato.idttipoempleado.id;

                            s.listaturno.forEach(function (val, i) {
                                val.idttipoturno = val.idttipoturno.id;
                                val.dia = val.dia.id;
                            });

                            console.log(s.contrato);

                            h.post(contextPath + '/personal/colaborador/registroc', {contrato: s.contrato, listaturno: s.listaturno})
                                    .success(function (data) {
                                        if (data !== null) {
                                            if (data.id !== -1) {
                                                s.contrato = {colaborador: {agencia: s.agencia}, dependencia: s.dependencias[0], idttipocargo: s.tipocargos[0], idttipoempleado: s.tipoempleados[0]};
                                                s.listaturno = [];
                                                n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                                data.idttipocargo = s.tipocargos.filter(function (nick) {
                                                    return nick.id === data.idttipocargo;
                                                })[0];
                                                data.idttipoempleado = s.tipoempleados.filter(function (nick) {
                                                    return nick.id === data.idttipoempleado;
                                                })[0];

                                                s.contratos.push(data);
                                            } else {
                                                n.notificar('Notificacion', 'error', 'AGREGUE TURNO');
                                                s.contrato = pre;
                                                s.listaturno = prelist;
                                            }
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error al registrar');
                                            s.contrato = pre;
                                            s.listaturno = prelist;
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.contrato = pre;
                                        s.listaturno = prelist;
                                    });
                        } else {
                            s.mensaje = 'Seleccione un colaborador para registrar un contrato';
                            s.showmensaje = true;
                            t(function () {
                                s.showmensaje = false;
                            }, 6000);
                        }
                    }
                };
                s.mostrarc = function (u) {
                    s.contratoa = {
                        id: u.id,
                        codigo: u.codigo,
                        colaborador: {
                            id: u.colaborador.id,
                            iddistrito: u.colaborador.iddistrito,
                            idtestadocivil: u.colaborador.idtestadocivil,
                            idtgenero: u.colaborador.idtgenero,
                            dni: u.colaborador.dni,
                            nombre: u.colaborador.nombre,
                            apellidopat: u.colaborador.apellidopat,
                            apellidomat: u.colaborador.apellidomat,
                            celular: u.colaborador.celular,
                            cargo: u.colaborador.cargo,
                            direccion: u.colaborador.direccion,
                            email: u.colaborador.email,
                            ruc: u.colaborador.ruc,
                            fechanac: u.colaborador.fechanac
                        },
                        dependencia: u.dependencia,
                        idttipocargo: u.idttipocargo,
                        idttipoempleado: u.idttipoempleado,
                        fechainicio: u.fechainicio,
                        fechafin: u.fechafin,
                        sueldo: u.sueldo,
                        estado: u.estado,
                        esjefearea: u.esjefearea,
                        idusuariocrea: u.idusuariocrea,
                        fechusuariocrea: u.fechusuariocrea,
                        idusuariomod: u.idusuariomod,
                        fechusuariomod: u.fechusuariomod
                    };
                    h.post(contextPath + '/personal/colaborador/listart', {id: s.contratoa.id})
                            .success(function (data) {
                                s.listaturnoa = data;
                                s.listaturnoa.forEach(function (val, i) {
                                    val.idttipoturno = s.tipoturnos.filter(function (nick) {
                                        return nick.id === val.idttipoturno;
                                    })[0];
                                    val.dia = s.tipodias.filter(function (nick) {
                                        return nick.id === val.dia;
                                    })[0];
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });

                    angular.element('#modalContrato').modal('show');
                };
                s.actualizarc = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.contratoa));
                        s.contratoa.idusuariomod = s.user.id;
                        s.contratoa.fechusuariomod = new Date();
                        s.contratoa.estado = true;
                        s.contratoa.idttipocargo = s.contratoa.idttipocargo.id;
                        s.contratoa.idttipoempleado = s.contratoa.idttipoempleado.id;

                        h.post(contextPath + '/personal/colaborador/actualizarc', s.contratoa)
                                .success(function (data) {
                                    if (data !== null) {
                                        console.log(data);
                                        n.notificar('Notificacion', 'success', 'Se modifico los datos correctamente');
                                        angular.element('#modalContrato').modal('hide');

                                        s.contratoa = {};
                                        s.contratos.splice(s.index, 1);

                                        data.idttipocargo = s.tipocargos.filter(function (nick) {
                                            return nick.id === data.idttipocargo;
                                        })[0];
                                        data.idttipoempleado = s.tipoempleados.filter(function (nick) {
                                            return nick.id === data.idttipoempleado;
                                        })[0];
                                        s.contratos.push(data);

                                        s.listaturnoa = [];
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al modificar los datos');
                                        s.contratoa = pre;
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.contratoa = pre;
                                });
                    }
                };
                s.eliminarc = function (u) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/personal/colaborador/eliminarc', {id: u.id})
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');
                                        s.index = s.contratos.indexOf(u);
                                        s.contratos.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };
                s.mostrart = function (u) {
                    s.turnoa = {
                        id: u.id,
                        contrato: {id: u.contrato.id},
                        idttipoturno: u.idttipoturno,
                        horaentrada: s.parseDate(u.horaentrada),
                        horasalida: s.parseDate(u.horasalida),
                        dia: u.dia
                    };
                    s.regturno = false;
                    s.index2 = s.listaturnoa.indexOf(u);
                };
                s.parseDate = function (date) {
                    var time = date.match(/(\d+)(?::(\d\d))?\s*(p?)/);
                    var d = new Date();
                    d.setHours(parseInt(time[1]) + (time[3] ? 12 : 0));
                    d.setMinutes(parseInt(time[2]) || 0);
                    d.setSeconds(0, 0);
                    return d;
                };
                s.registrart = function (form) {
                    if (form.validate()) {
                        if (s.listaturnoa.length < 14) {
                            var pre = JSON.parse(JSON.stringify(s.turnoa));
                            s.turnoa.contrato = {id: s.contratoa.id};
                            s.turnoa.idttipoturno = s.turnoa.idttipoturno.id;
                            s.turnoa.dia = s.turnoa.dia.id;

                            h.post(contextPath + '/personal/colaborador/registrart', s.turnoa)
                                    .success(function (data) {
                                        if (data !== null) {
                                            n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                            s.turnoa = {idttipoturno: s.tipoturnos[0], dia: s.tipodias[0]};
                                            data.idttipoturno = s.tipoturnos.filter(function (nick) {
                                                return nick.id === data.idttipoturno;
                                            })[0];
                                            data.dia = s.tipodias.filter(function (nick) {
                                                return nick.id === data.dia;
                                            })[0];
                                            s.listaturnoa.push(data);
                                            s.regturno = true;
                                        } else {
                                            n.notificar('Notificacion', 'error', 'No pudo ser registrado');
                                            s.turnoa = pre;
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.turnoa = pre;
                                    });
                        } 
                        else {
                            n.notificar('Notificacion', 'info', 'SOLO SE PERMITE HASTA 2 TURNOS POR DIA');
                        }
                    }
                };
                s.actualizart = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.turnoa));
                        s.turnoa.idttipoturno = s.turnoa.idttipoturno.id;
                        s.turnoa.dia = s.turnoa.dia.id;
                        h.post(contextPath + '/personal/colaborador/actualizart', s.turnoa)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se modifico los datos correctamente');

                                        s.turnoa = {idttipoturno: s.tipoturnos[0],dia:s.tipodias[0]};
                                        data.idttipoturno = s.tipoturnos.filter(function (nick) {
                                            return nick.id === data.idttipoturno;
                                        })[0];
                                        data.dia = s.tipodias.filter(function (nick) {
                                            return nick.id === data.dia;
                                        })[0];
                                        s.listaturnoa.splice(s.index2, 1);
                                        s.listaturnoa.push(data);
                                        s.regturno = true;
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al modificar los datos');
                                        s.turnoa = pre;
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.turnoa = pre;
                                });
                    }
                };
                s.eliminart = function (u) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/personal/colaborador/eliminart', {id: u.id})
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');
                                        s.index2 = s.listaturnoa.indexOf(u);
                                        s.listaturnoa.splice(s.index2, 1);

                                        s.turnoa = {idttipoturno: s.tipoturnos[0],dia:s.tipodias[0]};
                                        s.regturno = true;
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
                };

                //AUTENTICACION
                s.sesion = function () {
                    h.post(contextPath + '/session')
                            .success(function (data) {
                                if (data === null) {
                                    window.location.href = contextPath + "/login";
                                } else {
                                    s.user = data;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                    t(s.sesion, 6000);
                };

                t(s.sesion, 6000);
            }
        ]);
