<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="colaboradorModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro contrato</title>
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
    <body class="nav-md" ng-controller="contratoController" ng-cloak="">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Registrar contrato</h2>
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
                                    <form name="formulario" ng-validate="validatec">
                                        <div class="row">
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
                                                <div class="col-ss-12 col-xs-12 error-message" ng-show="showmensaje">
                                                    {{mensaje}}
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="row">
                                            <fieldset>
                                                <legend>Datos de contrato</legend>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Dependencia <span class="span-salmon">(*)</span></label>
                                                    <select ng-options="dependencia as dependencia.nombre for dependencia in dependencias track by dependencia.id" ng-model="contrato.dependencia" name="dependencia" class="form-control input-sm"></select>
                                                </div>
                                                <div class="col-ss-12 col-xs-5 col-sm-3">
                                                    <label>Tipo cargo <span class="span-salmon">(*)</span></label>
                                                    <select ng-options="tipocargo as tipocargo.nombre for tipocargo in tipocargos track by tipocargo.id" ng-model="contrato.idttipocargo" name="idttipocargo" class="form-control input-sm"></select>
                                                </div>
                                                <div class="col-ss-12 col-xs-1 col-sm-1">
                                                    <label><text class="hidden-xs hidden-sm hidden-md hidden-lg">Jefe de area<text></label>
                                                    <div class="checkbox checkbox-success" style="margin-bottom: 0px">
                                                        <input ng-model="contrato.esjefearea" id="esjefearea" type="checkbox" title="Confirmar para jefes de area">
                                                        <label for="esjefearea" title="Confirmar para jefes de area">
                                                            <text class="hidden-ss">(Jefe)</text><text class="hidden-xs hidden-sm hidden-md hidden-lg">(Jefe de area)</text>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Tipo empleado <span class="span-salmon">(*)</span></label>
                                                    <select ng-options="tipoempleado as tipoempleado.nombre for tipoempleado in tipoempleados track by tipoempleado.id" ng-model="contrato.idttipoempleado" name="idttipoempleado" class="form-control input-sm"></select>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Fecha inicio <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="contrato.fechainicio" name="fechainicio" type="text" class="form-control input-sm" placeholder="FECHA INICIO CONTRATO">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Fecha fin <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="contrato.fechafin" name="fechafin" type="text" class="form-control input-sm" placeholder="FECHA FIN CONTRATO">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Sueldo <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="contrato.sueldo" name="sueldo" type="number" class="form-control input-sm" placeholder="SUELDO">
                                                </div>
                                            </fieldset>
                                        </div>
                                    </form>
                                    <form name="formulariot" ng-submit="agregart(formulariot)" ng-validate="validatet">
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
                                                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                        <label>Turno <span class="span-salmon">(*)</span></label>
                                                                        <select ng-options="tipoturno as tipoturno.nombre for tipoturno in tipoturnos track by tipoturno.id" ng-model="turno.idttipoturno" name="idttipoturno" class="form-control input-sm"></select>
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                        <label>Dia <span class="span-salmon">(*)</span></label>
                                                                        <select ng-options="tipodia as tipodia.nombre for tipodia in tipodias track by tipodia.id" ng-model="turno.dia" name="dia" class="form-control input-sm"></select>
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                        <label>Hora entrada <span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="turno.horaentrada" name="horaentrada" type="time" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                        <label>Fecha salida <span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="turno.horasalida" name="horasalida" type="time" class="form-control input-sm">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                                <button class="btn btn-success btn-xs" type="submit">Agregar</button>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12">
                                                                <table class="table table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>N°</th>
                                                                            <th>Turno</th>
                                                                            <th>Dia</th>
                                                                            <th>Hora entrada</th>
                                                                            <th>Hora salida</th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="listaturno.length > 0" ng-repeat="turno in listaturno">
                                                                            <td>{{$index + 1}}</td>
                                                                            <td>{{turno.idttipoturno.nombre}}</td>
                                                                            <td>{{turno.dia.nombre}}</td>
                                                                            <td>{{turno.horaentrada|date :'HH:mm a'}}</td>
                                                                            <td>{{turno.horasalida|date :'HH:mm a'}}</td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="quitart(turno)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="listaturno.length <= 0">
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
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <button ng-click="registrarc(formulario)" class="btn btn-primary input-sm" type="button">Registrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <div class="profile_title">
                                        <div class="col-ss-12 col-xs-4">
                                            <h2>Registro contratos</h2>
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
                                                        <th ng-click="sort('codigo')">Contrato
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'codigo'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('dependencia.nombre')">Dependencia
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'dependencia.nombre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('colaborador.nombre')">Colaborador
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.nombre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('colaborador.dni')">Dni
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.dni'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('idttipocargo.nombre')">Cargo
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'idttipocargo.nombre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('idttipoempleado.nombre')">Tipo
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'idttipoempleado.nombre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('sueldo')">Sueldo
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'sueldo'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('fechainicio')">Fecha inicio
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fechainicio'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('fechafin')">Fecha fin
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fechafin'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="contratos.length > 0" dir-paginate="contrato in contratos|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="lc">
                                                        <td>{{$index + 1}}</td>
                                                        <td>{{contrato.codigo}}</td>
                                                        <td>{{contrato.dependencia.nombre}}</td>
                                                        <td>{{contrato.colaborador.nombre}} {{contrato.colaborador.apellidopat}} {{contrato.colaborador.apellidomat}}</td>
                                                        <td>{{contrato.colaborador.dni}}</td>
                                                        <td>{{contrato.idttipocargo.nombre}}</td>
                                                        <td>{{contrato.idttipoempleado.nombre}}</td>
                                                        <td>{{contrato.sueldo|currency:'S/.'}}</td>
                                                        <td>{{contrato.fechainicio}}</td>
                                                        <td>{{contrato.fechafin}}</td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostrarc(contrato)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="eliminarc(contrato)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="contratos.length <= 0">
                                                        <td colspan="12">No se encontró ningun registro</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="text-align: right">
                                            <dir-pagination-controls
                                                max-size="5"
                                                direction-links="true"
                                                boundary-links="true"
                                                pagination-id="lc">
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
        <div id="modalContrato" class="modal fade" role="dialog">
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
                                                            <label>Dia <span class="span-salmon">(*)</span></label>
                                                            <select ng-options="tipodia as tipodia.nombre for tipodia in tipodias track by tipodia.id" ng-model="turnoa.dia" name="dia" class="form-control input-sm"></select>
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
                                                                <th>Dia</th>
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
                                                                <td>{{turno.dia.nombre}}</td>
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
                                                                <td colspan="7">No hay ningun registro</td>
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/personal/colaboradorModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    $('form[name=formulario] input[name=fechainicio]').datepicker({dateFormat: 'yy-mm-dd'});
                                    $('form[name=formulario] input[name=fechafin]').datepicker({dateFormat: 'yy-mm-dd'});
                                    $('form[name=formularioca] input[name=fechainicio]').datepicker({dateFormat: 'yy-mm-dd'});
                                    $('form[name=formularioca] input[name=fechafin]').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>
