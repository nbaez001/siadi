<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="asistenciaModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Control</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/calendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/calendar/fullcalendar.print.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';</script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/calendar/moment.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/calendar/fullcalendar.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="controlController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Control de asistencia <small>(por mes)</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="row" style="margin-bottom: 15px">
                                        <fieldset>
                                            <div class="col-ss-12 col-xs-4 col-sm-2">
                                                <label>Dni <span class="span-salmon">(*)</span></label>
                                                <div class="form-group">
                                                    <span class="input-icon">
                                                        <input ng-model="contrato.colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI" ng-disabled="disDni" auto-complete="buscarColDni">
                                                        <i class="fa fa-search searchg" ng-click="disDni = !disDni"  style="line-height:28px"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-8 col-sm-4">
                                                <label>Nombre <span class="span-salmon">(*)</span></label>
                                                <div class="form-group">
                                                    <span class="input-icon">
                                                        <input ng-model="contrato.colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" ng-disabled="disNombre" auto-complete="buscarColNombre" uppercased>
                                                        <i class="fa fa-search searchg" ng-click="disNombre = !disNombre"  style="line-height:28px"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                                <div class="form-group">
                                                    <span class="input-icon">
                                                        <input ng-model="contrato.colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" ng-disabled="disApellidopat" auto-complete="buscarColNombre" uppercased>
                                                        <i class="fa fa-search searchg" ng-click="disApellidopat = !disApellidopat"  style="line-height:28px"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                                <div class="form-group">
                                                    <span class="input-icon">
                                                        <input ng-model="contrato.colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" ng-disabled="disApellidomat" auto-complete="buscarColNombre" uppercased>
                                                        <i class="fa fa-search searchg" ng-click="disApellidomat = !disApellidomat"  style="line-height:28px"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div id='calendar'></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>

                <!-- Start Calender modal -->
                <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">New Calender Entry</h4>
                            </div>
                            <div class="modal-body">
                                <div id="testmodal" style="padding: 5px 20px;">
                                    <form id="antoform" class="form-horizontal calender" role="form">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="title" name="title">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Description</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" style="height:55px;" id="descr" name="descr"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary antosubmit">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel2">Edit Calender Entry</h4>
                            </div>
                            <div class="modal-body">

                                <div id="testmodal2" style="padding: 5px 20px;">
                                    <form id="antoform2" class="form-horizontal calender" role="form">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="title2" name="title2">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Description</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" style="height:55px;" id="descr2" name="descr"></textarea>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary antosubmit2">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
                <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>

                <!-- End Calender modal -->
            </div>
        </div>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/personal/asistenciaModule.js" type="text/javascript"></script>

        <script>
                                                                    $(window).load(function () {

                                                                        var date = new Date();
                                                                        var d = date.getDate();
                                                                        var m = date.getMonth();
                                                                        var y = date.getFullYear();
                                                                        var started;
                                                                        var categoryClass;

                                                                        var calendar = $('#calendar').fullCalendar({
                                                                            header: {
                                                                                left: 'prev,next today',
                                                                                center: 'title',
                                                                                right: 'month,agendaWeek,agendaDay'
                                                                            },
                                                                            selectable: true,
                                                                            selectHelper: true,
                                                                            select: function (start, end, allDay) {
                                                                                $('#fc_create').click();

                                                                                started = start;
                                                                                ended = end

                                                                                $(".antosubmit").on("click", function () {
                                                                                    var title = $("#title").val();
                                                                                    if (end) {
                                                                                        ended = end
                                                                                    }
                                                                                    categoryClass = $("#event_type").val();

                                                                                    if (title) {
                                                                                        calendar.fullCalendar('renderEvent', {
                                                                                            title: title,
                                                                                            start: started,
                                                                                            end: end,
                                                                                            allDay: allDay
                                                                                        },
                                                                                        true // make the event "stick"
                                                                                                );
                                                                                    }
                                                                                    $('#title').val('');
                                                                                    calendar.fullCalendar('unselect');

                                                                                    $('.antoclose').click();

                                                                                    return false;
                                                                                });
                                                                            },
                                                                            eventClick: function (calEvent, jsEvent, view) {
                                                                                //alert(calEvent.title, jsEvent, view);

                                                                                $('#fc_edit').click();
                                                                                $('#title2').val(calEvent.title);
                                                                                categoryClass = $("#event_type").val();

                                                                                $(".antosubmit2").on("click", function () {
                                                                                    calEvent.title = $("#title2").val();

                                                                                    calendar.fullCalendar('updateEvent', calEvent);
                                                                                    $('.antoclose2').click();
                                                                                });
                                                                                calendar.fullCalendar('unselect');
                                                                            },
                                                                            editable: true,
                                                                            events: [
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 15, 7, 55),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 14, 7, 58),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 13, 8, 02),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 12, 7, 50),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 11, 7, 52),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 10, 7, 55),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 9, 7, 58),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 8, 8, 0),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 7, 8, 01),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 6, 7, 50),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 5, 7, 59),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 4, 7, 50),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 3, 8, 02),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 2, 8, 01),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d - 1, 7, 50),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Asistio',
                                                                                    start: new Date(y, m, d, 7, 59),
                                                                                    allDay: false
                                                                                },
                                                                                {
                                                                                    title: 'Permiso',
                                                                                    start: new Date(y, m, d + 5, 8, 0),
                                                                                    end: new Date(y, m, d + 5, 17, 30),
                                                                                    allDay: false
                                                                                }
                                                                            ]
                                                                        });
                                                                    });
        </script>
    </body>
</html>