<%-- 
    Document   : index
    Created on : 18/08/2016, 05:36:16 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="administracionModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro producto</title>
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

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/fileupload/fileinput.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="productoController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>

                <div class="right_col">
                    <div class="">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>REGISTRAR PRODUCTO</h2>
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
                                                <form name="formulariop" ng-submit="registrarp(formulariop)" ng-validate="validatep">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-9">
                                                            <div class="row">
                                                                <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                    <label>CATEGORIA<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="categoria as categoria.denominacion for categoria in categorias track by categoria.id" ng-model="producto.categoria" ng-change="obtenerCodigoproducto()" name="categoria" class="form-control input-sm">
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                    <label>UNIDAD MEDIDA<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="unidadmedida as unidadmedida.nombre for unidadmedida in unidadmedidas track by unidadmedida.id" ng-model="producto.idtunidadmedida" name="unidadmedida" class="form-control input-sm">
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                    <label>TIPO PRODUCTO<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="tipo as tipo.nombre for tipo in tipos track by tipo.id" ng-model="producto.idttipo" name="tipo" class="form-control input-sm">
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                    <label>MARCA<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="marca as marca.denominacion for marca in marcas track by marca.id" ng-model="producto.marca" name="marca" class="form-control input-sm">
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-3">
                                                                    <label>CÓDIGO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="producto.codigo" name="codigo" class="form-control input-sm" disabled="">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-6">
                                                                    <label for="nombreproduct">NOMBRE<span class="span-salmon">(*)</span></label>
                                                                    <input id="nombreproduct" ng-model="producto.nombre" name="nombre" class="form-control input-sm" uppercased placeholder="NOMBRE DEL PRODUCTO">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-3">
                                                                    <label for="cantminimprod">CANTIDAD MÍNIMA</label>
                                                                    <input id="cantminimprod" ng-model="producto.cantidadmin" name="cantidadmin" class="form-control input-sm" type="number" placeholder="CANTIDAD MIN. DE ALERTA">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-12">
                                                                    <label for="descripproct">DESCRIPCIÓN</label>
                                                                    <textarea id="descripproct" ng-model="producto.descripcion" name="descripcion" rows="4" class="form-control input-sm" uppercased placeholder="DESCRIPCION..."></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-ss-12 col-xs-3">
                                                            <label for="file-fr">IMAGEN</label>
                                                            <input ng-file-model="file" name="file" type="file" class="file form-control" id="file-fr" data-min-file-count="1">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-12 col-sm-12 btn-col">
                                                            <button type="submit" class="btn btn-primary btn-sm">REGISTRAR</button>
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
                                                <h2>LISTA DE PRODUCTOS</h2>
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
                                            <fieldset>
                                                <div class=" form-group col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                                    <label for="buscarprod">BUSCAR PRODUCTO</label>
                                                    <input id="buscarprod" type="text" ng-model="buscarp" uppercased class="form-control input-sm" placeholder="Buscar...">
                                                </div>
                                                <div class="col-ss-12 col-xs-12">
                                                    <table class="table table-striped jambo_table">
                                                        <thead>
                                                            <tr>
                                                                <th ng-click="sortp('id')">N°
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'id'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('codigo')">CÓDIGO
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'codigo'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('nombre')">NOMBRE
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'nombre'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('categoria.denominacion')">CATEGORIA 
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'categoria.denominacion'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('idtunidadmedida')">UNIDAD MEDIDA
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'idtunidadmedida'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('idttipo')">TIPO PRODUCTO
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'idttipo'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('marca.denominacion')">MARCA
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'marca.denominacion'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('estado')">ESTADO
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'estado'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th ng-click="sortp('fechusuariocrea')">FECHA CREACIÓN
                                                                    <span class="glyphicon sort-icon" ng-show="sortKeyp === 'fechusuariocrea'" ng-class="{'glyphicon-chevron-up':reversep, 'glyphicon-chevron-down':!reversep}"></span>
                                                                </th>
                                                                <th>Img.</th>
                                                                <th>Rpt.</th>
                                                                <th>Opt.</th>
                                                                <th>Opt.</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-show="productos.length > 0" dir-paginate="producto in productos|itemsPerPage:10|filter:buscarp|orderBy:sortKeyp:reversep">
                                                                <td>{{producto.id}}</td>
                                                                <td>{{producto.codigo}}</td>
                                                                <td>{{producto.nombre}}</td>
                                                                <td>{{producto.categoria.denominacion}}</td>
                                                                <td>{{producto.idtunidadmedida}}</td>
                                                                <td>{{producto.idttipo}}</td>
                                                                <td>{{producto.marca.denominacion}}</td>
                                                                <td>{{producto.estado}}</td>
                                                                <td>{{producto.fechusuariocrea}}</td>
                                                                <td title="{{producto.urlfoto}}">
                                                                    <a href="${pageContext.request.contextPath}{{producto.urlfoto}}" target="_blank"><i class="fa fa-picture-o"></i> Img.</a>
                                                                </td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/almacen/administracion/reporte?type=pdf&&id={{producto.id}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Rpt.</a>
                                                                </td>
                                                                <td>
                                                                    <a href="javascript:void(0)" ng-click="mostrarp(producto)" style="color: blue" data-toggle="modal" data-target="#modalProducto"><i class="fa fa-edit"></i> Edit.</a>
                                                                </td>
                                                                <td>
                                                                    <a href="javascript:void(0)" ng-click="eliminarp(producto)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                </td>
                                                            </tr>
                                                            <tr ng-show="productos.length <= 0">
                                                                <td colspan="10" class="dataTables_empty">No se encontró ningun registro de producto</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-ss-12 col-xs-12" style="text-align: right">
                                                    <dir-pagination-controls
                                                        max-size="5"
                                                        direction-links="true"
                                                        boundary-links="true">
                                                    </dir-pagination-controls>
                                                </div>
                                            </fieldset>
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

        <div id="modalProducto" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formulariopa" ng-submit="actualizarp(formulariopa)" ng-validate="validatep">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">MODIFICAR PRODUCTO</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-ss-12 col-xs-6">
                                    <label>CÓDIGO</label>
                                    <input ng-model="productoa.codigo" name="codigo" class="form-control input-sm" disabled="">
                                </div>
                                <div class="form-group col-ss-12 col-xs-6">
                                    <label>CATEGORIA</label>
                                    <select ng-options="categoria as categoria.denominacion for categoria in categorias track by categoria.id" ng-model="productoa.categoria" name="categoria" class="form-control input-sm" disabled="">
                                    </select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-6">
                                    <label>UNIDAD MEDIDA</label>
                                    <select ng-options="unidadmedida as unidadmedida.nombre for unidadmedida in unidadmedidas track by unidadmedida.id" ng-model="productoa.idtunidadmedida" name="unidadmedida" class="form-control input-sm">
                                    </select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-6">
                                    <label>TIPO PRODUCTO</label>
                                    <select ng-options="tipo as tipo.nombre for tipo in tipos track by tipo.id" ng-model="productoa.idttipo" name="tipo" class="form-control input-sm">
                                    </select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-6">
                                    <label>MARCA</label>
                                    <select ng-options="marca as marca.denominacion for marca in marcas track by marca.id" ng-model="productoa.marca" name="marca" class="form-control input-sm">
                                    </select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-6">
                                    <label>ESTADO</label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="productoa.estado" name="estado" class="form-control input-sm">
                                    </select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-8">
                                    <label for="nomprodact">NOMBRE</label>
                                    <input id="nomprodact" ng-model="productoa.nombre" name="nombre" class="form-control input-sm" uppercased>
                                </div>
                                <div class="form-group col-ss-12 col-xs-8">
                                    <label for="cantminprodact">CANTIDAD MÍNIMA</label>
                                    <input id="cantminprodact" ng-model="productoa.cantidadmin" name="cantidadmin" class="form-control input-sm" type="number">
                                </div>
                                <div class="form-group col-ss-12 col-xs-12">
                                    <label for="descrpproact">DESCRIPCIÓN</label>
                                    <textarea id="descrpproact" ng-model="productoa.descripcion" name="descripcion" rows="3" class="form-control input-sm" uppercased></textarea>
                                </div>
                                <div class="form-group col-ss-12 col-xs-5">
                                    <label>¿Seleccionar nueva imagen?</label>
                                    <select ng-options="opcion as opcion.nombre for opcion in opciones track by opcion.id" ng-model="opcion" class="form-control input-sm"></select>
                                </div>
                                <div class="form-group col-ss-12 col-xs-7">
                                    <label>Imagen</label>
                                    <div ng-show="opcion.id === false">
                                        <img src="${pageContext.request.contextPath}{{productoa.urlfoto}}" class="img-responsive" alt="${pageContext.request.contextPath}/assets/files/img/admin.jpg">
                                    </div>
                                    <div ng-show="opcion.id === true">
                                        <input ng-file-model="file2" name="file2" type="file" class="file" id="file-fr2" data-min-file-count="1">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">ACTUALIZAR</button>
                            <button type="button" class="btn btn-danger" ng-click="ocultarp()">CERRAR</button>
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
        <script>
                                        $('#file-fr').fileinput({
                                            allowedFileExtensions: ['jpg', 'png', 'gif'],
                                            maxFileSize: 100000,
                                            maxFileCount: 1
                                        });
        </script>
    </body>
</html>