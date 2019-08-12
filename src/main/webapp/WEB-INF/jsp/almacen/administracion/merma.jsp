<%-- 
    Document   : index
    Created on : 18/08/2016, 05:36:16 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="productoModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inventario producto</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/fileupload/fileinput.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/progressbar/bootstrap-progressbar.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/fileupload/fileinput.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="mermaController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>

                <div class="right_col">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>PRODUCTOS</h4>
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
                                        <h2>MERMA PRODUCTOS</h2>
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
                                            <div class="col-ss-12 col-xs-12">
                                                <form name="formulariop" ng-validate="validatep">
                                                    <div class="row">
                                                        <div class="form-group col-ss-12 col-xs-4">
                                                            <label>CATEGORIA</label>
                                                            <select ng-options="categoria as categoria.denominacion for categoria in categorias track by categoria.id" ng-model="producto.categoria" ng-change="obtenerCodigoproducto()" name="categoria" class="form-control input-sm">
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-4">
                                                            <label>MARCA</label>
                                                            <select ng-options="marca as marca.denominacion for marca in marcas track by marca.id" ng-model="producto.marca" name="marca" class="form-control input-sm">
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-4">
                                                            <label>UNIDAD MEDIDA</label>
                                                            <select ng-options="unidadmedida as unidadmedida.denominacion for unidadmedida in unidadmedidas track by unidadmedida.id" ng-model="producto.unidadmedida" name="unidadmedida" class="form-control input-sm">
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-3">
                                                            <label for="codigoprodmerm">CÓDIGO</label>
                                                            <input id="codigoprodmerm" ng-model="producto.codigo" name="codigo" ng-keyup="buscarp(formulariop, 1)" class="form-control input-sm" uppercased>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-7">
                                                            <label for="nombreprodmerm">NOMBRE</label>
                                                            <input id="nombreprodmerm" ng-model="producto.nombre" name="nombre" ng-keyup="buscarp(formulariop, 2)" class="form-control input-sm" uppercased>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-2 btn-colf">
                                                            <button type="button" class="btn btn-primary btn-sm" ng-click="buscarp(formulariop, 2)">BUSCAR</button>
                                                        </div>
                                                    </div>
                                                </form>
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
                                                <h2>LISTA DE PRODUCTOS DEFECTUOSOS</h2>
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
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Producto</th>
                                                            <th>Categoria</th>
                                                            <th>Marca</th>
                                                            <th>Unidad medida</th>
                                                            <th>Imagen</th>
                                                            <th style="width: 15%">Cantidad</th>
                                                            <th>Estado</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="inventarios.length > 0" ng-repeat="inventario in inventarios">
                                                            <td>#</td>
                                                            <td>
                                                                <a>{{inventario.producto.nombre}}</a>
                                                                <br>
                                                                <small>{{inventario.fechusuariocrea}}</small>
                                                            </td>
                                                            <td>
                                                                {{inventario.producto.categoria.denominacion}}
                                                            </td>
                                                            <td>
                                                                {{inventario.producto.marca.denominacion}}
                                                            </td>
                                                            <td>
                                                                {{inventario.producto.unidadmedida.denominacion}}
                                                            </td>
                                                            <td>
                                                                <ul class="list-inline">
                                                                    <li>
                                                                        <img src="${pageContext.request.contextPath}{{inventario.producto.urlfoto}}" onerror="this.src='${pageContext.request.contextPath}/assets/files/img/producto.jpg'" class="avatar" alt="">
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                            <td class="project_progress">
                                                                <div class="progress progress_sm">
                                                                    <div ng-if="inventario.cantidadact >= 0 && inventario.cantidadact < 25" class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="{{inventario.cantidadact}}" aria-valuemin="0" aria-valuemax="100" style="width:{{inventario.cantidadact}}%">
                                                                    </div>
                                                                    <div ng-if="inventario.cantidadact >= 25 && inventario.cantidadact < 50" class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="{{inventario.cantidadact}}" aria-valuemin="0" aria-valuemax="100" style="width:{{inventario.cantidadact}}%">
                                                                    </div>
                                                                    <div ng-if="inventario.cantidadact >= 50 && inventario.cantidadact < 75" class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="{{inventario.cantidadact}}" aria-valuemin="0" aria-valuemax="100" style="width:{{inventario.cantidadact}}%">
                                                                    </div>
                                                                    <div ng-if="inventario.cantidadact >= 75" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="{{inventario.cantidadact}}" aria-valuemin="0" aria-valuemax="100" style="width:{{inventario.cantidadact}}%">
                                                                    </div>
                                                                </div>
                                                                <small>{{inventario.cantidadact}}% Items</small>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="detalleInventario(inventario.producto)" class="btn btn-success btn-xs">Ver registro</a>
                                                            </td>
                                                        </tr>
                                                        <tr ng-show="inventarios.length <= 0">
                                                            <td colspan="8" class="dataTables_empty">Realice la busqueda en el formulario anterior para ver el inventario</td>
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/productoModule.js" type="text/javascript"></script>
        <script>
                                                                    $('#file-fr').fileinput({
                                                                        allowedFileExtensions: ['jpg', 'png', 'gif'],
                                                                        maxFileSize: 100000,
                                                                        maxFileCount: 1
                                                                    });
        </script>
    </body>
</html>