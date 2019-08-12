angular.module("indexModule", ['ngValidate', 'components', 'dirPagination'])
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
        .controller("initparamsController", ["$scope", '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.opciones = [
                    {id: false, nombre: 'NO'},
                    {id: true, nombre: 'SI'}
                ];
                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];

                s.opcion = s.opciones[0];
                s.paises = [];

                s.agencias = [];
                s.agencia = {};
                s.agenciaa = {};

                s.modulos = [];
                s.modulosa = [];
                s.usuarios = [];
                s.usuario = {colaborador: {}};
                s.usuarioa = {colaborador: {}};

                s.bobeda = {fechaapertura: new Date(), estado: s.estados[0], montoapertura: 0.00, montocierre: 0.00, diezc: 0, veintec: 0, cincuentac: 0, uns: 0, doss: 0, cincos: 0, diezs: 0, veintes: 0, cincuentas: 0, ciens: 0, doscientoss: 0};
                s.bobedas = [];

                var f = new Date();
                f.setDate(f.getDate() - 365);

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarusuariot')
                        .success(function (data) {
                            s.usuarios = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarbobeda', f)
                        .success(function (data) {
                            s.bobedas = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listaragencia')
                        .success(function (data) {
                            s.agencias = data;

                            s.usuario.colaborador.agencia = s.agencias[0];
                            s.bobeda.agencia = s.agencias[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarpais')
                        .success(function (data) {
                            s.paises.push({id: 0, denominacion: 'SELECCIONE'});
                            s.pais = s.paises[0];
                            s.pais2 = s.paises[0];
                            s.pais3 = s.paises[0];
                            $.each(data, function (index, value) {
                                s.paises.push(value);
                            });
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

                s.listarDepartamento3 = function () {
                    s.departamentos3 = [];
                    s.departamentos3.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardepartamento', s.pais3)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.departamentos3.push(value);
                                });
                                s.departamento3 = s.departamentos3[0];
                            });
                };

                s.listarProvincia3 = function () {
                    s.provincias3 = [];
                    s.provincias3.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listarprovincia', s.departamento3)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.provincias3.push(value);
                                });
                                s.provincia3 = s.provincias3[0];
                            });
                };

                s.listarDistrito3 = function () {
                    s.distritos3 = [];
                    s.distritos3.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardistrito', s.provincia3)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.distritos3.push(value);
                                });
                                s.distrito3 = s.distritos3[0];
                            });
                };

                s.listarDepartamento4 = function () {
                    s.departamentos4 = [];
                    s.departamentos4.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardepartamento', s.pais4)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.departamentos4.push(value);
                                });
                                s.departamento4 = s.departamentos4[0];
                            });
                };

                s.listarProvincia4 = function () {
                    s.provincias4 = [];
                    s.provincias4.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listarprovincia', s.departamento4)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.provincias4.push(value);
                                });
                                s.provincia4 = s.provincias4[0];
                            });
                };

                s.listarDistrito4 = function () {
                    s.distritos4 = [];
                    s.distritos4.push({id: 0, denominacion: 'SELECCIONE'});
                    h.post(contextPath + '/common/listardistrito', s.provincia4)
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.distritos4.push(value);
                                });
                                s.distrito4 = s.distritos4[0];
                            });
                };

                s.validatee = {
                    rules: {
                        ruc: {
                            required: true,
                            minlength: 11,
                            maxlength: 11
                        },
                        razonsocial: {
                            required: true
                        },
                        telefono: {
                            required: true,
                            minlength: 9,
                            maxlength: 11
                        },
                        direccion: {
                            required: true
                        }
                    },
                    messages: {
                        ruc: {
                            required: "Campo obligatorio",
                            minlength: "Minimo de {0} digitos son permitidos",
                            maxlength: "Maximo de {0} digitos son permitidos"
                        },
                        razonsocial: {
                            required: "Campo obligatorio"
                        },
                        telefono: {
                            required: "Campo obligatorio",
                            minlength: "Minimo de {0} digitos son permitidos",
                            maxlength: "Maximo de {0} digitos son permitidos"
                        },
                        direccion: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.registrare = function (form) {
                    if (form.validate()) {
                        var formData = new FormData();
                        formData.append("ruc", s.agencia.ruc);
                        formData.append("razonsocial", s.agencia.razonsocial);
                        formData.append("nombrecomercial", s.agencia.nombrecomercial);
                        formData.append("telefono", s.agencia.telefono);
                        formData.append("direccion", s.agencia.direccion);
                        formData.append("file", s.file);

                        if (typeof s.distrito !== 'undefined') {
                            formData.append("iddistrito", s.distrito.id);
                        }

                        h.post(contextPath + '/registrarinitparams', formData, {headers: {'Content-type': undefined}, transformRequest: angular.identity})
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente la agencia');

                                        s.agencia = {};
                                        s.file = {};

                                        s.agencias.push(data);

                                        s.pais = s.paises[0];
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al registrar agencia');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostrare = function (e) {
                    s.agenciaa = {
                        id: e.id,
                        ruc: e.ruc,
                        razonsocial: e.razonsocial,
                        nombrecomercial: e.nombrecomercial,
                        telefono: e.telefono,
                        direccion: e.direccion,
                        urllogo: e.urllogo
                    };
                    s.index = s.agencias.indexOf(e);
                    angular.element('#modalAgencia').modal('show');
                };

                s.actualizare = function (form) {
                    if (form.validate()) {
                        var formData = new FormData();
                        formData.append("id", s.agenciaa.id);
                        formData.append("ruc", s.agenciaa.ruc);
                        formData.append("razonsocial", s.agenciaa.razonsocial);
                        formData.append("nombrecomercial", s.agenciaa.nombrecomercial);
                        formData.append("telefono", s.agenciaa.telefono);
                        formData.append("direccion", s.agenciaa.direccion);
                        if (s.opcion.id === false) {
                            formData.append("urllogo", s.agenciaa.urllogo);
                        } else {
                            formData.append("file", s.file2);
                        }

                        if (typeof s.distrito2 !== 'undefined') {
                            formData.append("iddistrito", s.distrito2.id);
                        }

                        h.post(contextPath + '/actualizarinitparams', formData, {headers: {'Content-type': undefined}, transformRequest: angular.identity})
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se actualizó correctamente los dato de agencia');
                                        angular.element('#modalAgencia').modal('hide');

                                        s.agenciaa = {};
                                        s.file2 = {};

                                        s.agencias.splice(s.index, 1);
                                        s.agencias.push(data);

                                        s.pais2 = s.paises[0];
                                        s.opcion = s.opciones[0];
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar datos de agencia');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminare = function (e) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/eliminarinitparams', e)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó el registro de agencia correctamente');

                                        s.index = s.agencias.indexOf(e);
                                        s.agencias.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar registro de agencia');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                //REGISTRO USUARIO
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
                        if (typeof s.distrito3 !== 'undefined') {
                            s.usuario.colaborador.iddistrito = s.distrito3.id;
                        }
                        s.usuario.idusuariocrea = s.user.id;
                        s.usuario.fechusuariocrea = new Date();
                        h.post(contextPath + '/personal/colaborador/registrout', {usuario: s.usuario, lm: s.modulos})
                                .success(function (data) {
                                    if (data !== null) {
                                        s.usuario = {colaborador: {agencia: s.agencias[0]}};
                                        s.pais3 = s.paises[0];
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente el usuario');
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
                            agencia: {
                                id: u.colaborador.agencia.id,
                                iddistrito: u.colaborador.agencia.iddistrito,
                                razonsocial: u.colaborador.agencia.razonsocial,
                                ruc: u.colaborador.agencia.ruc,
                                telefono: u.colaborador.agencia.telefono,
                                urllogo: u.colaborador.agencia.urllogo,
                                direccion: u.colaborador.agencia.direccion
                            },
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
                    s.pais4 = s.paises[0];
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
                        if (typeof s.distrito4 !== 'undefined') {
                            s.usuarioa.colaborador.iddistrito = s.distrito4.id;
                        }
                        s.usuarioa.idusuariomod = s.user.id;
                        s.usuarioa.fechusuariomod = new Date();
                        h.post(contextPath + '/personal/colaborador/actualizarut', {usuario: s.usuarioa, lm: s.modulosa})
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se modifico los datos del usuario correctamente');
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
                                        n.notificar('Notificacion', 'error', 'Error al modificar los datos del usuario');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminaru = function (u) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/personal/colaborador/eliminarut', u)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó el usuario correctamente');
                                        s.index = s.usuarios.indexOf(u);
                                        s.usuarios.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar usuario');
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

                s.calcularTotal = function () {
                    s.bobeda.montoapertura = parseFloat((s.bobeda.diezc * 0.10 + s.bobeda.veintec * 0.20 + s.bobeda.cincuentac * 0.50 + s.bobeda.uns * 1.00 + s.bobeda.doss * 2.00 + s.bobeda.cincos * 5.00 + s.bobeda.diezs * 10.00 + s.bobeda.veintes * 20.00 + s.bobeda.cincuentas * 50.00 + s.bobeda.ciens * 100.00 + s.bobeda.doscientoss * 200.00).toFixed(2));
                    s.bobeda.diezcz = s.bobeda.diezc;
                    s.bobeda.veintecz = s.bobeda.veintec;
                    s.bobeda.cincuentacz = s.bobeda.cincuentac;
                    s.bobeda.unsz = s.bobeda.uns;
                    s.bobeda.dossz = s.bobeda.doss;
                    s.bobeda.cincosz = s.bobeda.cincos;
                    s.bobeda.diezsz = s.bobeda.diezs;
                    s.bobeda.veintesz = s.bobeda.veintes;
                    s.bobeda.cincuentasz = s.bobeda.cincuentas;
                    s.bobeda.ciensz = s.bobeda.ciens;
                    s.bobeda.doscientossz = s.bobeda.doscientoss;
                    s.bobeda.montocierre = s.bobeda.montoapertura;
                };

                s.validateb = {
                    rules: {
                        agencia: {
                            required: true
                        },
                        nombre: {
                            required: true
                        },
                        estado: {
                            required: true
                        },
                        fechaapertura: {
                            required: true
                        },
                        diezc: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        veintec: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        cincuentac: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        uns: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        doss: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        cincos: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        diezs: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        veintes: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        cincuentas: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        ciens: {
                            required: true,
                            min: 0,
                            step: 1
                        },
                        doscientoss: {
                            required: true,
                            min: 0,
                            step: 1
                        }
                    },
                    messages: {
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        nombre: {
                            required: "Campo obligatorio"
                        },
                        estado: {
                            required: "Campo obligatorio"
                        },
                        fechaapertura: {
                            required: "Campo obligatorio"
                        },
                        diezc: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        veintec: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        cincuentac: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        uns: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        doss: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        cincos: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        diezs: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        veintes: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        cincuentas: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        ciens: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        },
                        doscientoss: {
                            required: "Campo obligatorio",
                            min: "Ingrese solo valores positivos",
                            step: "Ingrese solo numeros enteros"
                        }
                    }
                };

                s.registrarb = function (form) {
                    if (form.validate()) {
                        if (s.bobeda.montoapertura <= 0.00) {
                            if (confirm("¿Esta seguro que desea aperturar la bobeda con el monto " + s.bobeda.montoapertura + "?")) {
                                var pre = JSON.parse(JSON.stringify(s.bobeda));
                                s.bobeda.idusuariocrea = s.user.id;
                                s.bobeda.fechusuariocrea = new Date();
                                s.bobeda.estado = s.bobeda.estado.id;

                                console.log(s.bobeda);

                                h.post(contextPath + '/pos/administracion/registrobob', s.bobeda)
                                        .success(function (data) {
                                            if (data !== null) {
                                                s.bobeda = {fechaapertura: new Date(), estado: s.estados[0], montoapertura: 0.00, montocierre: 0.00, diezc: 0, veintec: 0, cincuentac: 0, uns: 0, doss: 0, cincos: 0, diezs: 0, veintes: 0, cincuentas: 0, ciens: 0, doscientoss: 0};
                                                n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                                s.bobedas.push(data);
                                            } else {
                                                n.notificar('Notificacion', 'error', 'Error al registrar');
                                                s.bobeda = pre;
                                            }
                                        })
                                        .error(function (error, status) {
                                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                                            s.bobeda = pre;
                                        });
                            }
                        } else {
                            var pre = JSON.parse(JSON.stringify(s.bobeda));
                            s.bobeda.idusuariocrea = s.user.id;
                            s.bobeda.fechusuariocrea = new Date();
                            s.bobeda.estado = s.bobeda.estado.id;

                            console.log(s.bobeda);

                            h.post(contextPath + '/pos/administracion/registrobob', s.bobeda)
                                    .success(function (data) {
                                        if (data !== null) {
                                            s.bobeda = {fechaapertura: new Date(), estado: s.estados[0], montoapertura: 0.00, montocierre: 0.00, diezc: 0, veintec: 0, cincuentac: 0, uns: 0, doss: 0, cincos: 0, diezs: 0, veintes: 0, cincuentas: 0, ciens: 0, doscientoss: 0};
                                            n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                            s.bobedas.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error al registrar');
                                            s.bobeda = pre;
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.bobeda = pre;
                                    });
                        }
                    }
                };

                s.eliminarb = function (b) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/pos/administracion/eliminarbob', b)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');
                                        s.index = s.bobedas.indexOf(b);
                                        s.bobedas.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
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
                    t(s.sesion, 60000);
                };

                t(s.sesion, 60000);
            }
        ])
        .controller("loginController", ["$scope", '$http', '$timeout', function (s, h, t) {
                s.agencias = [];
                s.usuario = {colaborador: {}};
                s.showmessage = false;
                s.mostrar = true;

                h.post(contextPath + '/common/listaragencia')
                        .success(function (data) {
                            s.agencias = data;
                            s.usuario.colaborador.agencia = s.agencias[0];
                        })
                        .error(function (error, status) {
                        });

                s.validate = {
                    rules: {
                        agencia: {
                            required: true
                        },
                        usuario: {
                            required: true
                        },
                        contrasena: {
                            required: true
                        }
                    },
                    messages: {
                        agencia: {
                            required: "Campo obligatorio"
                        },
                        usuario: {
                            required: "Campo obligatorio"
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.autenticar = function (form) {
                    if (form.validate()) {
                        h.post(contextPath + '/login', s.usuario)
                                .success(function (data) {
                                    if (data !== null) {
                                        window.location.href = contextPath + '/modulos';
                                    } else {
                                        s.message = 'Error, usuario o contraseña son incorrectos';
                                        s.showmessage = true;
                                        t(s.ocultar, 5000);
                                    }
                                })
                                .error(function (error, status) {
                                    s.message = 'Error: ' + status;
                                    s.showmessage = true;
                                    t(s.ocultar, 5000);
                                });
                    }
                };

                s.ocultar = function () {
                    s.showmessage = false;
                };

                t(function () {
                    s.mostrar = false;
                }, 20000);
            }
        ])
        .controller("loginadminController", ["$scope", '$http', '$timeout', function (s, h, t) {
                s.usuario = {};
                s.showmessage = false;

                s.validate = {
                    rules: {
                        usuario: {
                            required: true
                        },
                        contrasena: {
                            required: true
                        }
                    },
                    messages: {
                        usuario: {
                            required: "Campo obligatorio"
                        },
                        contrasena: {
                            required: "Campo obligatorio"
                        }
                    }
                };

                s.autenticar = function (form) {
                    if (form.validate()) {
                        h.post(contextPath + '/loginadmin', s.usuario)
                                .success(function (data) {
                                    if (data !== null) {
                                        window.location.href = contextPath + '/initparams';
                                    } else {
                                        s.message = 'Error, usuario o contraseña son incorrectos';
                                        s.showmessage = true;
                                        t(s.ocultar, 8000);
                                    }
                                })
                                .error(function (error, status) {
                                    s.message = 'Error: ' + status;
                                    s.showmessage = true;
                                    t(s.ocultar, 8000);
                                });
                    }
                };

                s.ocultar = function () {
                    s.showmessage = false;
                };
            }
        ])
        .controller("modulosController", ["$scope", '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.mostrar = true;
                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                t(function () {
                    s.mostrar = false;
                }, 60000);
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
                    t(s.sesion, 60000);
                };

                t(s.sesion, 60000);
            }
        ]);