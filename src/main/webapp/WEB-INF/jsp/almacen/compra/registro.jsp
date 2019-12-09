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
        <title>Registro de compra</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
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

        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/fileupload/fileinput.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="registroController" ng-cloak>
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
                                        <h2>REGISTRAR COMPRA</h2>
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
                                            <div class="col-ss-12 col-xs-9">
                                                <form name="formularioc" ng-validate="validatec" ng-submit="registrarc(formularioc)">
                                                    <div class="col-ss-12 col-xs-12 col-sm-12">
                                                        <div class="panel panel-primary">
                                                            <div class="panel-heading">
                                                                <label>DATOS  PRINCIPALES  COMPRA</label>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                        <label>CÓDIGO COMPRA<span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="compra.codigo" name="codigocompra" type="text" class="form-control input-sm" disabled="">
                                                                    </div>
                                                                    <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                        <label>CÓDIGO PROVEEDOR</label>
                                                                        <input ng-model="compra.proveedor.codigo" name="codigoproveedor" type="text" class="form-control input-sm" disabled="">
                                                                    </div>
                                                                    <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                        <label>RUC/DNI<span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="documento" name="documento" type="text" class="form-control input-sm" auto-complete2="buscarProveedorPorDocumento">
                                                                    </div>
                                                                    <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                        <label>ESTADO COMPRA<span class="span-salmon">(*)</span></label>
                                                                        <select ng-options="estadocompra as estadocompra.nombre for estadocompra in estadocompras track by estadocompra.id" ng-model="compra.idtestadocompra" name="estadocompra" class="form-control input-sm" disabled="">
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-ss-12 col-xs-6 col-sm-6">
                                                                        <label>NOMBRE PROVEEDOR<span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="nombreproveedor" name="nombreproveedor" type="text" class="form-control input-sm" auto-complete2="buscarProveedorPorNombre" uppercased>
                                                                    </div>
                                                                    <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                        <label>FECHA COMPRA<span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="compra.fechacompra" name="fechacompra" class="form-control input-sm" placeholder="--2016-12-21--">
                                                                    </div>
                                                                    <div class="form-group col-ss-12 col-xs-4 col-sm-3 has-feedback">
                                                                        <label>MONTO COMPRA<span class="span-salmon">(*)</span></label>
                                                                        <input ng-model="compra.montototal" name="montototal" decimals="2" type="number" class="form-control has-feedback-left" style="color: blueviolet;font-weight: bold; font-size: 13px" disabled="">
                                                                        <span class="form-control-feedback left" aria-hidden="true" style="background-color: gainsboro; color: blueviolet">S/.</span>
                                                                    </div>
                                                                    <ul class="nav navbar-right panel_toolbox">
                                                                        <li>
                                                                            <a href="javascript:void(0)" data-toggle="modal" data-target="#modalDetallecompra"><i class="fa fa-plus-circle" style="color: blueviolet">Add. Detalle Compra</i></a>
                                                                        </li>
                                                                    </ul>
                                                                    <div class="form-group col-ss-12 col-xs-12 col-sm-12">
                                                                        <label>OBSERVACIÓN</label>
                                                                        <textarea ng-model="compra.observacion" name="observacion" class="form-control input-sm" rows="4" uppercased></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <form name="formulariodtc" ng-validate="validatedtc">
                                                    <div class="row" style="padding-top: 15px">
                                                        <div class="col-ss-12 col-xs-12">
                                                            <div class="x_panel">
                                                                <div class="x_title">
                                                                    <h2 style="color: blueviolet">Detalle Compra</h2>
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
                                                                        <div class="col-ss-12 col-xs-2">
                                                                            <label>Cod. producto <span class="span-salmon">(*)</span></label>
                                                                            <input ng-model="codigoproducto" name="codigo"ng-enter="agregarDetallecompra(formulariodtc)" type="text" class="form-control input-sm" placeholder="CODIGO" uppercased auto-complete="buscarProductoPorCodigo">
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-10">
                                                                            <label>Nombre producto <span class="span-salmon">(*)</span></label>
                                                                            <input ng-model="nombreproducto" name="nombre" ng-enter="agregarDetallecompra(formulariodtc)" type="text" class="form-control input-sm" placeholder="NOMBRE DE PRODUCTO" uppercased auto-complete="buscarProductoPorNombre">
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-12 btn-col">
                                                                            <table class="table table-striped jambo_table">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>Id</th>
                                                                                        <th>Producto</th>
                                                                                        <th>Precio</th>
                                                                                        <th>Cantidad</th>
                                                                                        <th>Cant. Dañado</th>
                                                                                        <th>Cant. Perfect</th>
                                                                                        <th>Total</th>
                                                                                        <th>Accion</th>
                                                                                        <th>Accion</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <tr ng-show="detallecompras.length > 0" dir-paginate="detallecompra in detallecompras|itemsPerPage:5" pagination-id="tdc">
                                                                                        <td>-</td>
                                                                                        <td>{{detallecompra.producto.nombre}}</td>
                                                                                        <td>
                                                                                            <input ng-model="detallecompra.preciounitario" ng-keyup="calcularSubtotal(detallecompra)" name="preciounitario{{$index}}" class="form-control input-sm" type="number" decimals="2" style="max-width: 100px">
                                                                                        </td>
                                                                                        <td>
                                                                                            <input ng-model="detallecompra.cantidad" ng-keyup="calcularSubtotal(detallecompra)" name="cantidad{{$index}}" class="form-control input-sm" type="number" decimals="1" min="0.1" style="max-width: 100px">
                                                                                        </td>
                                                                                        <td>
                                                                                            <input ng-model="detallecompra.cantidaddaniado" ng-keyup="calcularPerfecto(detallecompra)" class="form-control input-sm" type="number" decimals="1" min="0" style="max-width: 100px">
                                                                                        </td>
                                                                                        <td>{{detallecompra.cantidadperfecto}}</td>
                                                                                        <td>{{detallecompra.subtotal|currency:'S/. ':2}}</td>
                                                                                        <td><a href="javascript:void(0)" ng-click="quitarAgregarPorBarras(detallecompra)" style="color: blue"><i class="fa fa-trash"></i> Agregar por Barras</a></td>
                                                                                        <td><a href="javascript:void(0)" ng-click="quitarDetallecompra(detallecompra)" style="color: red"><i class="fa fa-trash"></i> Quitar</a></td>
                                                                                    </tr>
                                                                                    <tr ng-show="detallecompras.length <= 0">
                                                                                        <td colspan="7" class="dataTables_empty">No hay registros de detalles de compra</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <dir-pagination-controls
                                                                                max-size="7"
                                                                                direction-links="true"
                                                                                boundary-links="true"
                                                                                pagination-id="tdc">
                                                                            </dir-pagination-controls>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                            <div class="col-ss-12 col-xs-3">
                                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                                    <div class="panel panel-primary">
                                                        <div class="panel-heading">
                                                            <label>COMPROBANTES</label>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="form-group col-ss-12 col-xs-12 col-sm-12">
                                                                    <label title="Tipo comprobante de compra">TIPO COMPROBANTE<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="tipocomprobante as tipocomprobante.nombre for tipocomprobante in tipocomprobantes track by tipocomprobante.id" ng-model="compra.idttipocomprobante" name="tipocomprobante" class="form-control input-sm">
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-6 col-sm-6">
                                                                    <label title="Serie comprobante">Serie Comprobante</label>
                                                                    <input ng-model="compra.seriecomprobante" name="seriecomprobante" class="form-control input-sm" placeholder="001">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-6 col-sm-6">
                                                                    <label title="Numero comprobante">N° Comprobante</label>
                                                                    <input ng-model="compra.nrocomprobante" name="nrocomprobante" class="form-control input-sm" placeholder="000001">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-12 col-sm-12">
                                                                    <label>COMPROBANTE</label>
                                                                    <input ng-file-model="file" name="file" type="file" class="file form-control" id="file-fr" data-min-file-count="1">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-12 col-sm-12">
                                                                    <label title="Codigo de orden de compra">Cod. orden compra</label>
                                                                    <input ng-model="compra.codordencompra" name="codordencompra" type="text" class="form-control input-sm" placeholder="OC-0001" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-12 col-sm-12">
                                                                    <label>Orden de compra</label>
                                                                    <input ng-file-model="file2" name="file2" type="file" class="file form-control" id="file-fr2" data-min-file-count="1">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <button type="button" ng-click="registrarc(formularioc)" class="btn btn-primary">REGISTRAR</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-ss-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Lista de compras</h2>
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
                                                <table class="table table-striped jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Codigo</th>
                                                            <th>Proveedor</th>
                                                            <th>Estado compra</th>
                                                            <th>Monto</th>
                                                            <th>Comprobante</th>
                                                            <th>Orden compra</th>
                                                            <th>Rpt.</th>
                                                            <th>Opt.</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="compras.length > 0" dir-paginate="compra in compras|itemsPerPage:15" pagination-id="tc">
                                                            <td>{{compra.id}}</td>
                                                            <td>{{compra.codigo}}</td>
                                                            <td>{{compra.proveedor.codigo}}</td>
                                                            <td>{{compra.idtestadocompra.nombre}}</td>
                                                            <td>{{compra.montototal}}</td>
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}{{compra.urlcomprobante}}" target="_blank"><i class="fa fa-file-pdf-o"> Compr.</i></a>
                                                            </td>
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}{{compra.urlordencompra}}" target="_blank"><i class="fa fa-file-pdf-o"> Orden compr.</i></a>
                                                            </td>
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}/almacen/compra/rcompra?type=pdf&&id={{compra.id}}&&idtipoproveedor={{compra.proveedor.idttipoproveedor}}" target="_blank" style="color: blueviolet"><i class="fa fa-file-pdf-o"> Rpt.</i></a>
                                                            </td>
                                                            <td>
                                                                <a ng-if="compra.idtestadocompra.iditem === 1" href="javascript:void(0)" ng-click="eliminarc(compra)" style="color: red"><i class="fa fa-close"> Del.</i></a>
                                                                <a ng-if="compra.idtestadocompra.iditem !== 1" href="javascript:void(0)">-</a>
                                                            </td>
                                                        </tr>
                                                        <tr ng-show="compras.length <= 0">
                                                            <td colspan="9" class="dataTables_empty">No hay registros de compras</td>
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
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>

        <!--<div id="modalProveedor" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formularioma" ng-submit="actualizarma(formularioma)" ng-validate="validatem">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Busqueda de proveedores</h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <label>Tipo proveedor</label>
                                            <select ng-options="tipoproveedor as tipoproveedor.denominacion for tipoproveedor in tipoproveedores track by tipoproveedor.id" ng-model="tipoproveedor" class="form-control input-sm"></select>
                                        </div>
                                    </div>
                                    <div ng-show="tipoproveedor.id === 1" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Ruc (*)</label>
                                                    <input ng-model="personajuridicab.ruc" class="form-control input-sm" type="number" ng-keyup="buscarProveedorjuridico(1)">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Razon social</label>
                                                    <input ng-model="personajuridicab.razonsocial" class="form-control input-sm" type="text" ng-keyup="buscarProveedorjuridico(2)" uppercased>
                                                </div>
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>nombre comercial</label>
                                                    <input ng-model="personajuridicab.nombrecomercial" class="form-control input-sm" type="text" ng-keyup="buscarProveedorjuridico(2)" uppercased>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div ng-show="tipoproveedor.id === 1" class="row" style="padding-top: 15px">
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Razon social</th>
                                                        <th>Nombre comercial</th>
                                                        <th>Fecha fundacion</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="proveedores.length > 0" ng-repeat="proveedor in proveedores" ng-click="seleccionarpj(proveedor)">
                                                        <td>{{proveedor.id}}</td>
                                                        <td>{{proveedor.personajuridica.razonsocial}}</td>
                                                        <td>{{proveedor.personajuridica.nombrecomercial}}</td>
                                                        <td>{{proveedor.personajuridica.fechafundacion}}</td>
                                                    </tr>
                                                    <tr ng-show="proveedores.length <= 0">
                                                        <td colspan="4" class="dataTables_empty">No se encontro ningun registro de proveedor</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div ng-show="tipoproveedor.id !== 1" class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Dni (*)</label>
                                                    <input ng-model="personanaturalb.dni" class="form-control input-sm" type="number" ng-keyup="buscarProveedornatural(1)">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Nombre</label>
                                                    <input ng-model="personanaturalb.nombre" class="form-control input-sm" type="text" uppercased ng-keyup="buscarProveedornatural(2)">
                                                </div>
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Apellido paterno</label>
                                                    <input ng-model="personanaturalb.apellidopat" class="form-control input-sm" type="text" uppercased ng-keyup="buscarProveedornatural(2)">
                                                </div>
                                                <div class="col-ss-12 col-xs-4">
                                                    <label>Apellido materno</label>
                                                    <input ng-model="personanaturalb.apellidomat" class="form-control input-sm" type="text" uppercased ng-keyup="buscarProveedornatural(2)">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div ng-show="tipoproveedor.id !== 1" class="row" style="padding-top: 15px">
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Nombre</th>
                                                        <th>Dni</th>
                                                        <th>Celular</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="proveedores.length > 0" ng-repeat="proveedor in proveedores" ng-click="seleccionarpn(proveedor)">
                                                        <td>{{proveedor.id}}</td>
                                                        <td>{{proveedor.personanatural.nombre}} {{proveedor.personanatural.apellidopat}} {{proveedor.personanatural.apellidomat}}</td>
                                                        <td>{{proveedor.personanatural.dni}}</td>
                                                        <td>{{proveedor.personanatural.celular}}</td>
                                                    </tr>
                                                    <tr ng-show="proveedores.length <= 0">
                                                        <td colspan="4" class="dataTables_empty">No se encontro ningun registro de proveedor</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" style="margin-top: 2px">Actualizar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>  -->


        <!--     <div id="modalDetallecompra" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal">&times;</button>
                             <h4 class="modal-title">Registrar detalle de compra</h4>
                         </div>
                         <div class="modal-body">
                             <div class="row">
                                 <div class="col-ss-12 col-xs-4">
                                     <label>Categoria</label>
                                     <select ng-options="categoria as categoria.denominacion for categoria in categorias track by categoria.id" ng-model="productob.categoria" name="categoria" class="form-control input-sm">
                                     </select>
                                 </div>
                                 <div class="col-ss-12 col-xs-4">
                                     <label>Marca</label>
                                     <select ng-options="marca as marca.denominacion for marca in marcas track by marca.id" ng-model="productob.marca" name="marca" class="form-control input-sm">
                                     </select>
                                 </div>
                                 <div class="col-ss-12 col-xs-4">
                                     <label>Unidad medida</label>
                                     <select ng-options="unidadmedida as unidadmedida.denominacion for unidadmedida in unidadmedidas track by unidadmedida.id" ng-model="productob.unidadmedida" name="unidadmedida" class="form-control input-sm">
                                     </select>
                                 </div>
                                 <div class="col-ss-12 col-xs-4">
                                     <label>Busqueda</label>
                                     <input ng-model="productob.nombre" type="text" class="form-control input-sm" ng-keyup="buscarProductos()" uppercased placeholder="Buscar...">
                                 </div>
                                 <div class="col-ss-12 col-xs-12 btn-col">
                                     <table class="table table-striped jambo_table">
                                         <thead>
                                             <tr>
                                                 <th>Id</th>
                                                 <th>Nombre</th>
                                                 <th>Codigo</th>
                                                 <th>Categoria</th>
                                                 <th>Marca</th>
                                                 <th>Unidad medida</th>
                                                 <th>Accion</th>
                                             </tr>
                                         </thead>
                                         <tbody>
                                             <tr ng-show="productos.length > 0" dir-paginate="producto in productos|itemsPerPage:5" pagination-id="tp">
                                                 <td>{{producto.id}}</td>
                                                 <td>{{producto.nombre}}</td>
                                                 <td>{{producto.codigo}}</td>
                                                 <td>{{producto.categoria.denominacion}}</td>
                                                 <td>{{producto.marca.denominacion}}</td>
                                                 <td>{{producto.unidadmedida.denominacion}}</td>
                                                 <td><a href="javascript:void(0)" ng-click="selecionarDetallecompra(producto)"><i class="fa fa-shopping-cart" style="color: green"> Seleccionar</i></a></td>
                                             </tr>
                                             <tr ng-show="productos.length <= 0">
                                                 <td colspan="7" class="dataTables_empty">No hay registros de productos</td>
                                             </tr>
                                         </tbody>
                                     </table>
                                     <dir-pagination-controls
                                         max-size="5"
                                         direction-links="true"
                                         boundary-links="true"
                                         pagination-id="tp">
                                     </dir-pagination-controls>
                                 </div>
                             </div>
                             <div class="row">
                                 <div class="panel panel-default">
                                     <div class="panel-body">
                                         <fieldset>
                                             <legend style="color: blue">Detalle compra producto <i>{{detallecompra.producto.codigo}}</i></legend> 
                                             <div class="col-ss-12 col-xs-12">
                                                 <form name="formulariodtc" ng-submit="agregarDetallecompra(formulariodtc)" ng-validate="validatedtc">
                                                     <div class="row">
                                                         <div class="col-ss-12 col-xs-8">
                                                             <label>Producto</label>
                                                             <input ng-model="detallecompra.producto.nombre" type="text" class="form-control input-sm" placeholder="....." disabled="">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-4">
                                                             <label>Categoria</label>
                                                             <input ng-model="detallecompra.producto.categoria.denominacion" type="text" class="form-control input-sm" placeholder="....." disabled="">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-6">
                                                             <label>Marca</label>
                                                             <input ng-model="detallecompra.producto.marca.denominacion" type="text" class="form-control input-sm" placeholder="....." disabled="">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-6">
                                                             <label>Unidad medida</label>
                                                             <input ng-model="detallecompra.producto.unidadmedida.denominacion" type="text" class="form-control input-sm" placeholder="....." disabled="">
                                                         </div>
                                                     </div>
                                                     <div class="row">
                                                         <div class="col-ss-12 col-xs-4">
                                                             <label>Cantidad compra</label>
                                                             <input ng-model="detallecompra.cantidad" name="cantidad" ng-keyup="calcularPerfectos()" type="number" class="form-control input-sm" placeholder="Ingrese cantidad">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-4">
                                                             <label>Cantidad items dañados</label>
                                                             <input ng-model="detallecompra.cantidaddaniado" name="cantidaddaniado" ng-keyup="calcularPerfectos()" type="number" class="form-control input-sm" placeholder="Cantidad dañados">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-4">
                                                             <label>Precio unitario</label>
                                                             <input ng-model="detallecompra.preciounitario" name="preciounitario" ng-keyup="calcularSubtotal()" type="number" class="form-control input-sm" placeholder="Ingrese precio">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-4">
                                                             <label>Cantidad items perfectos</label>
                                                             <input ng-model="detallecompra.cantidadperfecto" name="cantidadperfecto" type="number" class="form-control input-sm" placeholder="Cantidad perfectos" disabled="">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-4">
                                                             <label>Sub total</label>
                                                             <input ng-model="detallecompra.subtotal" name="subtotal" type="number" class="form-control input-sm" placeholder="Sub total" disabled="">
                                                         </div>
                                                         <div class="col-ss-12 col-xs-12 btn-col">
                                                             <button type="submit" class="btn btn-success input-sm"><i class="fa fa-shopping-cart"></i> Agregar</button>
                                                         </div>
                                                     </div>
                                                 </form>
                                             </div>
                                         </fieldset>
                                         <fieldset style="padding-top: 15px">
                                             <legend>Detalle compra</legend>
                                             <div class="col-ss-12 col-xs-12">
                                                 <table class="table table-striped jambo_table">
                                                     <thead>
                                                         <tr>
                                                             <th>Id</th>
                                                             <th>Producto</th>
                                                             <th>Precio</th>
                                                             <th>Cantidad</th>
                                                             <th>Total</th>
                                                             <th>Accion</th>
                                                         </tr>
                                                     </thead>
                                                     <tbody>
                                                         <tr ng-show="detallecompras.length > 0" dir-paginate="detallecompra in detallecompras|itemsPerPage:5" pagination-id="tdc2">
                                                             <td>-</td>
                                                             <td>{{detallecompra.producto.nombre}}</td>
                                                             <td>{{detallecompra.preciounitario}}</td>
                                                             <td>{{detallecompra.cantidad}}</td>
                                                             <td>{{detallecompra.subtotal}}</td>
                                                             <td><a href="javascript:void(0)" ng-click="quitarDetallecompra(detallecompra)" style="color: red"><i class="fa fa-trash"></i> Quitar</a></td>
                                                         </tr>
                                                         <tr ng-show="detallecompras.length <= 0">
                                                             <td colspan="6" class="dataTables_empty">No hay registros de detalles de compra</td>
                                                         </tr>
                                                     </tbody>
                                                 </table>
                                                 <dir-pagination-controls
                                                     max-size="5"
                                                     direction-links="true"
                                                     boundary-links="true"
                                                     pagination-id="tdc2">
                                                 </dir-pagination-controls>
                                             </div>
                                         </fieldset>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div> 
        -->

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/compraModule.js" type="text/javascript"></script>
        <script>
                                                                    $('#file-fr').fileinput({
                                                                        allowedFileExtensions: ['pdf', 'doc', 'docx'],
                                                                        maxFileSize: 100000,
                                                                        maxFileCount: 1
                                                                    });

                                                                    $('#file-fr2').fileinput({
                                                                        allowedFileExtensions: ['pdf', 'doc', 'docx'],
                                                                        maxFileSize: 100000,
                                                                        maxFileCount: 1
                                                                    });

                                                                    $('form[name=formularioc] input[name=fechacompra]').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>
