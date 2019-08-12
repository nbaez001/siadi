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
        <title>Parametros venta</title>
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
    <body class="body-red nav-md" ng-controller="paramsventaController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-4 col-xs-push-8 col-lg-3 col-lg-push-9">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="overflow: visible">Registrar caja</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form name="formularioc" ng-validate="validatec">
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Nombre <span class="span-salmon">(*)</span></label>
                                                <input ng-model="caja.nombre" class="form-control input-sm" name="nombre" uppercased type="text" placeholder="NOMBRE CAJA">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Direccion IP <span class="span-salmon">(*)</span></label>
                                                <input ng-model="caja.ip" class="form-control input-sm" name="ip" type="text" placeholder="192.X.X.X">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label title="Numero de serie de la maquina impresora">Serie maquina impr. <span class="span-salmon">(*)</span></label>
                                                <input ng-model="caja.nroserie" class="form-control input-sm" name="nroserie" type="text" placeholder="SERIE MAQUINA IMPRESION">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Numero autorizacion SUNAT<span class="span-salmon">(*)</span></label>
                                                <input ng-model="caja.nroautorizacion" class="form-control input-sm" name="nroautorizacion" type="text" placeholder="NUMERO AUTORIZACION">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Estado <span class="span-salmon">(*)</span></label>
                                                <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="caja.estado" class="form-control input-sm" name="estado">
                                                </select>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                <button ng-if="caja.id <= 0" ng-click="registrarc(formularioc)" type="button" class="btn btn-primary btn-sm">Registrar</button>
                                                <button ng-if="caja.id > 0" ng-click="actualizarc(formularioc)" type="button" class="btn btn-primary btn-sm">Atualizar</button>
                                                <button ng-if="caja.id > 0" ng-click="cancelarc()" type="button" class="btn btn-danger btn-sm">Cancelar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-8 col-xs-pull-4 col-lg-9 col-lg-pull-3">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Lista de cajas</h2>
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
                                    <table class="table table-striped jambo_table">
                                        <thead>
                                            <tr>
                                                <th ng-click="sort('id')">N°
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('nombre')">Caja
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('ip')">IP
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'ip'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('nroserie')">Numero serie
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'nroserie'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('nroautorizacion')">Num. autorizacion
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'nroautorizacion'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('estado')">Estado
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'estado'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Opt.</th>
                                                <th>Opt.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-show="cajas.length > 0" dir-paginate="caja in cajas|itemsPerPage:6|filter:buscar|orderBy:sortKey:reverse" pagination-id="tc">
                                                <td>{{$index + 1}}</td>
                                                <td>{{caja.nombre}}</td>
                                                <td>{{caja.ip}}</td>
                                                <td>{{caja.nroserie}}</td>
                                                <td>{{caja.nroautorizacion}}</td>
                                                <td>{{caja.estado}}</td>
                                                <td>
                                                    <a href="javascript:void(0)" ng-click="mostrarc(caja)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0)" ng-click="eliminarc(caja)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                </td>
                                            </tr>
                                            <tr ng-show="cajas.length <= 0">
                                                <td colspan="8" class="dataTables_empty">No se encontró ningun registro de cajas</td>
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