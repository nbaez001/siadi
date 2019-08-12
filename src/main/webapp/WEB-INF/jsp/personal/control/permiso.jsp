<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="controlModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro permiso</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/build.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="permisoController" ng-cloak="">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Papeleta de salida</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" ><i class="fa fa-wrench"></i></a>
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
                                    <form name="formulario" ng-submit="registrarp(formulario)" ng-validate="validatep">
                                        <div class="row">
                                            <fieldset>
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Codigo contrato <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="permiso.contrato.codigo" name="codigo" class="form-control input-sm" placeholder="CODIGO CONTRATO" disabled="">
                                                </div>
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Tipo permiso <span class="span-salmon">(*)</span></label>
                                                    <select ng-options="tipopermiso as tipopermiso.nombre for tipopermiso in tipopermisos track by tipopermiso.id" ng-model="permiso.idttipopermiso" name="idttipopermiso" class="form-control input-sm"></select>
                                                </div>
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Fecha <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="permiso.fecha" name="fecha" type="text" class="form-control input-sm" placeholder="FECHA">
                                                </div>
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Lugar de destino <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="permiso.destino" name="destino" class="form-control input-sm" type="text" placeholder="DESTINO" uppercased>
                                                </div>
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Hora salida <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="permiso.horasalida" name="horasalida" type="time" class="form-control input-sm">
                                                </div>
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Fecha retorno <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="permiso.horaretorno" name="horaretorno" type="time" class="form-control input-sm">
                                                </div>
                                                <div class="col-ss-12 col-xs-12 col-sm-6">
                                                    <label>Descripcion</label>
                                                    <textarea ng-model="permiso.descripcion" name="descripcion" class="form-control input-sm" placeholder="ASUNTO A TRATAR" rows="3" uppercased></textarea>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 btn-col">
                                                    <button class="btn btn-primary input-sm" type="submit">Registrar</button>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12 btn-col error-message" ng-show="showmensaje">
                                                {{mensaje}}
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <div class="profile_title">
                                        <div class="col-ss-12 col-xs-4">
                                            <h2>Registro permisos</h2>
                                        </div>
                                        <div class="col-ss-12 col-xs-8">
                                            <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                <span style="color: #73879C">{{fecha}}</span><b class="caret"></b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="row" style="padding-top: 15px">
                                        <div class="col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                            <label>Buscar</label>
                                            <input type="text" ng-model="buscar" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                        </div>
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th ng-click="sort('id')">N°
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('idttipopermiso')">Tipo permiso
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'idttipopermiso'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('fecha')">Fecha
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fecha'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('horasalida')">Hora salida
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'horasalida'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('horaretorno')">Hora retorno
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'horaretorno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('destino')">Destino
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'destino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('autorizja')">Autorizacion J.A.
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'autorizja'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('autorizjp')">Autorizacion J.P.
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'autorizjp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="permisos.length > 0" dir-paginate="permiso in permisos|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="lp">
                                                        <td>{{$index + 1}}</td>
                                                        <td>{{permiso.idttipopermiso.nombre}}</td>
                                                        <td>{{permiso.fecha|date :'dd MMM yyyy'}}</td>
                                                        <td>{{permiso.horasalida|date :'HH:mm a'}}</td>
                                                        <td>{{permiso.horaretorno|date:'HH:mm a'}}</td>
                                                        <td>{{permiso.destino}}</td>
                                                        <td><text ng-show="permiso.autorizja == 1" style="color: blue; font-weight: bold">AUTORIZADO</text><text ng-show="permiso.autorizja == -1" style="color: red; font-weight: bold">NO AUTORIZADO</text><text ng-show="permiso.autorizja == 0" style="color: burlywood; font-weight: bold">PENDIENTE</text></td>
                                                        <td><text ng-show="permiso.autorizjp == 1" style="color: blue; font-weight: bold">AUTORIZADO</text><text ng-show="permiso.autorizjp == -1" style="color: red; font-weight: bold">NO AUTORIZADO</text><text ng-show="permiso.autorizjp == 0" style="color: burlywood; font-weight: bold">PENDIENTE</text></td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-show="permiso.autorizja == 0 && permiso.autorizjp == 0" ng-click="mostrarp(permiso)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-show="permiso.autorizja == 0 && permiso.autorizjp == 0" ng-click="eliminarp(permiso)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                            <a href="${pageContext.request.contextPath}/personal/control/papeletasalida?type=pdf&&id={{permiso.id}}" target="_blank" ng-show="permiso.autorizja == 1 && permiso.autorizjp == 1" style="color: blueviolet"><i class="fa fa-print"></i> Print.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="permisos.length <= 0">
                                                        <td colspan="10">No se encontró ningun registro</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="text-align: right">
                                            <dir-pagination-controls
                                                max-size="5"
                                                direction-links="true"
                                                boundary-links="true"
                                                pagination-id="lp">
                                            </dir-pagination-controls>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>
        <div id="modalPermiso" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modificar contrato</h4>
                    </div>
                    <div class="modal-body">
                        <form name="formularioca" ng-validate="validatec">
                            <div class="row">
                                <fieldset>
                                    <div class="col-ss-12 col-xs-4 col-sm-2">
                                        <label>Dni</label>
                                        <input ng-model="contratoa.colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI" disabled="">
                                    </div>
                                    <div class="col-ss-12 col-xs-8 col-sm-4">
                                        <label>Nombre</label>
                                        <input ng-model="contratoa.colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" disabled="">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido paterno</label>
                                        <input ng-model="contratoa.colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" disabled="">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido materno</label>
                                        <input ng-model="contratoa.colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" disabled="">
                                    </div>
                                </fieldset>
                            </div>
                            <div class="row">
                                <fieldset>
                                    <legend>Datos de contrato</legend>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Dependencia <span class="span-salmon">(*)</span></label>
                                        <select ng-options="dependencia as dependencia.nombre for dependencia in dependencias track by dependencia.id" ng-model="contratoa.dependencia" name="dependencia" class="form-control input-sm"></select>
                                    </div>
                                    <div class="col-ss-12 col-xs-5 col-sm-3">
                                        <label>Tipo cargo <span class="span-salmon">(*)</span></label>
                                        <select ng-options="tipocargo as tipocargo.nombre for tipocargo in tipocargos track by tipocargo.id" ng-model="contratoa.idttipocargo" name="idttipocargo" class="form-control input-sm"></select>
                                    </div>
                                    <div class="col-ss-12 col-xs-1 col-sm-1">
                                        <label><text>Jefe<text></label>
                                        <div class="checkbox checkbox-success" style="margin-bottom: 0px; margin-top: 5px">
                                            <input ng-model="contratoa.esjefearea" id="esjefearea" type="checkbox" title="Confirmar para jefes de area">
                                            <label for="esjefearea" title="Confirmar para jefes de area">
                                                <text class="hidden-xs hidden-sm hidden-md hidden-lg">(Jefe de area)</text>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Tipo empleado <span class="span-salmon">(*)</span></label>
                                        <select ng-options="tipoempleado as tipoempleado.nombre for tipoempleado in tipoempleados track by tipoempleado.id" ng-model="contratoa.idttipoempleado" name="idttipoempleado" class="form-control input-sm"></select>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Fecha inicio <span class="span-salmon">(*)</span></label>
                                        <input ng-model="contratoa.fechainicio" name="fechainicio" type="text" class="form-control input-sm" placeholder="FECHA INICIO CONTRATO">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Fecha fin <span class="span-salmon">(*)</span></label>
                                        <input ng-model="contratoa.fechafin" name="fechafin" type="text" class="form-control input-sm" placeholder="FECHA FIN CONTRATO">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Sueldo <span class="span-salmon">(*)</span></label>
                                        <input ng-model="contratoa.sueldo" name="sueldo" type="number" class="form-control input-sm" placeholder="SUELDO">
                                    </div>
                                </fieldset>
                            </div>
                        </form>
                        <form name="formulariota" ng-submit="registrart(formulariota)" ng-validate="validatet">
                            <div class="row">
                                <div class="col-ss-12 col-xs-12 btn-col">
                                    <div class="panel panel-warning">
                                        <div class="panel-heading">
                                            Horario
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-12">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Turno <span class="span-salmon">(*)</span></label>
                                                            <select ng-options="tipoturno as tipoturno.nombre for tipoturno in tipoturnos track by tipoturno.id" ng-model="turnoa.idttipoturno" name="idttipoturno" class="form-control input-sm"></select>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Hora entrada <span class="span-salmon">(*)</span></label>
                                                            <input ng-model="turnoa.horaentrada" name="horaentrada" type="time" class="form-control input-sm">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6 col-sm-4">
                                                            <label>Fecha salida <span class="span-salmon">(*)</span></label>
                                                            <input ng-model="turnoa.horasalida" name="horasalida" type="time" class="form-control input-sm">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-12 btn-col">
                                                    <button ng-show="regturno" class="btn btn-success btn-xs" type="submit">Agregar</button>
                                                    <button ng-show="!regturno" ng-click="actualizart(formulariota)" class="btn btn-warning btn-xs" type="button">Actualizar</button>
                                                </div>
                                                <div class="col-ss-12 col-xs-12">
                                                    <table class="table table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>N°</th>
                                                                <th>Turno</th>
                                                                <th>Hora entrada</th>
                                                                <th>Hora salida</th>
                                                                <th>Opt.</th>
                                                                <th>Opt.</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-show="listaturnoa.length > 0" ng-repeat="turno in listaturnoa">
                                                                <td>{{$index + 1}}</td>
                                                                <td>{{turno.idttipoturno.nombre}}</td>
                                                                <td>{{turno.horaentrada|date :'HH:mm a'}}</td>
                                                                <td>{{turno.horasalida|date :'HH:mm a'}}</td>
                                                                <td>
                                                                    <a href="javascript:void(0)" ng-click="mostrart(turno)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                                </td>
                                                                <td>
                                                                    <a href="javascript:void(0)" ng-click="eliminart(turno)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                </td>
                                                            </tr>
                                                            <tr ng-show="listaturnoa.length <= 0">
                                                                <td colspan="6">No hay ningun registro</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button ng-click="actualizarc(formularioca)" type="button" class="btn btn-primary input-sm">Actualizar</button>
                        <button type="button" class="btn btn-danger input-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/personal/controlModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    $('form[name=formulario] input[name=fecha]').datepicker({dateFormat: 'yy-mm-dd'});
                                    $('form[name=formulariopa] input[name=fecha]').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>