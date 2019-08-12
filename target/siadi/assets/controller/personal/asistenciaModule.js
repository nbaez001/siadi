angular.module('asistenciaModule', ['ngValidate', 'dirPagination', 'components', 'ui.calendar'])
        .controller('semanalController', ['$scope', '$http', '$timeout', 'notify', function (s, h, t, n) {
                s.user = {};
                s.agencia = {};

                s.contrato = {colaborador: {}};

                s.disDni = true;
                s.disNombre = true;
                s.disApellidopat = true;
                s.disApellidomat = true;

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
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

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
        .controller('mensualController', ['$scope', '$http', '$timeout', '$compile', 'notify', 'uiCalendarConfig', function (s, h, t, c, n, uic) {
                s.user = {};
                s.agencia = {};

                s.contrato = {colaborador: {}};

                s.disDni = true;
                s.disNombre = true;
                s.disApellidopat = true;
                s.disApellidomat = true;

                s.events = [];

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
                        })
                        .error(function (error, status) {
                            n.notificar('Notificacion', 'error', 'Error: ' + status);
                        });

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

                    s.cargarAsistencia(data);
                };


                s.cargarAsistencia = function (c) {
                    h.post(contextPath + '/personal/colaborador/obtenerultimoc', c)
                            .success(function (data) {
                                s.contrato = data;
                                s.contrato.fecha = new Date();
                                h.post(contextPath + '/personal/asistencia/mensual', s.contrato)
                                        .success(function (data) {
                                            s.events.splice(0, s.events.length);

                                            data.forEach(function (val, i) {
                                                s.addEvent(val.titulo, new Date(val.sAnio, val.sMes, val.sDia, val.sHora, val.sMin), new Date(val.eAnio, val.eMes, val.eDia, val.eHora, val.eMin), false, val.color, val.url);
                                            });
                                        });
                            });
                };
                //INICIO DE DATOS CALENDAR
                s.eventSource = [{title: 'Lunch', start: new Date(2018, 7, 17, 12, 0), end: new Date(2018, 7, 17, 16, 0), allDay: false}];
                s.events = [];
                s.eventsF = function (start, end, timezone, callback) {
                    var s = new Date(start).getTime() / 1000;
                    var e = new Date(end).getTime() / 1000;
                    var m = new Date(start).getMonth();
                    var events = [{title: 'Feed Me ' + m, start: s + (50000), end: s + (100000), allDay: false, className: ['customFeed']}];
                    callback(events);
                };

                s.calEventsExt = {
                    color: '#f00',
                    textColor: 'yellow',
                    events: [{title: 'Lunch', start: new Date(2018, 7, 17, 12, 0), end: new Date(2018, 7, 17, 16, 0), allDay: false}]
                };
                /* event source that calls a function on every view switch */

                /* alert on eventClick */
                s.alertOnEventClick = function (date, jsEvent, view) {
                    console.log('Hola');
                };
                /* alert on Drop */
                s.alertOnDrop = function (event, delta, revertFunc, jsEvent, ui, view) {
                    s.alertMessage = ('Event Dropped to make dayDelta ' + delta);
                };
                /* alert on Resize */
                s.alertOnResize = function (event, delta, revertFunc, jsEvent, ui, view) {
                    s.alertMessage = ('Event Resized to make dayDelta ' + delta);
                };
                /* add and removes an event source of choice */
                s.addRemoveEventSource = function (sources, source) {
                    var canAdd = 0;
                    angular.forEach(sources, function (value, key) {
                        if (sources[key] === source) {
                            sources.splice(key, 1);
                            canAdd = 1;
                        }
                    });
                    if (canAdd === 0) {
                        sources.push(source);
                    }
                };
                /* add custom event*/
                s.addEvent = function (titulo, inicio, fin, allDay, color, url) {
                    s.events.push({
                        title: titulo,
                        start: inicio,
                        end: fin,
                        allDay: allDay,
                        color: color,
                        url: url
                    });
                };
                /* remove event */

                s.remove = function (index) {
                    s.events.splice(index, 1);
                };
                /* Change View */
                s.changeView = function (view, calendar) {
                    uic.calendars[calendar].fullCalendar('changeView', view);
                    console.log(view);
                    console.log(calendar);
                };
                /* Change View */
                s.renderCalendar = function (calendar) {
                    t(function () {
                        if (uic.calendars[calendar]) {
                            uic.calendars[calendar].fullCalendar('render');
                        }
                    });
                };
                /* Render Tooltip */
                s.eventRender = function (event, element, view) {
                    element.attr({'tooltip': event.title, 'tooltip-append-to-body': true});
                    c(element)(s);
                };
                /* config object */
                s.uiConfig = {calendar: {height: 570, editable: true, header: {left: 'title', center: '', right: 'today prev,next'}, eventClick: s.alertOnEventClick, eventDrop: s.alertOnDrop, eventResize: s.alertOnResize, eventRender: s.eventRender}};
                s.uiConfig.calendar.monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                s.uiConfig.calendar.dayNames = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"];
                s.uiConfig.calendar.dayNamesShort = ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"];
                /* event sources array*/
                s.eventSources = [s.events, s.eventSource, s.eventsF];


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