<%-- 
    Document   : registro
    Created on : 26/08/2016, 03:39:13 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="compraModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Almacenar compra</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>

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
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/fileupload/fileinput.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="almacenamientoController" ng-cloak>
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
                                        <h2>Almacenar compra</h2>
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
                                        <form name="formularioinv" ng-submit="registrarinv(formularioinv)" ng-validate="validateinv">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-3 col-md-2">
                                                    <label>Codigo compra <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="compra.codigo" name="codigo" type="text" class="form-control input-sm" placeholder="CODIGO COMPRA" uppercased auto-complete="buscarCompraPorCodigo">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-md-7">
                                                    <label>Nombre proveedor <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="nombreproveedor" name="nombreproveedor" type="text" class="form-control input-sm" placeholder="NOMBRE DEL PROVEEDOR" uppercased auto-complete="buscarCompraPorProveedor">
                                                </div>
                                                <div class="col-ss-12 col-xs-3">
                                                    <label>Fecha compra <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="compra.fechacompra" name="fechacompra" ng-click="buscarCompraPorFecha()" type="text" class="form-control input-sm" placeholder="FECHA COMPRA">
                                                </div>
                                                <div class="col-ss-12 col-xs-3 col-md-2">
                                                    <label>Monto compra<span class="span-salmon">(*)</span></label>
                                                    <input ng-model="compra.montototal" decimals="2" name="montototal" type="number" class="form-control input-sm" disabled="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <fieldset>
                                                    <legend>Detalle de compra</legend>
                                                    <div ng-if="detallecompras.length <= 0" class="col-ss-12 col-xs-12">
                                                        <p>No hay regitros de detalle de productos</p>
                                                    </div>
                                                    <div ng-if="detallecompras.length > 0" class="col-ss-12 col-xs-12">
                                                        <div class="panel-group" id="accordion">
                                                            <div class="panel panel-default" ng-repeat="inventario in inventarios">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse{{$index}}">
                                                                            {{inventario.producto.nombre}}
                                                                        </a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse{{$index}}" class="panel-collapse collapse">
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-ss-12 col-xs-4">
                                                                                <label>Cantidad anterior</label>
                                                                                <input ng-model="inventario.cantidadant" class="form-control input-sm" decimals="1" type="number" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-4">
                                                                                <label>Cantidad compra</label>
                                                                                <input ng-model="inventario.cantidadcomp" class="form-control input-sm" decimals="1" type="number" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-4">
                                                                                <label>Cantidad final</label>
                                                                                <input ng-model="inventario.cantidad" class="form-control input-sm" decimals="1" type="number" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-4">
                                                                                <label>Precio compra</label>
                                                                                <input ng-model="inventario.preciounitario" class="form-control input-sm" decimals="2" type="number" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-4">
                                                                                <label>% IGV</label>
                                                                                <input class="form-control input-sm" type="number" disabled="" value="18.00">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-4">
                                                                                <label>% Ganancia</label>
                                                                                <input ng-model="inventario.ganancia" ng-keyup="calcularPrecio(inventario)" ng-class="(inventario.ganancia>=0) ? 'blue' : 'red'" class="form-control input-sm" type="number" step="any">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-3">
                                                                                <label title="Precio descontado por menor">Precio descontado (X Menor)</label>
                                                                                <input ng-model="inventario.preciomenmin" ng-keyup="calcularPrecioInv(inventario)" class="form-control input-sm" title="Precio minimo al contado" decimals="2" type="number" step="any">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-3">
                                                                                <label title="Precio fijo por menor">Precio fijo (X Menor)</label>
                                                                                <input ng-model="inventario.preciomenmax" class="form-control input-sm" decimals="2" type="number" step="any" title="Precio maximo al contado">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-3">
                                                                                <label title="Precio descontado por mayor">Precio descontado (X Mayor)</label>
                                                                                <input ng-model="inventario.preciomaymin" class="form-control input-sm" decimals="2" type="number" step="any" title="Precio minimo al credito">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-3">
                                                                                <label title="Precio fijo por mayor">Precio fijo (X Mayor)</label>
                                                                                <input ng-model="inventario.preciomaymax" class="form-control input-sm" decimals="2" type="number" step="any" title="Precio maximo al credito">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-5">
                                                                                <label>Almacen</label>
                                                                                <select ng-options="almacen as almacen.nombre for almacen in almacenes track by almacen.id" ng-model="inventario.andamio.almacen" ng-change="listarAndamios(almacen)" ng-if="inventario.cambio" name="almacen" class="form-control input-sm" required=""></select>
                                                                                <input ng-model="inventario.andamio.almacen.nombre" ng-if="!inventario.cambio" class="form-control input-sm" type="text" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-5">
                                                                                <label>Andamio</label>
                                                                                <select ng-options="andamio as andamio.nombre for andamio in andamios track by andamio.id" ng-model="inventario.andamio" ng-if="inventario.cambio" class="form-control input-sm" required=""></select>
                                                                                <input ng-model="inventario.andamio.nombre" ng-if="!inventario.cambio" class="form-control input-sm" type="text" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-2 btn-colf">
                                                                                <a href="javascript:void(0)" ng-click="editarInventario(inventario)"><i class="fa fa-edit"></i> Editar</a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <fieldset>
                                                                                <legend>Ubicaciones existentes</legend>
                                                                                <div class="col-xs-12">
                                                                                    <button ng-repeat="inv in inventario.inventarios" ng-click="editarUbicacioninventario(inventario, inv)" type="button" class="btn btn-warning btn-sm">{{inv.andamio.almacen.nombre}} ({{inv.andamio.nombre}})</button>
                                                                                    <p ng-if="inventario.inventarios.length <= 0" class="purple">No registros de ubicaciones existentes</p>
                                                                                </div>
                                                                            </fieldset>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <div class="col-ss-12 col-xs-12">
                                                    <button type="submit" class="btn btn-primary btn-sm">Registrar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>

        <div id="modalCompra" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Busqueda de compras</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="row">
                                    <div class="col-ss-12 col-xs-3">
                                        <label>Fecha inicio</label>
                                        <input ng-model="comprab.fechusuariocrea" class="form-control input-sm" id="fechusuariocrea">
                                    </div>
                                    <div class="col-ss-12 col-xs-3">
                                        <label>Fecha fin</label>
                                        <input ng-model="comprab.fechusuariomod" class="form-control input-sm" id="fechusuariomod">
                                    </div>
                                    <div class="col-ss-12 col-xs-3">
                                        <label>Estado compra</label>
                                        <select ng-options="estadocompra as estadocompra.nombre for estadocompra in estadocompras track by estadocompra.id" ng-model="comprab.idtestadocompra" class="form-control input-sm" disabled=""></select>
                                    </div>
                                    <div class="col-ss-12 col-xs-3" style="padding-top: 25px">
                                        <button ng-click="buscarCompraPorFechaCompl()" type="button" class="btn btn-primary btn-sm">Buscar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 15px">
                            <div class="col-ss-12 col-xs-12">
                                <table class="table table-striped jambo_table">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Codigo comp.</th>
                                            <th>Proveedor</th>
                                            <th>Monto comp.</th>
                                            <th>Fecha</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-show="compras.length > 0" dir-paginate="compra in compras|itemsPerPage:10" pagination-id="tc" ng-click="seleccion2(compra)">
                                            <td>{{compra.id}}</td>
                                            <td>{{compra.codigo}}</td>
                                            <td ng-if="compra.proveedor.proveedorjuridico !== undefined">{{compra.proveedor.proveedorjuridico.razonsocial}} ({{compra.proveedor.proveedorjuridico.nombrecomercial}})</td>
                                            <td ng-if="compra.proveedor.proveedornatural !== undefined">{{compra.proveedor.proveedornatural.nombre}} {{compra.proveedor.proveedornatural.apellidopat}} {{compra.proveedor.proveedornatural.apellidomat}}</td>
                                            <td>{{compra.montototal}}</td>
                                            <td>{{compra.fechusuariocrea}}</td>
                                        </tr>
                                        <tr ng-show="compras.length <= 0">
                                            <td colspan="5" class="dataTables_empty">No se encontro ningun registro de compra</td>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/compraModule.js" type="text/javascript"></script>
        <script>
                                                    $('#fechusuariocrea').datepicker({dateFormat: 'yy-mm-dd'});
                                                    $('#fechusuariomod').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>
