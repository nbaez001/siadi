
<%-- 
    Document   : index
    Created on : 18/08/2016, 05:36:16 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="reporteModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reporte Inventario</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>

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
    <body class="nav-md" ng-controller="resumenkardexController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>

                <div class="right_col">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Reportes </h4>
                            </div>
                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control input-sm" placeholder="Buscar...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Ir!</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Reporte de Inventario Actual</h2>
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
                                            <form name="formulario" ng-submit="generarReporte(formulario)" ng-validate="validate">
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Categoria <span style="color: red">(*)</span></label>
                                                    <select ng-options="categoria as categoria.denominacion for categoria in categorias track by categoria.id" ng-model="categoria" name="categoria" class="form-control input-sm"></select>
                                                </div>
                                                <div class="col-ss-12 col-xs-4" style="padding-top: 25px">
                                                    <button type="submit" class="btn btn-primary btn-sm">Generar reporte</button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>N°</th>
                                                            <th>Reporte</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="reportes.length > 0" ng-repeat="reporte in reportes">
                                                            <td>-</td>
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}/almacen/reporte/rkardex?type=pdf&&id={{reporte.id}}" target="_blank" style="color: {{reporte.color}}"><i class="fa fa-file-pdf-o">{{reporte.nombre}}</i></a>
                                                            </td>
                                                        </tr>
                                                        <tr ng-show="reportes.length <= 0">
                                                            <td class="dataTables_empty" colspan="2">No hay reportes</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/reporteModule.js" type="text/javascript"></script>
    </body>
</html>