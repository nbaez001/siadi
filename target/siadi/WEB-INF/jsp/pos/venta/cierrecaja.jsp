<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="ventaModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cerrar caja</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

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

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="body-red nav-md" ng-controller="cierrecajaController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Cierre de caja <i class="fa fa-book"></i></h2>
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
                                                    <li><i class="fa fa-sign-out"></i> Caja: {{cajero.caja.nombre}}</li>
                                                    <li><i class="fa fa-sign-out"></i> Fecha apertura: {{cajero.fechaapertura}}</li>
                                                    <li class="hidden-ss"><i class="fa fa-sign-out"></i> Estado: <text ng-show="cajero.estado" style="color: blue; font-weight: bold">ABIERTO</text><text ng-show="!cajero.estado" style="color: blue; font-weight: bold">CERRADO</text></li>
                                                </ul>
                                            </div>
                                            <div class="left col-ss-12 col-xs-6">
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-sign-out"></i> Tipo de cambio: SOLES</li>
                                                    <li><i class="fa fa-sign-out"></i> Fecha cierre: {{hoy}}</li>
                                                    <li class="hidden-xs hidden-sm hidden-md hidden-lg"><i class="fa fa-sign-out"></i> Estado: <text ng-show="true" style="color: blue; font-weight: bold">APERTURADO</text></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-ss-12 col-xs-12">
                                        <div class="row">
                                            <form name="formularioc" id="formularioc" ng-submit="cerrarCajero(formularioc)" ng-validate="validatec">
                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                    <label>Saldo apertura</label>
                                                    <input ng-model="cajero.saldoapertura" decimals="2" name="saldoapertura" class="form-control input-sm" type="number" placeholder="SALDO DE APERTURA" disabled="">
                                                </div>
                                                <div class="col-ss-12 col-xs-offset-2 col-xs-4 col-sm-offset-3 col-sm-3">
                                                    <label>Saldo cierre</label>
                                                    <input ng-model="cajero.saldocierre" decimals="2" name="saldocierre" class="form-control input-sm" type="number" placeholder="SALDO CIERRE" disabled="">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 btn-col">
                                                    <div class="panel panel-default">
                                                        <div class="panel-body">
                                                            <fieldset>
                                                                <legend style="font-family: Cambria">Monedas</legend>
                                                                <div class="row">
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 0.10</label>
                                                                        <input ng-model="cajero.diezc" ng-change="calcularTotal()" name="diezc" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 0.20</label>
                                                                        <input ng-model="cajero.veintec" ng-change="calcularTotal()" name="veintec" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 0.50</label>
                                                                        <input ng-model="cajero.cincuentac" ng-change="calcularTotal()" name="cincuentac" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 1.00</label>
                                                                        <input ng-model="cajero.uns" ng-change="calcularTotal()" name="uns" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 2.00</label>
                                                                        <input ng-model="cajero.doss" ng-change="calcularTotal()" name="doss" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 5.00</label>
                                                                        <input ng-model="cajero.cincos" ng-change="calcularTotal()" name="cincos" min="0" type="number" class="form-control input-sm">
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
                                                                        <input ng-model="cajero.diezs" ng-change="calcularTotal()" name="diezs" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 20.00</label>
                                                                        <input ng-model="cajero.veintes" ng-change="calcularTotal()" name="veintes" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 50.00</label>
                                                                        <input ng-model="cajero.cincuentas" ng-change="calcularTotal()" name="cincuentas" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 100.00</label>
                                                                        <input ng-model="cajero.ciens" ng-change="calcularTotal()" name="ciens" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4">
                                                                        <label>S/. 200.00</label>
                                                                        <input ng-model="cajero.doscientoss" ng-change="calcularTotal()" name="doscientoss" min="0" type="number" class="form-control input-sm">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-4 btn-colf">
                                                                        <a style="color: blueviolet;font-weight: bold">{{monto|currency:'S/. ':2}}</i></a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-12" ng-show="mostrarError" style="color: red;font-weight: bold">
                                                    {{error}}
                                                </div>
                                                <div class="col-ss-12 col-xs-12">
                                                    <button class="btn btn-primary btn-sm" type="submit">Confirmar</button>
                                                </div>
                                            </form>
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

        <script src="${pageContext.request.contextPath}/assets/controller/pos/ventaModule.js" type="text/javascript"></script>
    </body>
</html>