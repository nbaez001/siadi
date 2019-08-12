<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="administracionModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gestion de bobeda</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';</script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="body-red nav-md" ng-controller="bobedaController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Administracion de bobeda <i class="fa fa-book"></i></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a href="#"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-ss-12 col-xs-12">
                                        <div class="row">
                                            <div class="left col-ss-12 col-xs-6">
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-sign-out"></i> Bobeda: BOBEDA 1</li>
                                                    <li><i class="fa fa-sign-out"></i> Fecha apertura: 12-12-2012</li>
                                                    <li class="hidden-ss"><i class="fa fa-sign-out"></i> Estado: <text ng-show="true" style="color: blue; font-weight: bold">APERTURADO</text></li>
                                                </ul>
                                            </div>
                                            <div class="left col-ss-12 col-xs-6">
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-sign-out"></i> Tipo de cambio: SOLES</li>
                                                    <li><i class="fa fa-sign-out"></i> Fecha cierre: 12-12-2012</li>
                                                    <li class="hidden-xs hidden-sm hidden-md hidden-lg"><i class="fa fa-sign-out"></i> Estado: <text ng-show="true" style="color: blue; font-weight: bold">APERTURADO</text></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-ss-12 col-xs-12">
                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Detalle saldo por denominacion</a>
                                                </li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-6">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <fieldset>
                                                                        <legend style="font-family: Cambria">Inicio del dia</legend>
                                                                        <div class="row">
                                                                            <div class="col-ss-12 col-xs-12">
                                                                                <table class="table table-striped" id="detallesaldoBobedaInicial">
                                                                                    <thead>
                                                                                        <tr class="headings">
                                                                                            <th>Denominacion</th>
                                                                                            <th>Valor</th>
                                                                                            <th>Cantidad</th>
                                                                                            <th>Total</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>DOS CIENTOS SOLES</td>
                                                                                            <td>200.00</td>
                                                                                            <td>{{bobeda.doscientoss|number:1}}</td>
                                                                                            <td>{{bobeda.doscientoss * 200.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CIEN SOLES</td>
                                                                                            <td>100.00</td>
                                                                                            <td>{{bobeda.ciens|number:1}}</td>
                                                                                            <td>{{bobeda.ciens * 100.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CINCUENTA SOLES</td>
                                                                                            <td>50.00</td>
                                                                                            <td>{{bobeda.cincuentas|number:1}}</td>
                                                                                            <td>{{bobeda.cincuentas * 50.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>VEINTE SOLES</td>
                                                                                            <td>20.00</td>
                                                                                            <td>{{bobeda.veintes|number:1}}</td>
                                                                                            <td>{{bobeda.veintes * 20.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>DIEZ SOLES</td>
                                                                                            <td>10.00</td>
                                                                                            <td>{{bobeda.diezs|number:1}}</td>
                                                                                            <td>{{bobeda.diezs * 10.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CINCO SOLES</td>
                                                                                            <td>5.00</td>
                                                                                            <td>{{bobeda.cincos|number:1}}</td>
                                                                                            <td>{{bobeda.cincos * 5.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>DOS SOLES</td>
                                                                                            <td>2.00</td>
                                                                                            <td>{{bobeda.doss|number:1}}</td>
                                                                                            <td>{{bobeda.doss * 2.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>UN SOL</td>
                                                                                            <td>1.00</td>
                                                                                            <td>{{bobeda.uns|number:1}}</td>
                                                                                            <td>{{bobeda.uns * 1.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CINCUENTA CENTIMOS</td>
                                                                                            <td>0.50</td>
                                                                                            <td>{{bobeda.cincuentac|number:1}}</td>
                                                                                            <td>{{bobeda.cincuentac * 0.50|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>VEINTE CENTIMOS</td>
                                                                                            <td>0.20</td>
                                                                                            <td>{{bobeda.veintec|number:1}}</td>
                                                                                            <td>{{bobeda.veintec * 0.20|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>DIEZ CENTIMOS</td>
                                                                                            <td>0.10</td>
                                                                                            <td>{{bobeda.diezc|number:1}}</td>
                                                                                            <td>{{bobeda.diezc * 0.10|number:2}}</td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-12">
                                                                                <b>Total</b> {{bobeda.montoapertura|currency:'S/. ':2}}
                                                                            </div>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-6">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <fieldset>
                                                                        <legend style="font-family: Cambria">Fin del dia</legend>
                                                                        <div class="row">
                                                                            <div class="col-ss-12 col-xs-12">
                                                                                <table class="table table-striped" id="detallesaldoBobedaInicial">
                                                                                    <thead>
                                                                                        <tr class="headings">
                                                                                            <th>Denominacion</th>
                                                                                            <th>Valor</th>
                                                                                            <th>Cantidad</th>
                                                                                            <th>Total</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>DOS CIENTOS SOLES</td>
                                                                                            <td>200.00</td>
                                                                                            <td>{{bobeda.doscientossz|number:1}}</td>
                                                                                            <td>{{bobeda.doscientossz * 200.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CIEN SOLES</td>
                                                                                            <td>100.00</td>
                                                                                            <td>{{bobeda.ciensz|number:1}}</td>
                                                                                            <td>{{bobeda.ciensz * 100.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CINCUENTA SOLES</td>
                                                                                            <td>50.00</td>
                                                                                            <td>{{bobeda.cincuentasz|number:1}}</td>
                                                                                            <td>{{bobeda.cincuentasz * 50.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>VEINTE SOLES</td>
                                                                                            <td>20.00</td>
                                                                                            <td>{{bobeda.veintesz|number:1}}</td>
                                                                                            <td>{{bobeda.veintesz * 20.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>DIEZ SOLES</td>
                                                                                            <td>10.00</td>
                                                                                            <td>{{bobeda.diezsz|number:1}}</td>
                                                                                            <td>{{bobeda.diezsz * 10.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CINCO SOLES</td>
                                                                                            <td>5.00</td>
                                                                                            <td>{{bobeda.cincosz|number:1}}</td>
                                                                                            <td>{{bobeda.cincosz * 5.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>DOS SOLES</td>
                                                                                            <td>2.00</td>
                                                                                            <td>{{bobeda.dossz|number:1}}</td>
                                                                                            <td>{{bobeda.dossz * 2.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>UN SOL</td>
                                                                                            <td>1.00</td>
                                                                                            <td>{{bobeda.unsz|number:1}}</td>
                                                                                            <td>{{bobeda.unsz * 1.00|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>CINCUENTA CENTIMOS</td>
                                                                                            <td>0.50</td>
                                                                                            <td>{{bobeda.cincuentacz|number:1}}</td>
                                                                                            <td>{{bobeda.cincuentacz * 0.50|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>VEINTE CENTIMOS</td>
                                                                                            <td>0.20</td>
                                                                                            <td>{{bobeda.veintecz|number:1}}</td>
                                                                                            <td>{{bobeda.veintecz * 0.20|number:2}}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>DIEZ CENTIMOS</td>
                                                                                            <td>0.10</td>
                                                                                            <td>{{bobeda.diezcz|number:1}}</td>
                                                                                            <td>{{bobeda.diezcz * 0.10|number:2}}</td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-12">
                                                                                <b>Total</b> {{bobeda.montocierre|currency:'S/. ':2}}
                                                                            </div>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <div class="profile_title">
                                        <div class="col-ss-12 col-xs-4">
                                            <h2>Operaciones bobeda</h2>
                                        </div>
                                        <div class="col-ss-12 col-xs-8">
                                            <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                <span style="color: #73879C"> Horas</span> <b class="caret"></b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-12 col-sm-12 col-xs-12 col-ss-12">
                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab2" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#tab_contentz1" id="home-tabz" role="tab" data-toggle="tab" aria-expanded="true">Cajeros</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_contentz2" id="profile-tabz" role="tab" data-toggle="tab" aria-expanded="false">Transferencias</a>
                                                </li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_contentz1" aria-labelledby="home-tabz">
                                                    <div class="row">
                                                        <form name="formularioc" id="formularioc" ng-submit="registrarc(formularioc)" ng-validate="validatec">
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Caja</label>
                                                                <select ng-options="caja as caja.nombre for caja in cajas track by caja.id" ng-model="transferenciac.cajero.caja" name="caja" class="form-control input-sm"></select>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Usuario</label>
                                                                <select ng-options="usuario as usuario.nombres for usuario in usuarios track by usuario.id" ng-model="transferenciac.cajero.idusuario" name="idusuario" class="form-control input-sm"></select>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Saldo apertura</label>
                                                                <input ng-model="transferenciac.cajero.saldoapertura" decimals="2" name="saldoapertura" class="form-control input-sm" type="number" placeholder="SALDO DE APERTURA" disabled="">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                <label>Fecha apertura</label>
                                                                <input ng-model="transferenciac.cajero.fechaapertura" name="fechaapertura" class="form-control input-sm" placeholder="FECHA DE APERTURA" disabled="">
                                                            </div>
                                                            <div class="col-ss-12 col-xs-6 btn-col">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Monedas</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 0.10</label>
                                                                                    <input ng-model="transferenciac.diezc" ng-change="calcularTotal()" name="diezc" max="{{bobeda.diezcz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 0.20</label>
                                                                                    <input ng-model="transferenciac.veintec" ng-change="calcularTotal()" name="veintec" max="{{bobeda.veintecz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 0.50</label>
                                                                                    <input ng-model="transferenciac.cincuentac" ng-change="calcularTotal()" name="cincuentac" max="{{bobeda.cincuentacz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 1.00</label>
                                                                                    <input ng-model="transferenciac.uns" ng-change="calcularTotal()" name="uns" max="{{bobeda.unsz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 2.00</label>
                                                                                    <input ng-model="transferenciac.doss" ng-change="calcularTotal()" name="doss" max="{{bobeda.dossz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 5.00</label>
                                                                                    <input ng-model="transferenciac.cincos" ng-change="calcularTotal()" name="cincos" max="{{bobeda.cincosz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-6 btn-col">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <fieldset>
                                                                            <legend style="font-family: Cambria">Billetes</legend>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 10.00</label>
                                                                                    <input ng-model="transferenciac.diezs" ng-change="calcularTotal()" name="diezs" max="{{bobeda.diezsz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 20.00</label>
                                                                                    <input ng-model="transferenciac.veintes" ng-change="calcularTotal()" name="veintes" max="{{bobeda.veintesz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 50.00</label>
                                                                                    <input ng-model="transferenciac.cincuentas" ng-change="calcularTotal()" name="cincuentas" max="{{bobeda.cincuentasz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 100.00</label>
                                                                                    <input ng-model="transferenciac.ciens" ng-change="calcularTotal()" name="ciens" max="{{bobeda.ciensz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4">
                                                                                    <label>S/. 200.00</label>
                                                                                    <input ng-model="transferenciac.doscientoss" ng-change="calcularTotal()" name="doscientoss" max="{{bobeda.doscientossz}}" type="number" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4 btn-colf">
                                                                                    <a href="javascript:void(0)" ng-click="agregarTodo()" style="color: blueviolet"><i class="fa fa-cubes"> Agregar todo</i></a>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12">
                                                                <button class="btn btn-primary btn-sm" type="submit">Registrar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-12 btn-col">
                                                            <table class="table table-striped jambo_table">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-click="sort('id')">N°
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th ng-click="sort('nombres')">Usuario
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'nombres'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th ng-click="sort('caja.nombre')">Caja
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'ip'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th ng-click="sort('saldoapertura')">Saldo apertura
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'saldoapertura'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th ng-click="sort('saldocierre')">Saldo cierre
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'saldocierre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th ng-click="sort('fechaapertura')">Fecha apertura
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fechaapertura'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th ng-click="sort('fechacierre')">Fecha cierre
                                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fechacierre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                                        </th>
                                                                        <th>Opt.</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr ng-show="cajeros.length > 0" dir-paginate="cajero in cajeros|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="tc">
                                                                        <td>{{$index + 1}}</td>
                                                                        <td>{{cajero.nombres}}</td>
                                                                        <td>{{cajero.caja.nombre}}</td>
                                                                        <td>{{cajero.saldoapertura|currency:'S/. ':2}}</td>
                                                                        <td>{{cajero.saldocierre|currency:'S/. ':2}}</td>
                                                                        <td>{{cajero.fechaapertura}}</td>
                                                                        <td>{{cajero.fechacierre}}</td>
                                                                        <td>
                                                                            <a ng-if="cajero.estado" href="javascript:void(0)" ng-click="eliminarc(cajero)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                            <a ng-if="cajero.estado === false && cajero.pendiente === true" href="javascript:void(0)" ng-click="confirmarc(cajero)" style="color: blue"><i class="fa fa-eject"></i> Acept.</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr ng-show="cajeros.length <= 0">
                                                                        <td colspan="8" class="dataTables_empty">No se encontró ningun registro de cajeros</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <dir-pagination-controls
                                                                max-size="5"
                                                                direction-links="true"
                                                                boundary-links="true"
                                                                pagination-id="tc">
                                                            </dir-pagination-controls>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_contentz2" aria-labelledby="profile-tabz">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-12">
                                                            <table class="table table-striped jambo_table">
                                                                <thead>
                                                                    <tr>
                                                                        <th ng-click="sortt('id')">N°
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'id'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th ng-click="sortt('cajero.id')">Cajero
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'cajero.id'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th ng-click="sortt('bobeda.id')">Bobeda
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'bobeda.id'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th ng-click="sortt('idttipotransferencia')">Tipo
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'idttipotransferencia'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th ng-click="sortt('glosa')">Glosa
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'glosa'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th ng-click="sortt('montototal')">Monto
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'montototal'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th ng-click="sortt('fecha')">Fecha y hora
                                                                            <span class="glyphicon sort-icon" ng-show="sortKeyt === 'fecha'" ng-class="{'glyphicon-chevron-up':reverset, 'glyphicon-chevron-down':!reverset}"></span>
                                                                        </th>
                                                                        <th>Opcion</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr ng-show="transferencias.length > 0" dir-paginate="transferencia in transferencias|itemsPerPage:10|filter:buscar|orderBy:sortKeyt:reverset" pagination-id="tt">
                                                                        <td>{{$index + 1}}</td>
                                                                        <td>{{transferencia.cajero.caja.nombre}}</td>
                                                                        <td>{{transferencia.bobeda.nombre}}</td>
                                                                        <td>{{transferencia.idttipotransferencia.nombre}}</td>
                                                                        <td>{{transferencia.glosa}}</td>
                                                                        <td>{{transferencia.montototal|currency:'S/. ':2}}</td>
                                                                        <td>{{transferencia.fecha}}</td>
                                                                        <td>
                                                                            <a target="_blank" href="${pageContext.request.contextPath}/reporte/recibotransferencia?type=pdf&&idTipo=1&&id=1"><i class="fa fa-file-pdf-o fa-2x"></i> Recibo</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr ng-show="transferencias.length <= 0">
                                                                        <td colspan="8" class="dataTables_empty">No se encontró ningun registro de transferencias</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <dir-pagination-controls
                                                                max-size="5"
                                                                direction-links="true"
                                                                boundary-links="true"
                                                                pagination-id="tt">
                                                            </dir-pagination-controls>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/pos/administracionModule.js" type="text/javascript"></script>
    </body>
</html>