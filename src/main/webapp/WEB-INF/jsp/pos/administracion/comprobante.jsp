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
        <title>Gestionar comprobantes</title>
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
    <body class="body-red nav-md" ng-controller="comprobanteController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-4 col-xs-push-8 col-lg-3 col-lg-push-9">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="overflow: visible">Registrar comprobante</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form name="formularioc" ng-validate="validatec">
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Tipo comprobante <span class="span-salmon">(*)</span></label>
                                                <select ng-if="comprobante.id <= 0" ng-options="tipocomprobante as tipocomprobante.nombre for tipocomprobante in tipocomprobantes track by tipocomprobante.id" ng-model="comprobante.idttipocomprobante" class="form-control input-sm" name="idttipocomprobante">
                                                </select>
                                                <select ng-if="comprobante.id > 0" ng-options="tipocomprobante as tipocomprobante.nombre for tipocomprobante in tipocomprobantes track by tipocomprobante.id" ng-model="comprobante.idttipocomprobante" class="form-control input-sm" disabled="">
                                                </select>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Nombre <span class="span-salmon">(*)</span></label>
                                                <input ng-model="comprobante.nombre" class="form-control input-sm" name="nombre" uppercased type="text" placeholder="NOMBRE COMPROBANTE">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Abreviatura <span class="span-salmon">(*)</span></label>
                                                <input ng-model="comprobante.abreviatura" class="form-control input-sm" name="abreviatura" uppercased type="text" placeholder="ABREVIATURA">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Numero <span class="span-salmon">(*)</span></label>
                                                <input ng-model="comprobante.numero" class="form-control input-sm" name="numero" type="number" placeholder="NUMERO">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Serie <span class="span-salmon">(*)</span></label>
                                                <input ng-model="comprobante.serie" class="form-control input-sm" name="serie" type="number" placeholder="SERIE">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Longitud numero <span class="span-salmon">(*)</span></label>
                                                <input ng-model="comprobante.longnumero" class="form-control input-sm" name="longnumero" type="number" placeholder="LONGITUD NUMERO">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Longitud serie <span class="span-salmon">(*)</span></label>
                                                <input ng-model="comprobante.longserie" class="form-control input-sm" name="longserie" type="number" placeholder="LONGITUD SERIE">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Estado <span class="span-salmon">(*)</span></label>
                                                <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="comprobante.estado" class="form-control input-sm" name="estado">
                                                </select>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                <button ng-if="comprobante.id <= 0" ng-click="registrarc(formularioc)" type="button" class="btn btn-primary btn-sm">Registrar</button>
                                                <button ng-if="comprobante.id > 0" ng-click="actualizarc(formularioc)" type="button" class="btn btn-primary btn-sm">Atualizar</button>
                                                <button ng-if="comprobante.id > 0" ng-click="cancelarc()" type="button" class="btn btn-danger btn-sm">Cancelar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-8 col-xs-pull-4 col-lg-9 col-lg-pull-3">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Lista de comprobantes</h2>
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
                                                <th ng-click="sort('nombre')">Comprobante
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('numero')">Numero
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'numero'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('serie')">Serie
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'serie'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('longnumero')">Long. numero
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'longnumero'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('longserie')">Long. serie
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'longserie'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('estado')">Estado
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'estado'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Opt.</th>
                                                <th>Opt.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-show="comprobantes.length > 0" dir-paginate="comprobante in comprobantes|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="tc">
                                                <td>{{$index + 1}}</td>
                                                <td>{{comprobante.nombre}} ({{comprobante.abreviatura}})</td>
                                                <td>{{comprobante.numeroc}}</td>
                                                <td>{{comprobante.seriec}}</td>
                                                <td>{{comprobante.longnumero}}</td>
                                                <td>{{comprobante.longserie}}</td>
                                                <td>{{comprobante.estado}}</td>
                                                <td>
                                                    <a href="javascript:void(0)" ng-click="mostrarc(comprobante)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0)" ng-click="eliminarc(comprobante)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                </td>
                                            </tr>
                                            <tr ng-show="comprobantes.length <= 0">
                                                <td colspan="9" class="dataTables_empty">No se encontró ningun registro de comprobantes</td>
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