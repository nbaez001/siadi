angular.module("homeModule", ['components', 'LocalStorageModule', 'dirPagination'])
        .controller("homeController", ["$scope", "$http", 'notify', function (s, h, n) {
                s.agencia = {};

                s.inventarios = [];

                h.post(contextPath + '/sessionagencia')
                        .success(function (data) {
                            s.agencia = data;
                            s.listarInventario();
                            s.listarUsuario();
                            s.listarAlmacen();
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });


                s.listarInventario = function () {
                    h.post(contextPath + '/common/listarinventario', s.agencia)
                            .success(function (data) {
                                s.inventarios = data;
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };

                s.listarUsuario = function () {
                    h.post(contextPath + '/common/listarusuario', s.agencia)
                            .success(function (data) {
                                s.usuarios = data;

                                s.last = s.usuarios[0];
                                s.usuarios.forEach(function (val, i) {
                                    if (val.fechusuariocrea > s.last.fechusuariocrea) {
                                        s.last = val;
                                    }
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
                s.listarAlmacen = function () {
                    h.post(contextPath + '/common/listaralmacen', s.agencia)
                            .success(function (data) {
                                s.almacenes = data;
                                s.lasta = s.almacenes[0];
                                s.almacenes.forEach(function (val, i) {
                                    if (val.fechusuariocrea > s.lasta.fechusuariocrea) {
                                        s.lasta = val;
                                    }
                                });
                            })
                            .error(function (error, status) {
                                n.notificar('Notificacion', 'error', 'Error: ' + status);
                            });
                };
            }
        ]);

        