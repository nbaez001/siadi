angular.module('administracionModule', ['ngValidate', 'dirPagination', 'components', 'LocalStorageModule'])
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
        .controller('paramsproductoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.index = 0;

                s.marcas = [];
                s.unidadmedidas = [];
                s.categorias = [];
                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];

                s.marca = {};
                s.marca.estado = s.estados[0];
                s.marcaa = {};
                s.marcaa.estado = s.estados[0];

                s.categoria = {};
                s.categoria.estado = s.estados[0];
                s.categoriaa = {};
                s.categoriaa.estado = s.estados[0];

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarmarca')
                        .success(function (data) {
                            s.marcas = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarcategoria')
                        .success(function (data) {
                            s.categorias = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.validatem = {
                    rules: {
                        denominacion: {
                            required: true
                        },
                        codigo: {
                            required: true
                        },
                        estado: {
                            required: true
                        }
                    },
                    messages: {
                        denominacion: {
                            required: 'Campo obligatorio'
                        },
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrarm = function (form) {
                    if (form.validate()) {
                        s.marca.estado = s.marca.estado.id;
                        s.marca.idusuariocrea = s.user.id;
                        s.marca.fechusuariocrea = new Date();

                        h.post(contextPath + '/almacen/administracion/registrarm', s.marca)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.marca = {};
                                        s.marca.estado = s.estados[0];

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente la marca');

                                        s.marcas.push(data);
                                    } else {
                                        s.marca.estado = s.estados[0];
                                        n.notificar('Notificacion', 'error', 'Error al registrar marca');
                                    }
                                })
                                .error(function (error, status) {
                                    s.marca.estado = s.estados[0];
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });

                    }
                };

                s.mostrarm = function (marca) {
                    s.marcaa = {
                        id: marca.id,
                        denominacion: marca.denominacion,
                        codigo: marca.codigo,
                        estado: {id: marca.estado},
                        idusuariocrea: marca.idusuariocrea,
                        fechusuariocrea: marca.fechusuariocrea,
                        idusuariomod: marca.idusuariomod,
                        fechusuariomod: marca.fechusuariomod
                    };

                    s.index = s.marcas.indexOf(marca);
                };

                s.actualizarma = function (form) {
                    if (form.validate()) {
                        s.marcaa.estado = s.marcaa.estado.id;
                        s.marcaa.idusuariomod = s.user.id;
                        s.marcaa.fechusuariomod = new Date();

                        h.post(contextPath + '/almacen/administracion/actualizarm', s.marcaa)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente la marca');
                                        $('#modalMarca').modal('hide');

                                        s.marcas.splice(s.index, 1);
                                        s.marcas.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar marca');
                                        s.marcaa.estado = s.estados[0];
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.marcaa.estado = s.estados[0];
                                });
                    }
                };

                s.eliminarm = function (marca) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/almacen/administracion/eliminarm', marca)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó la marca correctamente');

                                        s.index = s.marcas.indexOf(marca);
                                        s.marcas.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar marca');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.sortm = function (keyname) {
                    s.sortKey = keyname;
                    s.reverse = !s.reverse;
                };

                s.validatec = {
                    rules: {
                        denominacion: {
                            required: true
                        },
                        codigo: {
                            required: true
                        },
                        estado: {
                            required: true
                        }
                    },
                    messages: {
                        denominacion: {
                            required: 'Campo obligatorio'
                        },
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrarc = function (form) {
                    if (form.validate()) {
                        s.categoria.estado = s.categoria.estado.id;
                        s.categoria.idusuariocrea = 1;
                        s.categoria.fechusuariocrea = new Date();

                        h.post(contextPath + '/almacen/administracion/registrarc', s.categoria)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.categoria = {};
                                        s.categoria.estado = s.estados[0];

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente la categoria');

                                        s.categorias.push(data);
                                    } else {
                                        s.categoria.estado = s.estados[0];
                                        n.notificar('Notificacion', 'error', 'Error al registrar categoria');
                                    }
                                })
                                .error(function (error, status) {
                                    s.categoria.estado = s.estados[0];
                                    error = error.slice(1003, error.length);
                                    n.notificar('Notificacion', 'error', 'Error: ' + error.slice(0, error.indexOf('<')));
                                });
                    }
                };

                s.mostrarc = function (categoria) {
                    s.categoriaa = {
                        id: categoria.id,
                        denominacion: categoria.denominacion,
                        codigo: categoria.codigo,
                        estado: {id: categoria.estado},
                        idusuariocrea: categoria.idusuariocrea,
                        fechusuariocrea: categoria.fechusuariocrea,
                        idusuariomod: categoria.idusuariomod,
                        fechusuariomod: categoria.fechusuariomod
                    };

                    s.index = s.categorias.indexOf(categoria);
                };

                s.actualizarc = function (form) {
                    if (form.validate()) {
                        s.categoriaa.estado = s.categoriaa.estado.id;
                        s.categoriaa.idusuariomod = 1;
                        s.categoriaa.fechusuariomod = new Date();

                        h.post(contextPath + '/almacen/administracion/actualizarc', s.categoriaa)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se actualizo correctamente la categoria');
                                        $('#modalCategoria').modal('hide');

                                        s.categorias.splice(s.index, 1);
                                        s.categorias.push(data);
                                    } else {
                                        s.categoriaa.estado = s.estados[0];
                                        n.notificar('Notificacion', 'error', 'Error al actualizar categoria');
                                    }
                                })
                                .error(function (error, status) {
                                    s.categoriaa.estado = s.estados[0];
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminarc = function (categoria) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/almacen/administracion/eliminarc', categoria)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó la categoria correctamente');

                                        s.index = s.categorias.indexOf(categoria);
                                        s.categorias.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar categoria');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.sortc = function (keyname) {
                    s.sortKeyc = keyname;
                    s.reversec = !s.reversec;
                };

                s.obtenerCodigo = function (obj) {
                    obj.codigo = obj.denominacion.slice(0, 3);
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
                    t(s.sesion, 180000);
                };

                t(s.sesion, 180000);
            }
        ])
        .controller('almacenController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.almacen = {};
                s.andamio = {};
                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];
                s.almacen.estado = s.estados[0];
                s.andamio.estado = s.estados[0];

                s.agencias = [];
                s.almacenes = [];

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
                            s.listarAlmacen();
                            s.obtenerCodigoalmacen();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listaragencia')
                        .success(function (data) {
                            s.agencias = data;
                            s.almacen.agencia = s.agencia;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarAlmacen = function () {
                    h.post(contextPath + '/common/listaralmacen', s.agencia)
                            .success(function (data) {
                                $.each(data, function (i, value) {
                                    var alm = value;
                                    alm.andamios = [];
                                    alm.andamio = {};
                                    alm.andamio.estado = s.estados[0];
                                    s.obtenerCodigoandamio(alm);
                                    h.post(contextPath + '/common/listarandamio', {id: alm.id})
                                            .success(function (data2) {
                                                alm.andamios = data2;
                                            })
                                            .error(function (error, status) {
                                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                                            });

                                    s.almacenes.push(alm);
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigoalmacen = function () {
                    h.post(contextPath + '/almacen/administracion/obtcodigoalm', s.agencia)
                            .success(function (data) {
                                s.almacen.codigo = 'ALM-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.obtenerCodigoandamio = function (alm) {
                    h.post(contextPath + '/almacen/administracion/obtcodigoand', {id: alm.id})
                            .success(function (data) {
                                alm.andamio.codigo = alm.codigo + '-0' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatea = {
                    rules: {
                        agencia: {
                            required: true
                        },
                        codigo: {
                            required: true
                        },
                        nombre: {
                            required: true
                        },
                        fechaapertura: {
                            required: true
                        },
                        estado: {
                            required: true
                        }
                    },
                    messages: {
                        agencia: {
                            required: 'Campo obligatorio'
                        },
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        fechaapertura: {
                            required: 'Campo obligatorio'
                        },
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrara = function (form) {
                    if (form.validate()) {
                        s.almacen.estado = s.almacen.estado.id;
                        s.almacen.idusuariocrea = s.user.id;
                        s.almacen.fechusuariocrea = new Date();

                        h.post(contextPath + '/almacen/administracion/registraralm', s.almacen)
                                .success(function (data) {
                                    if (data !== null) {
                                        s.almacen = {agencia: s.agencia};
                                        s.almacen.estado = s.estados[0];

                                        n.notificar('Notificacion', 'success', 'Se registro correctamente el almacen');
                                        s.obtenerCodigoalmacen();

                                        data.andamio = {};
                                        data.andamios = [];
                                        data.andamio.estado = s.estados[0];
                                        s.almacenes.push(data);
                                    } else {
                                        s.almacen.estado = s.estados[0];
                                        n.notificar('Notificacion', 'error', 'Error al registrar almacen');
                                    }
                                })
                                .error(function (error, status) {
                                    s.almacen.estado = s.estados[0];
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostrara = function (a) {
                    s.almacena = {
                        id: a.id,
                        agencia: {id: a.agencia.id, razonsocial: a.agencia.razonsocial},
                        nombre: a.nombre,
                        codigo: a.codigo,
                        estado: {id: a.estado},
                        fechaapertura: a.fechaapertura,
                        idusuariocrea: a.idusuariocrea,
                        fechusuariocrea: a.fechusuariocrea,
                        idusuariomod: a.idusuariomod,
                        fechusuariomod: a.fechusuariomod
                    };
                    s.index = s.almacenes.indexOf(a);
                    angular.element('#modalAlmacen').modal('show');
                };

                s.actualizara = function (form) {
                    if (form.validate()) {
                        var pre = JSON.parse(JSON.stringify(s.almacena));
                        s.almacena.estado = s.almacena.estado.id;
                        s.almacena.idusuariomod = s.user.id;
                        s.almacena.fechusuariomod = new Date();

                        h.post(contextPath + '/almacen/administracion/actualizaralm', s.almacena)
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se actualizó correctamente los datos del almacen');
                                        angular.element('#modalAlmacen').modal('hide');

                                        var andamios = s.almacenes[s.index].andamios;
                                        var andamio = s.almacenes[s.index].andamio;
                                        s.almacenes.splice(s.index, 1);

                                        data.andamios = andamios;
                                        data.andamio = andamio;
                                        s.almacenes.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar datos de almacen');
                                        s.almacena = pre;
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    s.almacena = pre;
                                });
                    }
                };

                s.eliminara = function (almacen) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/almacen/administracion/eliminaralm', {id: almacen.id})
                                .success(function (data) {
                                    console.log(data);
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó el almacen correctamente');

                                        s.index = s.almacenes.indexOf(almacen);
                                        s.almacenes.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar almacen');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.validatean = {
                    rules: {
                        nombre: {
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
                        estado: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registraran = function (alm) {
                    alm.andamio.estado = alm.andamio.estado.id;
                    alm.andamio.idusuariocrea = s.user.id;
                    alm.andamio.fechusuariocrea = new Date();
                    alm.andamio.almacen = {id: alm.id, codigo: alm.codigo};

                    h.post(contextPath + '/almacen/administracion/registrarand', alm.andamio)
                            .success(function (data) {
                                if (data !== null) {
                                    alm.andamio = {};
                                    alm.andamio.estado = s.estados[0];

                                    s.obtenerCodigoandamio(alm);
                                    n.notificar('Notificacion', 'success', 'Se registro correctamente el andamio');

                                    alm.andamios.push(data);
                                } else {
                                    alm.andamio.estado = s.estados[0];
                                    n.notificar('Notificacion', 'error', 'Error al registrar andamio');
                                }
                            })
                            .error(function (error, status) {
                                alm.andamio.estado = s.estados[0];
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.eliminaran = function (a, alm) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        h.post(contextPath + '/almacen/administracion/eliminarand', a)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó el andamio correctamente');

                                        s.index = alm.andamios.indexOf(a);
                                        alm.andamios.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al eliminar andamio');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.sortm = function (keyname) {
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
                    t(s.sesion, 180000);
                };

                t(s.sesion, 180000);
            }
        ])
        .controller('productoController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.opciones = [
                    {id: false, nombre: 'NO'},
                    {id: true, nombre: 'SI'}
                ];
                s.opcion = s.opciones[0];

                s.estados = [
                    {id: true, nombre: 'ACTIVO'},
                    {id: false, nombre: 'INACTIVO'}
                ];

                s.categorias = [];
                s.unidadmedidas = [];
                s.marcas = [];
                s.tipos = [];
                s.productos = [];

                s.producto = {};
                s.productoa = {};

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarcategoria')
                        .success(function (data) {
                            s.categorias = data;
                            s.producto.categoria = s.categorias[0];
                            s.obtenerCodigoproducto();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarmarca')
                        .success(function (data) {
                            s.marcas = data;
                            s.producto.marca = s.marcas[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 10})
                        .success(function (data) {
                            s.unidadmedidas = data;
                            s.producto.idtunidadmedida = s.unidadmedidas[6];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 11})
                        .success(function (data) {
                            s.tipos = data;
                            s.producto.idttipo = s.tipos[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.obtenerCodigoproducto = function () {
                    h.post(contextPath + '/almacen/administracion/obtcodigopro', s.producto.categoria)
                            .success(function (data) {
                                s.producto.codigo = s.producto.categoria.codigo + '-00' + data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.validatep = {
                    rules: {
                        categoria: {
                            required: true
                        },
                        marca: {
                            required: true
                        },
                        unidadmedida: {
                            required: true
                        },
                        tipo: {
                            required: true
                        },
                        codigo: {
                            required: true
                        },
                        nombre: {
                            required: true
                        },
                        cantidadmin: {
                            required: true
                        }
                    },
                    messages: {
                        categoria: {
                            required: 'Campo obligatorio'
                        },
                        marca: {
                            required: 'Campo obligatorio'
                        },
                        unidadmedida: {
                            required: 'Campo obligatorio'
                        },
                        tipo: {
                            required: 'Campo obligatorio'
                        },
                        codigo: {
                            required: 'Campo obligatorio'
                        },
                        nombre: {
                            required: 'Campo obligatorio'
                        },
                        cantidadmin: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.registrarp = function (form) {
                    if (form.validate()) {
                        var formData = new FormData();
                        formData.append('categoria.id', s.producto.categoria.id);
                        formData.append('categoria.codigo', s.producto.categoria.codigo);
                        formData.append('categoria.denominacion', s.producto.categoria.denominacion);
                        formData.append('idtunidadmedida', s.producto.idtunidadmedida.id);
                        formData.append('marca.id', s.producto.marca.id);
                        formData.append('marca.denominacion', s.producto.marca.denominacion);
                        formData.append('idttipo', s.producto.idttipo.id);
                        formData.append('codigo', s.producto.codigo);
                        formData.append('nombre', s.producto.nombre);
                        formData.append('cantidadmin', s.producto.cantidadmin);
                        formData.append('descripcion', s.producto.descripcion);
                        formData.append('estado', true);
                        formData.append('idusuariocrea', s.user.id);
                        formData.append('fechusuariocrea', new Date());
                        formData.append('file', s.file);

                        h.post(contextPath + '/almacen/administracion/registropro', formData, {headers: {'Content-type': undefined}, transformRequest: angular.identity})
                                .success(function (data) {
                                    if (data !== null) {
                                        n.notificar('Notificacion', 'success', 'Se registro correctamente el producto');

                                        s.producto = {};
                                        s.producto.idtunidadmedida = s.unidadmedidas[0];
                                        s.producto.marca = s.marcas[0];
                                        s.producto.categoria = s.categorias[0];
                                        s.producto.idttipo = s.tipos[0];
                                        s.obtenerCodigoproducto();
                                        s.file = null;

                                        s.productos.push(data);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al registrar producto');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.mostrarp = function (p) {
                    s.productoa = {
                        id: p.id,
                        categoria: {id: p.categoria.id, codigo: p.categoria.codigo},
                        idtunidadmedida: {id: p.idtunidadmedida},
                        marca: {id: p.marca.id},
                        idttipo: {id: p.idttipo},
                        codigo: p.codigo,
                        nombre: p.nombre,
                        cantidadmin: p.cantidadmin,
                        descripcion: p.descripcion,
                        estado: {id: p.estado},
                        idusuariocrea: p.idusuariocrea,
                        fechusuariocrea: p.fechusuariocrea,
                        idusuariomod: p.idusuariomod,
                        fechusuariomod: p.fechusuariomod,
                        urlfoto: p.urlfoto
                    };
                    s.index = s.productos.indexOf(p);
                };

                s.actualizarp = function (form) {
                    if (form.validate()) {
                        var formData = new FormData();
                        formData.append('id', s.productoa.id);
                        formData.append('categoria.id', s.productoa.categoria.id);
                        formData.append('categoria.codigo', s.productoa.categoria.codigo);
                        formData.append('categoria.denominacion', s.productoa.categoria.denominacion);
                        formData.append('idtunidadmedida', s.productoa.idtunidadmedida.id);
                        formData.append('marca.id', s.productoa.marca.id);
                        formData.append('marca.denominacion', s.productoa.marca.denominacion);
                        formData.append('idttipo', s.productoa.idttipo.id);
                        formData.append('codigo', s.productoa.codigo);
                        formData.append('nombre', s.productoa.nombre);
                        formData.append('cantidadmin', s.productoa.cantidadmin);
                        formData.append('descripcion', s.productoa.descripcion);
                        formData.append('estado', s.productoa.estado.id);
                        formData.append('idusuariocrea', s.productoa.idusuariocrea);
                        formData.append('fechusuariocrea', new Date(s.productoa.fechusuariocrea));
                        formData.append('idusuariomod', s.user.id);
                        formData.append('fechusuariomod', new Date());
                        formData.append('urlfoto', s.productoa.urlfoto);
                        if (s.opcion.id === true) {
                            formData.append('file', s.file2);
                        }

                        h.post(contextPath + '/almacen/administracion/actualizarpro', formData, {headers: {'Content-type': undefined}, transformRequest: angular.identity})
                                .success(function (data) {
                                    if (data !== null) {
                                        angular.element('#modalProducto').modal('hide');
                                        n.notificar('Notificacion', 'success', 'Se actualizó correctamente el producto');

                                        s.productoa = {};
                                        s.file2 = null;

                                        s.productos.splice(s.index, 1);
                                        s.productos.push(data);

                                        s.opcion = s.opciones[0];
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al actualizar producto');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.eliminarp = function (p) {
                    if (confirm('¿Esta seguro que desea eliminar este producto?')) {
                        h.post(contextPath + '/almacen/administracion/eliminarpro', p)
                                .success(function (data) {
                                    if (data === 1) {
                                        n.notificar('Notificacion', 'success', 'Se eliminó el producto correctamente');

                                        s.index = s.productos.indexOf(p);
                                        s.productos.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error al aliminar producto');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.ocultarp = function () {
                    s.opcion = s.opciones[0];
                    s.opcion = s.opciones[0];
                };

                s.countUp = function () {
                    s.tiempo = new Date();

                    s.fecha = s.dias[s.tiempo.getDay()] + ' ' + s.tiempo.getDate() + ' ' + s.meses[s.tiempo.getMonth()] + ' ' + s.tiempo.getFullYear() + ' (' + s.tiempo.getHours() + ':' + s.tiempo.getMinutes() + ':' + s.tiempo.getSeconds() + ') Horas';
                    t(s.countUp, 1000);
                };

                t(s.countUp, 1000);

                s.sortp = function (keyname) {
                    s.sortKeyp = keyname;
                    s.reversep = !s.reversep;
                };

                //LISTAR PRODUCTOS
                h.post(contextPath + '/common/listarproducto')
                        .success(function (data) {
                            s.productos = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

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
        .controller('inventarioController', ['$scope', '$http', '$timeout', 'localStorageService', 'notify', function (s, h, t, ls, n) {
                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.user = {};
                s.agencia = {};

                s.unidadmedidas = [];
                s.tipos = [];
                s.almacenes = [];
                s.andamios = [];
                s.inventarios = [];

                s.producto = {};

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
                            s.listarAlmacen();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 10})
                        .success(function (data) {
                            s.unidadmedidas = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listartipo', {idtabla: 11})
                        .success(function (data) {
                            s.tipos = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.listarAlmacen = function () {
                    h.post(contextPath + '/common/listaralmacen', s.agencia)
                            .success(function (data) {
                                s.almacenes = data;
                                s.andamios = [];
                                h.post(contextPath + '/common/listarandamio', s.almacenes[0])
                                        .success(function (data) {
                                            s.andamios = data;
                                        })
                                        .error(function (error, status) {
                                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                                        });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.buscarProductoPorCodigo = function (request, response) {
                    h.post(contextPath + '/almacen/administracion/buscarproducto', {id: 1, codigo: s.producto.codigo})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].codigo;
                                }
                                return response(data);
                            });
                };

                s.buscarProductoPorNombre = function (request, response) {
                    h.post(contextPath + '/almacen/administracion/buscarproducto', {id: 2, nombre: s.producto.nombre})
                            .success(function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    data[i].label = data[i].nombre;
                                }
                                return response(data);
                            });
                };

                s.seleccion = function (data) {
                    s.$apply(function () {
                        s.producto = data;
                        delete s.producto.label;
                        delete s.producto.value;

                        s.inventarios = [];
                        h.post(contextPath + '/almacen/administracion/buscarinv', {producto: s.producto, agencia: s.agencia})
                                .success(function (data) {
                                    s.inventarios = data;

                                    s.inventarios.forEach(function (val, i) {
                                        var unidamedida = (s.unidadmedidas.filter(function (nick) {
                                            return nick.id === val.producto.idtunidadmedida;
                                        }))[0];
                                        val.abreviatura = unidamedida.abreviatura;
                                        val.nabreviatura = unidamedida.nombre;
                                    });
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    });
                };

                s.agregarInventario = function () {
                    var item = {id: 0, producto: s.producto, andamio: s.andamios[0], cantidad: 0, preciomenmin: 0.0, preciomenmax: 0.0, preciomaymin: 0.0, preciomaymax: 0.0, estado: true, idusuariocrea: s.user.id, fechusuariocrea: new Date(), modif: true};

                    var unidamedida = (s.unidadmedidas.filter(function (nick) {
                        return nick.id === item.producto.idtunidadmedida;
                    }))[0];
                    item.abreviatura = unidamedida.abreviatura;
                    item.nabreviatura = unidamedida.nombre;

                    s.inventarios.push(item);
                };

                s.quitarInventario = function (inv) {
                    s.index = s.inventarios.indexOf(inv);
                    s.inventarios.splice(s.index, 1);
                };

                s.seleccionarInventario = function (inv) {
                    s.index = s.inventarios.indexOf(inv);
                    s.inventarios.forEach(function (val, i) {
                        if (i === s.index) {
                            val.modif = true;
                        } else {
                            val.modif = false;
                        }
                    });
                };

                s.cancelarInventario = function () {
                    s.inventarios.forEach(function (val, i) {
                        val.modif = false;
                    });
                };

                s.listarAndamio2 = function (alm, inv) {
                    s.andamios = [];
                    h.post(contextPath + '/common/listarandamio', alm)
                            .success(function (data) {
                                s.andamios = data;
                                inv.andamio = s.andamios[0];
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.registrarInventario = function (inv) {
                    s.index = s.inventarios.indexOf(inv);
                    inv.producto = s.producto;

                    delete inv.modif;
                    delete inv.abreviatura;
                    delete inv.nabreviatura;

                    if (Object.keys(inv.producto).length > 0) {
                        if (inv.id === 0) {
                            inv.idusuariocrea = s.user.id;
                            inv.fechusuariocrea = new Date();
                            h.post(contextPath + '/almacen/administracion/registrarinv', inv)
                                    .success(function (data) {
                                        s.inventarios.splice(s.index, 1);
                                        if (data !== null) {
                                            n.notificar('Notificacion', 'success', 'Se ha registrado correctamente');

                                            var unidamedida = (s.unidadmedidas.filter(function (nick) {
                                                return nick.id === data.producto.idtunidadmedida;
                                            }))[0];
                                            data.abreviatura = unidamedida.abreviatura;
                                            data.nabreviatura = unidamedida.nombre;
                                            data.modif = false;
                                            s.inventarios.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error, no pudo ser registrado');
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    });
                        } else {
                            inv.idusuariomod = s.user.id;
                            inv.fechusuariomod = new Date();
                            h.post(contextPath + '/almacen/administracion/actualizarinv', inv)
                                    .success(function (data) {
                                        if (data !== null) {
                                            n.notificar('Notificacion', 'success', 'Se ha actualizado correctamente');
                                            s.inventarios.splice(s.index, 1);

                                            var unidamedida = (s.unidadmedidas.filter(function (nick) {
                                                return nick.id === data.producto.idtunidadmedida;
                                            }))[0];
                                            data.abreviatura = unidamedida.abreviatura;
                                            data.nabreviatura = unidamedida.nombre;
                                            data.modif = false;
                                            s.inventarios.push(data);
                                        } else {
                                            n.notificar('Notificacion', 'error', 'Error, ocurrio un problema al actualizar');
                                            h.post(contextPath + '/almacen/administracion/obtenerinv', inv.id)
                                                    .success(function (data) {
                                                        console.log(data);
                                                        s.inventarios[s.index] = data;
                                                    });
                                        }
                                    })
                                    .error(function (error, status) {
                                        n.notificar('Notificacion', 'error', 'Error: ' + status);
                                    });
                        }
                    } else {
                        n.notificar('Notificacion', 'info', 'Error, no ha seleccionado ningun PRODUCTO');
                    }
                };

                s.eliminarInventario = function (inv) {
                    if (confirm('¿Esta seguro que desea eliminar este item?')) {
                        s.index = s.inventarios.indexOf(inv);
                        delete inv.modif;
                        delete inv.abreviatura;
                        delete inv.nabreviatura;

                        h.post(contextPath + '/almacen/administracion/eliminarinv', inv)
                                .success(function (data) {
                                    if (data !== 0) {
                                        n.notificar('Notificacion', 'success', 'Se ha eliminado correctamente');
                                        s.inventarios.splice(s.index, 1);
                                    } else {
                                        n.notificar('Notificacion', 'error', 'Error, para eliminar del inventario se debe tener CANTIDAD CERO');
                                    }
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

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
        .controller('detalleinventarioController', ['$scope', '$http', '$timeout', 'localStorageService', 'notify', function (s, h, t, ls, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.inventarios = [];

                s.index = -1;
                s.producto = ls.get('producto');
                s.mensaje = 'Ya hay un objeto pendiente de modificar';

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/producto/detalleinventario', ls.get('producto'))
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                var obj = JSON.parse(value);
                                obj.estadomodificacion = false;
                                s.inventarios.push(obj);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.mostrar = function (inv) {
                    if (s.index < 0) {
                        s.index = s.inventarios.indexOf(inv);
                        inv.estadomodificacion = true;
                    } else {
                        s.mostrarmensaje = true;
                        t(function () {
                            s.mostrarmensaje = false;
                        }, 6000);
                    }
                };

                s.modificarprecio = function (inv) {
                    h.post(contextPath + '/producto/actualizari', {id: inv.id, producto: inv.producto, andamio: inv.andamio, idcompra: inv.idcompra, cantidad: inv.cantidad, cantidadact: inv.cantidadact, precio: inv.precio, estado: inv.estado, idusuariocrea: inv.idusuariocrea, fechusuariocrea: inv.fechusuariocrea, idusuariomod: inv.idusuariomod, fechusuariomod: inv.fechusuariomod})
                            .success(function (data) {
                                data.estadomodificacion = false;

                                s.inventarios.splice(s.index, 1);
                                s.inventarios.push(data);

                                s.index = -1;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

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
        .controller('mermaController', ['$scope', '$http', '$timeout', 'localStorageService', 'notify', function (s, h, t, ls, n) {
                s.user = {};

                s.meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                s.dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

                s.categorias = [];
                s.unidadmedidas = [];
                s.marcas = [];

                s.inventarios = [];

                s.producto = {};

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarcategoria')
                        .success(function (data) {
                            s.categorias.push({id: 0, denominacion: 'TODOS'});
                            $.each(data, function (index, value) {
                                s.categorias.push(JSON.parse(value));
                            });
                            s.producto.categoria = s.categorias[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarmarca')
                        .success(function (data) {
                            s.marcas.push({id: 0, denominacion: 'TODOS'});
                            $.each(data, function (index, value) {
                                s.marcas.push(JSON.parse(value));
                            });
                            s.producto.marca = s.marcas[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarunidadmedida')
                        .success(function (data) {
                            s.unidadmedidas.push({id: 0, denominacion: 'TODOS'});
                            $.each(data, function (index, value) {
                                s.unidadmedidas.push(JSON.parse(value));
                            });
                            s.producto.unidadmedida = s.unidadmedidas[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.validatep = {
                    rules: {
                        categoria: {
                            required: true
                        },
                        marca: {
                            required: true
                        },
                        unidadmedida: {
                            required: true
                        }
                    },
                    messages: {
                        categoria: {
                            required: 'Campo obligatorio'
                        },
                        marca: {
                            required: 'Campo obligatorio'
                        },
                        unidadmedida: {
                            required: 'Campo obligatorio'
                        }
                    }
                };

                s.buscarp = function (form, id) {
                    s.inventarios = [];
                    if (form.validate()) {
                        s.producto.id = id;
                        h.post(contextPath + '/producto/inventario', s.producto)
                                .success(function (data) {
                                    $.each(data, function (index, value) {
                                        s.inventarios.push(JSON.parse(value));
                                    });
                                })
                                .error(function (error, status) {
                                    n.notificar('Notificacion', 'error', 'Error: ' + status);
                                });
                    }
                };

                s.detalleInventario = function (p) {
                    ls.set('producto', p);

                    window.location.href = contextPath + '/producto/detalleinventario';
                };

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