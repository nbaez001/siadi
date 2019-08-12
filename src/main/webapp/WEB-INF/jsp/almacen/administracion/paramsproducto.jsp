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
        <title>Mantener parametros</title>
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
    <body class="nav-md" ng-controller="paramsproductoController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-6">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>MANTENER MARCA</h2>
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
                                                <form name="formulariom" ng-submit="registrarm(formulariom)" ng-validate="validatem">
                                                    <div class="row">
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-5">
                                                            <label for="denommarca">NOMBRE<span class="span-salmon">(*)</span></label>
                                                            <input id="denommarca" ng-model="marca.denominacion" ng-keyup="obtenerCodigo(marca)" class="form-control input-sm" name="denominacion" uppercased autofocus="">
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                            <label for="codigomarca">CÓDIGO<span class="span-salmon">(*)</span></label>
                                                            <input id="codigomarca" ng-model="marca.codigo" class="form-control input-sm" name="codigo" uppercased disabled="">
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-4">
                                                            <label>ESTADO<span class="span-salmon">(*)</span></label>
                                                            <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="marca.estado" class="form-control input-sm" name="estado">
                                                            </select>
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
                                            <legend>LISTA DE MARCAS</legend>
                                            <div class="form-group col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                                <label for="buscarmarca">Buscar</label>
                                                <input id="buscarmarca" type="text" ng-model="buscar" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <table class="table table-striped jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th ng-click="sortm('id')">N°
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':
                                                                                    !reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('denominacion')">Denominacion
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'denominacion'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':
                                                                                    !reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('codigo')">Codigo
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'codigo'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':
                                                                                    !reverse}"></span>
                                                            </th>
                                                            <th ng-click="sortm('estado')">Estado
                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'estado'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':
                                                                                    !reverse}"></span>
                                                            </th>
                                                            <th>Opt.</th>
                                                            <th>Opt.</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="marcas.length > 0" dir-paginate="marca in marcas|itemsPerPage:5|filter:buscar|orderBy:sortKey:reverse" pagination-id="mar">
                                                            <td>{{marca.id}}</td>
                                                            <td>{{marca.denominacion}}</td>
                                                            <td>{{marca.codigo}}</td>
                                                            <td>{{marca.estado}}</td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="mostrarm(marca)" style="color: blue" data-toggle="modal" data-target="#modalMarca"><i class="fa fa-edit"></i> Edit.</a>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="eliminarm(marca)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                            </td>
                                                        </tr>
                                                        <tr ng-show="marcas.length <= 0">
                                                            <td colspan="6">No se encontró ningun registro de marca</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-ss-12 col-xs-12" style="text-align: right">
                                                <dir-pagination-controls
                                                    max-size="5"
                                                    direction-links="true"
                                                    boundary-links="true"
                                                    pagination-id="mar">
                                                </dir-pagination-controls>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-6">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>MANTENER CATEGORIA</h2>
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
                                                <form name="formularioc" ng-submit="registrarc(formularioc)" ng-validate="validatec">
                                                    <div class="row">
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-5">
                                                            <label for="denomincategor">NOMBRE<span class="span-salmon">(*)</span></label>
                                                            <input id="denomincategor" ng-model="categoria.denominacion" ng-keyup="obtenerCodigo(categoria)" class="form-control input-sm" name="denominacion" uppercased>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                            <label for="codigocateg">CÓDIGO<span class="span-salmon">(*)</span></label>
                                                            <input id="codigocateg" ng-model="categoria.codigo" class="form-control input-sm" name="codigo" uppercased disabled="">
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-6 col-sm-4">
                                                            <label>ESTADO<span class="span-salmon">(*)</span></label>
                                                            <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="categoria.estado" class="form-control input-sm" name="estado">
                                                            </select>
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
                                            <legend>LISTA DE CATEGORIAS</legend>
                                            <div class="form-group col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                                <label for="buscarcateg">BUSCAR CATEGORIA</label>
                                                <input id="buscarcateg" type="text" ng-model="buscarc" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <table class="table table-striped jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th ng-click="sortc('id')">N°
                                                                <span class="glyphicon sort-icon" ng-show="sortKeyc === 'id'" ng-class="{'glyphicon-chevron-up':reversec,'glyphicon-chevron-down':
                                                                        !reversec}"></span>
                                                            </th>
                                                            <th ng-click="sortc('denominacion')">NOMBRE
                                                                <span class="glyphicon sort-icon" ng-show="sortKeyc === 'denominacion'" ng-class="{'glyphicon-chevron-up':reversec,'glyphicon-chevron-down':
                                                                        !reversec}"></span>
                                                            </th>
                                                            <th ng-click="sortc('codigo')">CÓDIGO
                                                                <span class="glyphicon sort-icon" ng-show="sortKeyc === 'codigo'" ng-class="{'glyphicon-chevron-up':reversec,'glyphicon-chevron-down':
                                                                        !reversec}"></span>
                                                            </th>
                                                            <th ng-click="sortc('estado')">ESTADO
                                                                <span class="glyphicon sort-icon" ng-show="sortKeyc === 'estado'" ng-class="{'glyphicon-chevron-up':reversec,'glyphicon-chevron-down':
                                                                        !reversec}"></span>
                                                            </th>
                                                            <th>Opt.</th>
                                                            <th>Opt.</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="categorias.length > 0" dir-paginate="categoria in categorias|itemsPerPage:5|filter:buscarc|orderBy:sortKeyc:reversec" pagination-id="cat">
                                                            <td>{{categoria.id}}</td>
                                                            <td>{{categoria.denominacion}}</td>
                                                            <td>{{categoria.codigo}}</td>
                                                            <td>{{categoria.estado}}</td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="mostrarc(categoria)" style="color: blue" data-toggle="modal" data-target="#modalCategoria"><i class="fa fa-edit"></i> Edit.</a>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)" ng-click="eliminarc(categoria)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                            </td>
                                                        </tr>
                                                        <tr ng-show="categorias.length <= 0">
                                                            <td colspan="6">No se encontró ningun registro de categoria</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-ss-12 col-xs-12" style="text-align: right">
                                                <dir-pagination-controls
                                                    max-size="5"
                                                    direction-links="true"
                                                    boundary-links="true"
                                                    pagination-id="cat">
                                                </dir-pagination-controls>
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

        <div id="modalMarca" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formularioma" ng-submit="actualizarma(formularioma)" ng-validate="validatem">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">MODIFICAR MARCA</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-xs-12 col-xs-12 col-sm-6">
                                    <label for="nombremarcaa">NOMBRE</label>
                                    <input id="nombremarcaa" ng-model="marcaa.denominacion" ng-keyup="obtenerCodigo(marcaa)" name="denominacion" type="text" class="form-control input-sm" uppercased>
                                </div>
                                <div class="form-group col-xs-12 col-sm-6">
                                    <label for="codigmarcaa">CÓDIGO</label>
                                    <input id="codigmarcaa" ng-model="marcaa.codigo" name="codigo" type="text" class="form-control input-sm" disabled="">
                                </div>
                                <div class="form-group col-xs-12 col-sm-6">
                                    <label>ESTADO</label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="marcaa.estado" name="estado" class="form-control input-sm">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary input-sm">ACTUALIZAR</button>
                            <button type="button" class="btn btn-danger input-sm" data-dismiss="modal">CANCELAR</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="modalCategoria" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formularioca" ng-submit="actualizarc(formularioca)" ng-validate="validatec">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">MODIFICAR CATEGORIA</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-xs-12 col-sm-6">
                                    <label for="nombrecateg">NOMBRE</label>
                                    <input id="nombrecateg" ng-model="categoriaa.denominacion" ng-keyup="obtenerCodigo(categoriaa)" name="denominacion" type="text" class="form-control input-sm" uppercased>
                                </div>
                                <div class="form-group col-xs-12 col-sm-6">
                                    <label for="codigocategaa">CÓDIGO</label>
                                    <input id="codigocategaa" ng-model="categoriaa.codigo" name="codigo" type="text" class="form-control input-sm" disabled="">
                                </div>
                                <div class="form-group col-xs-12 col-sm-6">
                                    <label>Estado</label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="categoriaa.estado" name="estado" class="form-control input-sm">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary input-sm">ACTUALIZAR</button>
                            <button type="button" class="btn btn-danger input-sm" data-dismiss="modal">CANCELAR</button>
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
    </body>
</html>