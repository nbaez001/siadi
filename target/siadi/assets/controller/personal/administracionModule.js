angular.module('administracionModule', ['ngValidate', 'dirPagination', 'components'])
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
        .controller('paramspersonalController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};
                s.index = 0;

                s.dependencias = [{id: 0, nombre: 'DIRECTORIO', abreviatura: 'DIR', estado: true}];
                s.dependencias2 = [{id: 0, nombre: 'DIRECTORIO', abreviatura: 'DIR', estado: true}];
                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];

                s.dependencia = {id: 0, estado: s.estados[0]};

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
                            s.dependencia.agencia = data;

                            s.listarDependencia(data);
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarDependencia = function (a) {
                    h.post(contextPath + '/common/listardependencia', a)
                            .success(function (data) {
                                data.forEach(function (val, i) {
                                    s.dependencias.push(val);
                                    s.dependencias2.push(val);
                                });

                                s.dependencias.forEach(function (val, i) {
                                    var dep = (s.dependencias2.filter(function (nick) {
                                        return nick.id === val.iddepende;
                                    }))[0];
                                    val.iddepende = dep;
                                });

                                s.dependencia.iddepende = s.dependencias2[0];
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validated = {
                    rules: {
                        iddepende: {
                            required: true,
                            min: 0
                        },
                        nombre: {
                            required: true
                        },
                        abreviatura: {
                            required: true
                        },
                        estado: {
                            required: true
                        }
                    },
                    messages: {
                        iddepende: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione una opcion'
                        },
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        abreviatura: {
                            required: 'Campo obligatorio'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrard = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.dependencia));
                        s.dependencia.estado = s.dependencia.estado.id;
                        s.dependencia.iddepende = s.dependencia.iddepende.id;
                        s.dependencia.idusuariocrea = s.user.id;
                        s.dependencia.fechusuariocrea = new Date();

                        h.post(contextPath + '/personal/administracion/registrardep', s.dependencia)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.dependencia = {id: 0, agencia: s.agencia, estado: s.estados[0], iddepende: s.dependencias[0]};

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente');

                                        data.iddepende = (s.dependencias2.filter(function (nick) {
                                            return nick.id === data.iddepende;
                                        }))[0];
                                        s.dependencias.push(data);
                                        s.dependencias2.push(data);
                                    } else {
                                        s.dependencia = pre;
                                        n.notificar('Notificacion', 'error', 'Error al registrar');
                                    }
                                })
                                .error(function (error, status) {
                                    s.dependencia = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });

                    }
                };

                s.mostrard = function (dep) {
                    s.dependencia = {
                        id: dep.id,
                        agencia: s.agencia,
                        iddepende: {id: dep.iddepende.id},
                        nombre: dep.nombre,
                        abreviatura: dep.abreviatura,
                        estado: {id: dep.estado},
                        rrhh: dep.rrhh,
                        descripcion: dep.descripcion,
                        idusuariocrea: dep.idusuariocrea,
                        fechusuariocrea: dep.fechusuariocrea,
                        idusuariomod: dep.idusuariomod,
                        fechusuariomod: dep.fechusuariomod
                    };
                    s.dependencias2 = JSON.parse(JSON.stringify(s.dependencias));

                    s.index = s.dependencias.indexOf(dep);
                    s.dependencias2.splice(s.index, 1);
                };

                s.actualizard = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.dependencia));
                        s.dependencia.estado = s.dependencia.estado.id;
                        s.dependencia.iddepende = s.dependencia.iddepende.id;
                        s.dependencia.idusuariomod = s.user.id;
                        s.dependencia.fechusuariomod = new Date();

                        h.post(contextPath + '/personal/administracion/actualizardep', s.dependencia)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente');
                                        s.dependencia = {id: 0, agencia: s.agencia, estado: s.estados[0], iddepende: s.dependencias[0]};

                                        s.dependencias.splice(s.index, 1);
                                        s.dependencias2.splice(s.index, 1);

                                        data.iddepende = (s.dependencias2.filter(function (nick) {
                                            return nick.id === data.iddepende;
                                        }))[0];

                                        s.dependencias.push(data);
                                        s.dependencias2.push(data);
                                    } else {
                                        s.dependencia = pre;
                                        n.notificar('Notificacion', 'error', 'Error al actualizar');
                                    }
                                })
                                .error(function (error, status) {
                                    s.dependencia = pre;
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminard = function (dep) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/personal/administracion/eliminardep', {id: dep.id})
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó correctamente');

                                        s.index = s.dependencias.indexOf(dep);
                                        s.dependencias.splice(s.index, 1);
                                        s.dependencias2.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.cancelard = function () {
                    s.dependencias2 = JSON.parse(JSON.stringify(s.dependencias));
                    s.dependencia = {id: 0, agencia: s.agencia, estado: s.estados[0], iddepende: s.dependencias[0]};
                };

                s.sort = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
                };

                s.obtenerCodigo = function (obj) {
                    obj.abreviatura = obj.nombre.charAt(0);
                    var estado = false;
                    obj.nombre.split('').forEach(function (c) {
                        if (estado) {
                            obj.abreviatura += c;
                            estado = false;
                        }

                        if (c === ' ') {
                            estado = true;
                        }
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
