angular.module('reporteModule', ['ngValidate', 'dirPagination', 'components', 'LocalStorageModule'])
        .controller('resumenmovimientoController', ['$scope', '$http', 'notify', '$timeout', function (s, h, n, t) {
                s.user = {};
                s.anios = [];

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listaraniosinventario')
                        .success(function (data) {
                            s.anios.push({id: 0, anio: 'SELECCIONE AÑO'});
                            data.forEach(function (val, i) {
                                s.anios.push(val);
                            });
                            console.log(s.anios);
                            s.anio = s.anios[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.validate = {
                    rules: {
                        anio: {
                            required: true,
                            min: 1
                        }
                    },
                    messages: {
                        anio: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione un año'
                        }
                    }
                };

                s.redireccionar = function (form, link) {
                    if (form.validate()) {
                        window.open(link, '_blank');
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
        .controller('preformato121Controller', ['$scope', '$http', 'localStorageService', 'notify', '$timeout', function (s, h, ls, n, t) {
                s.user = {};

                s.anios = [];
                s.meses = [
                    {id: -1, nombre: 'SELECCIONE MES'},
                    {id: 0, nombre: 'ENERO'},
                    {id: 1, nombre: 'FEBRERO'},
                    {id: 2, nombre: 'MARZO'},
                    {id: 3, nombre: 'ABRIL'},
                    {id: 4, nombre: 'MAYO'},
                    {id: 5, nombre: 'JUNIO'},
                    {id: 6, nombre: 'JULIO'},
                    {id: 7, nombre: 'AGOSTO'},
                    {id: 8, nombre: 'SEPTIEMBRE'},
                    {id: 9, nombre: 'OCTUBRE'},
                    {id: 10, nombre: 'NOVIEMBRE'},
                    {id: 11, nombre: 'DICIEMBRE'}
                ];

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listaraniosinventario')
                        .success(function (data) {
                            s.anios.push({id: 0, anio: 'SELECCIONE AÑO'});
                            $.each(data, function (index, value) {
                                s.anios.push(value);
                            });
                            s.anio = s.anios[0];
                            s.mes = s.meses[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.validate = {
                    rules: {
                        anio: {
                            required: true,
                            min: 1
                        },
                        mes: {
                            required: true,
                            min: 0
                        }
                    },
                    messages: {
                        anio: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione un año'
                        },
                        mes: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione un mes'
                        }
                    }
                };

                s.generar = function (form) {
                    if (form.validate()) {
                        ls.set('anio', s.anio);
                        ls.set('mes', s.mes);
                        window.open(contextPath + '/almacen/reporte/formato121');
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
        .controller('formato121Controller', ['$scope', '$http', 'localStorageService', 'notify', '$timeout', function (s, h, ls, n, t) {
                s.user = {};

                s.anios = [];
                s.productos = [];
                s.tipos = [];
                s.unidadmedidas = [];

                s.anio = ls.get('anio');
                s.mes = ls.get('mes');

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/sessionagencia')
                        .success(function (data) {
                            s.empresa = data;
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

                h.post(contextPath + '/common/listartipo', {idtabla: 10})
                        .success(function (data) {
                            s.unidadmedidas = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarproducto')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.productos.push(value);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.mostrarDetallemovimiento = function (p) {
                    s.producto = p;
                    s.producto.idttipo = s.tipos.filter(function (item) {
                        return item.id == s.producto.idttipo;
                    })[0];
                    s.producto.idtunidadmedida = s.unidadmedidas.filter(function (item) {
                        return item.id == s.producto.idtunidadmedida;
                    })[0];

                    s.movimientos = [];
                    h.post(contextPath + '/almacen/reporte/formato121', {id: p.id, idusuariocrea: s.anio.anio, idusuariomod: s.mes.id})
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.movimientos.push(JSON.parse(value));
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
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
        .controller('preformato131Controller', ['$scope', '$http', 'localStorageService', 'notify', '$timeout', function (s, h, ls, n, t) {
                s.user = {};

                s.tipos = [];
                s.unidadmedidas = [];
                s.anios = [];
                s.meses = [
                    {id: -1, nombre: 'SELECCIONE MES'},
                    {id: 0, nombre: 'ENERO'},
                    {id: 1, nombre: 'FEBRERO'},
                    {id: 2, nombre: 'MARZO'},
                    {id: 3, nombre: 'ABRIL'},
                    {id: 4, nombre: 'MAYO'},
                    {id: 5, nombre: 'JUNIO'},
                    {id: 6, nombre: 'JULIO'},
                    {id: 7, nombre: 'AGOSTO'},
                    {id: 8, nombre: 'SEPTIEMBRE'},
                    {id: 9, nombre: 'OCTUBRE'},
                    {id: 10, nombre: 'NOVIEMBRE'},
                    {id: 11, nombre: 'DICIEMBRE'}
                ];

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listaraniosinventario')
                        .success(function (data) {
                            s.anios.push({id: 0, anio: 'SELECCIONE AÑO'});
                            $.each(data, function (index, value) {
                                s.anios.push(value);
                            });
                            s.anio = s.anios[0];
                            s.mes = s.meses[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.validate = {
                    rules: {
                        anio: {
                            required: true,
                            min: 1
                        },
                        mes: {
                            required: true,
                            min: 0
                        }
                    },
                    messages: {
                        anio: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione un año'
                        },
                        mes: {
                            required: 'Campo obligatorio',
                            min: 'Seleccione un mes'
                        }
                    }
                };

                s.generar = function (form) {
                    if (form.validate()) {
                        ls.set('anio', s.anio);
                        ls.set('mes', s.mes);
                        window.open(contextPath + '/almacen/reporte/formato131');
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
        .controller('formato131Controller', ['$scope', '$http', 'localStorageService', 'notify', '$timeout', function (s, h, ls, n, t) {
                s.user = {};

                s.anios = [];
                s.productos = [];
                s.tipos=[];
                s.unidadmedidas=[];

                s.anio = ls.get('anio');
                s.mes = ls.get('mes');

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarproducto')
                        .success(function (data) {
                            $.each(data, function (index, value) {
                                s.productos.push(value);
                            });
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/sessionagencia')
                        .success(function (data) {
                            s.empresa = data;
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

                h.post(contextPath + '/common/listartipo', {idtabla: 10})
                        .success(function (data) {
                            s.unidadmedidas = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.mostrarDetallemovimiento = function (p) {
                    s.producto = p;

                    s.producto.idttipo = s.tipos.filter(function (item) {
                        return item.id === s.producto.idttipo;
                    })[0];
                    s.producto.idtunidadmedida = s.unidadmedidas.filter(function (item) {
                        return item.id === s.producto.idtunidadmedida;
                    })[0];

                    s.movimientos = [];
                    h.post(contextPath + '/almacen/reporte/formato131', {id: s.producto.id, idusuariocrea: s.anio.anio, idusuariomod: s.mes.id})
                            .success(function (data) {
                                $.each(data, function (index, value) {
                                    s.movimientos.push(JSON.parse(value));
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
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
        .controller('resumenkardexController', ['$scope', '$http', 'notify', '$timeout', function (s, h, n, t) {
                s.user = {};

                s.categorias = [];
                s.reportes = [];

                h.post(contextPath + '/session')
                        .success(function (data) {
                            s.user = data;
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                h.post(contextPath + '/common/listarcategoria')
                        .success(function (data) {
                            s.categorias.push({id: 0, denominacion: 'TODAS LAS CATEGORIAS'});
                            $.each(data, function (index, value) {
                                s.categorias.push(value);
                            });

                            s.categoria = s.categorias[0];
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

                s.generarReporte = function (form) {
                    s.reportes = [];
                    if (form.validate()) {
                        if (s.categoria.id === 0) {
                            $.each(s.categorias, function (i, val) {
                                if (s.categorias[i].id === 0) {
                                    s.reportes.push({id: s.categorias[i].id, color: 'red', nombre: 'REPORTE KARDEX GENERAL'});
                                } else {
                                    s.reportes.push({id: s.categorias[i].id, color: 'blue', nombre: 'REPORTE KARDEX DE LOS PRODUCTOS DE LA CATEGORIA ' + s.categorias[i].denominacion});
                                }
                            });
                        } else {
                            s.reportes.push({id: s.categoria.id, color: 'blue', nombre: 'REPORTE KARDEX DE LOS PRODUCTOS DE LA CATEGORIA ' + s.categoria.denominacion});
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