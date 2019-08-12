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
        <title>Mantener almacen</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="almacenController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>MANTENER ALMACENES</h2>
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
                                    <div class="row">
                                        <fieldset>
                                            <div class="col-ss-12 col-xs-12">
                                                <form name="formularioa" ng-submit="registrara(formularioa)" ng-validate="validatea">
                                                    <div class="row">
                                                        <div class="form-group col-ss-12 col-xs-3 col-sm-2">
                                                            <label>CÓDIGO<span class="span-salmon">(*)</span></label>
                                                            <input ng-model="almacen.codigo" class="form-control input-sm" name="codigo" type="text" disabled="">
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-6">
                                                            <label>AGENCIA<span class="span-salmon">(*)</span></label>
                                                            <select ng-options="agencia as agencia.razonsocial for agencia in agencias track by agencia.id" ng-model="almacen.agencia" name="agencia" class="form-control input-sm" disabled=""></select>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-3 col-sm-4">
                                                            <label>ESTADO<span class="span-salmon">(*)</span></label>
                                                            <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="almacen.estado" class="form-control input-sm" name="estado">
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-9 col-sm-8">
                                                            <label for="nombrealmacen">NOMBRE<span class="span-salmon">(*)</span></label>
                                                            <input id="nombrealmacen" ng-model="almacen.nombre" class="form-control input-sm" name="nombre" type="text" placeholder="ALMACEN 1" uppercased>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-3 col-sm-4">
                                                            <label for="fechapertalmac">FECHA APERTURA<span class="span-salmon">(*)</span></label>
                                                            <input id="fechapertalmac" ng-model="almacen.fechaapertura" class="form-control input-sm" name="fechaapertura" placeholder="2016-01-01">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-12 col-sm-12 btn-col">
                                                            <button type="submit" class="btn btn-primary">REGISTRAR</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="row" style="padding-top: 15px">
                                        <fieldset>
                                            <legend>LISTA DE ALMACENES</legend>
                                            <div class="col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                                <label for="buscaralmacen">BUSCAR ALMACEN</label>
                                                <input id="buscaralmacen" type="text" ng-model="buscar" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <table class="table table-striped jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th ng-click="sortm('id')">N°
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('codigo')">CÓDIGO
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'codigo'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('nombre')">NOMBRE
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('agencia.razonsocial')">Agencia
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'agencia.razonsocial'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('estado')">ESTADO
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'estado'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('fechaapertura')">FECHA APERTURA
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'fechaapertura'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                            </th>
                                                            <th>Opt.</th>
                                                            <th>Opt.</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="almacenes.length > 0" dir-paginate="almacen in almacenes|itemsPerPage:3|filter:buscar|orderBy:sortKey:reverse" pagination-id="ta">
                                                            <td>{{almacen.id}}</td>
                                                            <td>{{almacen.codigo}}</td>
                                                            <td>{{almacen.nombre}}</td>
                                                            <td>{{almacen.agencia.razonsocial}}</td>
                                                            <td>{{almacen.estado}}</td>
                                                            <td>{{almacen.fechaapertura}}</td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="mostrara(almacen)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="eliminara(almacen)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                            </td>
                                                        </tr>
                                                        <tr ng-show="almacenes.length <= 0">
                                                            <td colspan="8">No se encontró ningun registro de almacen</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-ss-12 col-xs-12" style="text-align: right">
                                                <dir-pagination-controls
                                                    max-size="5"
                                                    direction-links="true"
                                                    boundary-links="true"
                                                    pagination-id="ta">
                                                </dir-pagination-controls>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-6 col-sm-4" ng-repeat="almacen in almacenes">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>{{almacen.nombre}}<small> {{almacen.codigo}}</small></h2>
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
                                    <div class="row">
                                        <fieldset>
                                            <div class="col-ss-12 col-xs-12">
                                                <form ng-submit="registraran(almacen)">
                                                    <div class="row">
                                                        <div class="form-group col-ss-12 col-xs-12 col-sm-6 col-md-3">
                                                            <label>CÓDIGO</label>
                                                            <input ng-model="almacen.andamio.codigo" class="form-control input-sm" name="codigo" placeholder="ALM-00X-0X" disabled="">
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-12 col-sm-6 col-md-4">
                                                            <label>ESTADO</label>
                                                            <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="almacen.andamio.estado" class="form-control input-sm" name="estado">
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-12 col-sm-12 col-md-5">
                                                            <label for="nombreandamio">NOMBRE</label>
                                                            <input id="nombreandamio" ng-model="almacen.andamio.nombre" class="form-control input-sm" name="denominacion" required="" uppercased>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-12 col-sm-12 btn-col">
                                                            <button type="submit" class="btn btn-primary btn-sm">REGISTRAR</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="row" style="padding-top: 15px">
                                        <fieldset>
                                            <legend>LISTA DE ANDAMIOS</legend>
                                            <div class="col-ss-12 col-xs-12">
                                                <ul class="list-unstyled top_profiles scroll-view" tabindex="5001" style="overflow: hidden; outline: none; cursor: -webkit-grab;">
                                                    <li class="media event" ng-repeat="andamio in almacen.andamios">
                                                        <a ng-if="andamio.id % 2 !== 0 && andamio.id % 3 === 0" class="pull-left border-purple profile_thumb">
                                                            <i class="fa fa-user purple"></i>
                                                        </a>
                                                        <a ng-if="andamio.id % 2 === 0 && andamio.id % 3 !== 0" class="pull-left border-aero profile_thumb">
                                                            <i class="fa fa-user aero"></i>
                                                        </a>
                                                        <a ng-if="andamio.id % 2 === 0 && andamio.id % 3 === 0" class="pull-left border-blue profile_thumb">
                                                            <i class="fa fa-user blue"></i>
                                                        </a>
                                                        <a ng-if="andamio.id % 2 !== 0 && andamio.id % 3 !== 0" class="pull-left border-green profile_thumb">
                                                            <i class="fa fa-user green"></i>
                                                        </a>
                                                        <div class="media-body">
                                                            <a href="#" class="title">{{andamio.nombre}}</a> 
                                                            <a href="javascript:void(0)" ng-click="eliminaran(andamio, almacen)" class="pull-right" style="color: red"><i class="fa fa-trash"> Del.</i></a>
                                                            <p><strong>Codigo: </strong> {{andamio.codigo}} </p>
                                                            <p>
                                                                <small ng-if="andamio.estado === true">ACTIVO</small>
                                                                <small ng-if="andamio.estado === false">INACTIVO</small>
                                                            </p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>

        <div id="modalAlmacen" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formularioaa" ng-submit="actualizara(formularioaa)" ng-validate="validatea">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">MODIFICAR ALMACEN</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-ss-12 col-xs-3 col-sm-2">
                                    <label>CÓDIGO<span class="span-salmon">(*)</span></label>
                                    <input ng-model="almacena.codigo" class="form-control input-sm" name="codigo" type="text">
                                </div>
                                <div class="form-group col-ss-12 col-xs-6 col-sm-6">
                                    <label>AGENCIA<span class="span-salmon">(*)</span></label>
                                    <select ng-options="agencia as agencia.razonsocial for agencia in agencias track by agencia.id" ng-model="almacena.agencia" name="agencia" class="form-control input-sm" disabled=""></select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-3 col-sm-4">
                                    <label>ESTADO<span class="span-salmon">(*)</span></label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="almacena.estado" class="form-control input-sm" name="estado">
                                    </select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-9 col-sm-8">
                                    <label for="nombrealmacact">NOMBRE<span class="span-salmon">(*)</span></label>
                                    <input id="nombrealmacact" ng-model="almacena.nombre" class="form-control input-sm" name="nombre" type="text" placeholder="NOMBRE ALMACEN" uppercased>
                                </div>
                                <div class="form-group col-ss-12 col-xs-3 col-sm-4">
                                    <label for="fechapetalmact">FECHA APERTURA<span class="span-salmon">(*)</span></label>
                                    <input id="fechapetalmact" ng-model="almacena.fechaapertura" class="form-control input-sm" name="fechaapertura" placeholder="FECHA APERTURA">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">ACTUALIZAR</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">CANCELAR</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/administracionModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                $("form[name=formularioa] input[name=fechaapertura]").datepicker({dateFormat: 'yy-mm-d'});
        </script>
    </body>
</html>