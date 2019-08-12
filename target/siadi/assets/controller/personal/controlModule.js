angular.module('controlModule', ['ngValidate', 'dirPagination', 'components'])
        .controller('permisoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.showmensaje = false;

                s.permiso = {contrato: {}};
                s.permisos = [];

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

                h.post(contextPath + '/sessioncontrato')
                        .success(function (data) {
                            s.permiso.contrato = data;
                            s.listarPermisos(data);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 17})
                        .success(function (data) {
                            s.tipopermisos = data;
                            s.permiso.idttipopermiso = s.tipopermisos[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarPermisos = function (cont) {
                    h.post(contextPath + '/personal/control/listarpermiso', cont)
                            .success(function (data) {
                                s.permisos = data;

                                s.permisos.forEach(function (val, i) {
                                    val.idttipopermiso = s.tipopermisos.filter(function (nick) {
                                        return nick.id === val.idttipopermiso;
                                    })[0];
                                    val.fecha = new Date(val.fecha);
                                    val.horaretorno = new Date(val.horaretorno);
                                    val.horasalida = new Date(val.horasalida);
                                });
                                console.log(s.permisos);
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatep = {
                    rules: {
                        idttipopermiso: {
                            required: true,
                            min: 1
                        },
                        contrato: {
                            required: true
                        },
                        fecha: {
                            required: true
                        },
                        horasalida: {
                            required: true
                        },
                        horaretorno: {
                            required: true
                        },
                        destino: {
                            required: true
                        }
                    },
                    messages: {
                        idttipopermiso: {
                            required: "Campo obligatorio",
                            min: "Seleccione una opcion"
                        },
                        contrato: {
                            required: "Campo obligatorio"
                        },
                        fecha: {
                            required: "Campo obligatorio"
                        },
                        horasalida: {
                            required: "Campo obligatorio"
                        },
                        horaretorno: {
                            required: "Campo obligatorio"
                        },
                        destino: {
                            required: "Campo obligatorio"
                        }
                    }
                };
                s.registrarp = function (form) {
                    if (form.validate()) {
                        if (s.permiso.contrato !== null) {
                            var pre = JSON.parse(JSON.stringify(s.permiso));
                            s.permiso.autorizja = 0;
                            s.permiso.autorizjp = 0;
                            s.permiso.idttipopermiso = s.permiso.idttipopermiso.id;

                            console.log(s.permiso);

                            h.post(contextPath + '/personal/control/registrop', s.permiso)
                                    .success(function (data) {
                                        if (data !== null) {
                                            s.permiso = {contrato: pre.contrato};
                                            n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                            data.idttipopermiso = s.tipopermisos.filter(function (nick) {
                                                return nick.id === data.idttipopermiso;
                                            })[0];

                                            s.permisos.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error al registrar');
                                            s.permiso = pre;
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        s.permiso = pre;
                                    });
                        }
                        else {
                            s.mensaje = 'Usted no tiene contrato registrado';
                            s.showmensaje = true;
                            t(function () {
                                s.showmensaje = false;
                            }, 6000);
                        }
                    }
                };
                s.mostrarp = function (u) {
                    s.permisoa = {
                        id: u.id,
                        contrato: {
                            id: u.contrato.id
                        },
                        idttipopermiso: u.idttipopermiso,
                        fecha: u.fecha,
                        horasalida: u.horasalida,
                        horaretorno: u.horaretorno,
                        autorizja: u.autorizja,
                        autorizjp: u.autorizjp,
                        destino: u.destino,
                        descripcion: u.descripcion
                    };
                };
                s.actualizarp = function (form) {
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
                s.eliminarp = function (u) {
                    if (confirm("¿Esta seguro que desea eliminar este item?")) {
                        h.post(contextPath + '/personal/control/eliminarp', {id: u.id})
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');
                                        s.index = s.permisos.indexOf(u);
                                        s.permisos.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
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
        ])
        .controller('otpermisoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.showmensaje = false;

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
                            s.listarPermisos(s.agencia);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/sessioncontrato')
                        .success(function (data) {
                            s.contrato = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 17})
                        .success(function (data) {
                            s.tipopermisos = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarPermisos = function (ag) {
                    h.post(contextPath + '/personal/control/listarpermisos', ag)
                            .success(function (data) {
                                console.log('lista de permisos');
                                console.log(data);
                                s.permisos = data;

                                s.permisos.forEach(function (val, i) {
                                    val.idttipopermiso = s.tipopermisos.filter(function (nick) {
                                        return nick.id === val.idttipopermiso;
                                    })[0];
                                    val.fecha = new Date(val.fecha);
                                    val.horasalida = new Date(val.horasalida);
                                    val.horaretorno = new Date(val.horaretorno);
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.mostrarp = function (u) {
                    s.permisoa = {
                        id: u.id,
                        contrato: u.contrato,
                        idttipopermiso: u.idttipopermiso,
                        fecha: u.fecha,
                        horasalida: u.horasalida,
                        horaretorno: u.horaretorno,
                        autorizja: u.autorizja,
                        autorizjp: u.autorizjp,
                        destino: u.destino,
                        descripcion: u.descripcion
                    };

                    s.index = s.permisos.indexOf(u);

                    angular.element('#modalPermiso').modal('show');
                };

                //p: permiso    nu:jefe area 1 o jefe personal 2    t: 1 otorgar 2 denegar
                s.confirmar = function (p, nu, t) {
                    s.index = s.permisos.indexOf(p);
                    var pre = JSON.parse(JSON.stringify(p));
                    if (t === 1) {
                        if (nu === 1) {
                            p.autorizja = 1;
                        } else {
                            p.autorizjp = 1;
                        }
                    } else {
                        if (nu === 1) {
                            p.autorizja = -1;
                        } else {
                            p.autorizjp = -1;
                        }
                    }
                    p.contrato = {id: pre.contrato.id};
                    p.idttipopermiso = p.idttipopermiso.id;

                    h.post(contextPath + '/personal/control/autorizarp', p)
                            .success(function (data) {
                                if (data !== null) {
                                    n.notificar('Notificacion', 'success', 'Se otorgó el permiso');
                                    angular.element('#modalPermiso').modal('hide');

                                    data.idttipopermiso = s.tipopermisos.filter(function (nick) {
                                        return nick.id === data.idttipopermiso;
                                    })[0];

                                    s.permisos.splice(s.index, 1);
                                    s.permisos.push(data);
                                } else {
                                    n.notificar('Notificacion', 'error', 'Error al procesar');
                                    p = pre;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                                p = pre;
                            });
                };

                s.actualizarp = function (dat) {
                    var pre = JSON.parse(JSON.stringify(s.permisoa));
                    s.permisoa.autorizja = dat;
                    s.permisoa.idusuariomod = s.user.id;
                    s.permisoa.fechusuariomod = new Date();
                    s.permisoa.idttipopermiso = s.permisoa.idttipopermiso.id;

                    h.post(contextPath + '/personal/control/autorizarp', s.permisoa)
                            .success(function (data) {
                                if (data !== null) {
                                    console.log(data);
                                    n.notificar('Notificacion', 'success', 'Se modifico los datos correctamente');
                                    angular.element('#modalPermiso').modal('hide');

                                    s.permisoa = {};
                                    s.permisos.splice(s.index, 1);
                                } else {
                                    n.notificar('Notificacion', 'error', 'Error al modificar los datos');
                                    s.permisoa = pre;
                                }
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                                s.permisoa = pre;
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
        ]);