
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="ventaModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro venta</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
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
    <body class="nav-md body-red" ng-controller="registroController" ng-cloak="">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>

                <div class="right_col">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h5 style="font-weight: bold">${cajero.caja.nombre} </h5>
                                <h5 style="font-weight: bold">Saldo: <text style="font-size: 15px">{{cajero.saldocierre|currency:'S/. ':2}}</text></h5>
                                <a href="${pageContext.request.contextPath}/pos/venta/cierrecaja" class="btn btn-primary btn-sm"><i class="fa fa-building-o"></i> Cerrar caja</a>
                            </div>
                            <div class="title_right" style="text-align: right">
                                <h5 style="font-weight: bold">Fecha apertura: ${cajero.fechaapertura} </h5>
                                <h5 style="font-weight: bold">Direccion IP: <text style="color: blueviolet">${ip}</text></h5>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Ventas</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Cobros</a>
                                        </li>
                                    </ul>
                                    <div id="myTabContent" class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <fieldset>
                                                        <legend>Venta</legend>
                                                        <div class="row" style="padding-bottom: 15px">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <form name="formulariov" ng-submit="registrarv(formulariov)" ng-validate="validatev">
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-3 col-sm-2">
                                                                                    <label>Codigo <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="venta.codigo" name="codigo" type="text" class="form-control input-sm" disabled="">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                    <label>Tipo <span class="span-salmon">(*)</span></label>
                                                                                    <select ng-options="tipoprecio as tipoprecio.nombre for tipoprecio in tipoprecios track by tipoprecio.id" ng-model="tipoprecio" name="tipoprecio" class="form-control input-sm">
                                                                                    </select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-3 col-sm-3">
                                                                                    <label>Forma pago <span class="span-salmon">(*)</span></label>
                                                                                    <select ng-options="tipoventa as tipoventa.nombre for tipoventa in tipoventas track by tipoventa.id" ng-model="venta.idttipoventa" name="idttipoventa" class="form-control input-sm">
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-3 col-sm-2">
                                                                                    <label>Id Cliente <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="venta.cliente.id" name="idcliente" type="number" class="form-control input-sm" disabled="">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-9 col-sm-7">
                                                                                    <label>Nombre Cliente <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="venta.nombrecliente" name="nombrecliente" type="text" class="form-control input-sm" uppercased auto-complete2="buscarCNombre">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                    <label>DNI/RUC</label>
                                                                                    <input ng-model="dniruc" name="dniruc" type="number" class="form-control input-sm" auto-complete2="buscarCDni">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                                    <label title="Tipo comprobante de Venta">Tipo comp. <span class="span-salmon">(*)</span></label>
                                                                                    <select ng-options="tipocomprobante as tipocomprobante.nombre for tipocomprobante in tipocomprobantes track by tipocomprobante.id" ng-model="tipocomprobante" ng-change="listarComprobantes()" ng-disabled="venta.idttipoventa.iditem === 2" name="idttipocomprobante" class="form-control input-sm">
                                                                                    </select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                    <label>Comprobante <span class="span-salmon">(*)</span></label>
                                                                                    <select ng-options="comprobante as comprobante.nombre for comprobante in comprobantes track by comprobante.id" ng-model="comprobante" ng-disabled="tipocomprobante.codigo === '60' || venta.idttipoventa.iditem === 2" name="comprobante" class="form-control input-sm">
                                                                                    </select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                                    <label title="Numero comprobante">N° comp.</label>
                                                                                    <input ng-model="comprobante.numeroc" name="nrocomprobante" class="form-control input-sm" placeholder="NUMERO" disabled="">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                                    <label title="Serie comprobante">Serie comp.</label>
                                                                                    <input ng-model="comprobante.seriec" name="seriecomprobante" class="form-control input-sm" placeholder="SERIE" disabled="">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                    <label>Fecha Venta <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="venta.fechasalida" name="fechasalida" class="form-control input-sm">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                                    <label>Monto venta <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="venta.montototal" name="montototal" type="number" decimals="2" class="form-control input-sm" disabled="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-12">
                                                                                    <label>Observacion </label>
                                                                                    <textarea ng-model="venta.observacion" name="observacion" class="form-control input-sm" rows="4" uppercased></textarea>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                                <form name="formulariodtv" ng-validate="validatedtv">
                                                                    <div class="row" style="padding-top: 15px">
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <div class="x_panel">
                                                                                <div class="x_title">
                                                                                    <h2 style="color: blueviolet">Detalle venta</h2>
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
                                                                                            <input ng-model="codigoproducto" name="codigo" ng-enter="agregarDetalleventa(formulariodtv)" type="text" class="form-control input-sm" placeholder="CODIGO" uppercased auto-complete="buscarProductoPorCodigo">
                                                                                        </div>
                                                                                        <div class="col-ss-12 col-xs-10">
                                                                                            <label>Nombre producto <span class="span-salmon">(*)</span></label>
                                                                                            <input ng-model="nombreproducto" name="nombre" ng-enter="agregarDetalleventa(formulariodtv)" type="text" class="form-control input-sm" placeholder="NOMBRE DE PRODUCTO" uppercased auto-complete="buscarProductoPorNombre">
                                                                                        </div>
                                                                                        <div class="col-ss-12 col-xs-12 btn-col">
                                                                                            <table class="table table-striped">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>Id</th>
                                                                                                        <th>Producto</th>
                                                                                                        <th>Precio</th>
                                                                                                        <th>Stock</th>
                                                                                                        <th>Precio</th>
                                                                                                        <th>Cantidad</th>
                                                                                                        <th>Total</th>
                                                                                                        <th>Accion</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <tr ng-show="detalleventas.length > 0" dir-paginate="detalleventa in detalleventas|itemsPerPage:10" pagination-id="tdc">
                                                                                                        <td>-</td>
                                                                                                        <td>{{detalleventa.producto.nombre}}</td>
                                                                                                        <td><text ng-if="tipoprecio.id === 1">({{detalleventa.inventario.preciomenmin|currency:'S/.':2}} ~ {{detalleventa.inventario.preciomenmax|currency:'S/.':2}})</text><text ng-if="tipoprecio.id === 2">({{detalleventa.inventario.preciomaymin|currency:'S/.':2}} ~ {{detalleventa.inventario.preciomaymax|currency:'S/.':2}})</text></td>
                                                                                                        <td>{{detalleventa.inventario.cantidad}} Items</td>
                                                                                                        <td>
                                                                                                            <input ng-if="tipoprecio.id === 1" ng-model="detalleventa.preciounitario" ng-keyup="calcularSubtotal(detalleventa)" name="preciounitario{{$index}}" class="form-control input-sm" type="number" decimals="2" min="{{detalleventa.inventario.preciomenmin}}" max="{{detalleventa.inventario.preciomenmax}}" style="max-width: 100px">
                                                                                                            <input ng-if="tipoprecio.id === 2" ng-model="detalleventa.preciounitario" ng-keyup="calcularSubtotal(detalleventa)" name="preciounitario{{$index}}" class="form-control input-sm" type="number" decimals="2" min="{{detalleventa.inventario.preciomaymin}}" max="{{detalleventa.inventario.preciomaymax}}" style="max-width: 100px">
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <input ng-model="detalleventa.cantidad" ng-keyup="calcularSubtotal(detalleventa)" name="cantidad{{$index}}" class="form-control input-sm" type="number" decimals="1" min="0.1" max="{{detalleventa.inventario.cantidad}}" style="max-width: 100px">
                                                                                                        </td>
                                                                                                        <td>{{detalleventa.subtotal|currency:'S/. ':2}}</td>
                                                                                                        <td><a href="javascript:void(0)" ng-click="quitarDetalleventa(detalleventa)" style="color: red"><i class="fa fa-trash"></i> Quitar</a></td>
                                                                                                    </tr>
                                                                                                    <tr ng-show="detalleventas.length <= 0">
                                                                                                        <td colspan="8" class="dataTables_empty">No hay registros de detalles de compra</td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <dir-pagination-controls
                                                                                                max-size="5"
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
                                                                <div class="col-ss-12 col-xs-12">
                                                                    <button type="button" ng-click="registrarv(formulariov, formulariodtv)" class="btn btn-primary btn-sm">Registrar</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset>
                                                        <legend>Registro de ventas</legend>
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                                <table class="table table-striped jambo_table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>N°</th>
                                                                            <th>Codigo</th>
                                                                            <th>Cliente</th>
                                                                            <th>Nro comprobante</th>
                                                                            <th>Sre Comprobante</th>
                                                                            <th>Monto</th>
                                                                            <th>Fecha</th>
                                                                            <th>Opt.</th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="ventas.length > 0" dir-paginate="venta in ventas|itemsPerPage:15" pagination-id="tv">
                                                                            <td>{{$index}}</td>
                                                                            <td>{{venta.codigo}}</td>
                                                                            <td>{{venta.nombrecliente}}</td>
                                                                            <td>{{venta.nrocomprobante}}</td>
                                                                            <td>{{venta.seriecomprobante}}</td>
                                                                            <td>{{venta.montototal|currency:'S/. ':2}}</td>
                                                                            <td>{{venta.fechasalida}}</td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="mostrarv(venta)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                                            </td>
                                                                            <td>
                                                                                <text ng-show="venta.idttipocomprobante === 19">-</text>
                                                                                <a ng-show="venta.idttipocomprobante !== 19" href="javascript:void(0)" ng-click="impComp(venta)" style="color: blue"><i class="fa fa-file-pdf-o"></i> Recibo.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="ventas.length <= 0">
                                                                            <td colspan="9" class="dataTables_empty">No se encontró ningun registro</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <dir-pagination-controls
                                                                    max-size="5"
                                                                    direction-links="true"
                                                                    boundary-links="true"
                                                                    pagination-id="tv">
                                                                </dir-pagination-controls>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <fieldset>
                                                        <legend>Busqueda de cliente</legend>
                                                        <div class="row" style="padding-bottom: 15px">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <div class="row">
                                                                    <fieldset>
                                                                        <div class="col-ss-12 col-xs-3 col-sm-2">
                                                                            <label>Id Cliente <span class="span-salmon">(*)</span></label>
                                                                            <input ng-model="busqueda.cliente.id" name="idcliente" type="number" class="form-control input-sm" disabled="">
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-9 col-sm-7">
                                                                            <label>Nombre Cliente <span class="span-salmon">(*)</span></label>
                                                                            <input ng-model="busqueda.nombrecliente" name="nombrecliente" type="text" class="form-control input-sm" uppercased auto-complete3="buscarCNombre2">
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                            <label>DNI/RUC</label>
                                                                            <input ng-model="busqueda.dniruc" name="dniruc" type="number" class="form-control input-sm" auto-complete3="buscarCDni2">
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                        <label title="Tipo comprobante de Venta">Tipo comp. <span class="span-salmon">(*)</span></label>
                                                                        <select ng-options="tipocomprobante2 as tipocomprobante2.nombre for tipocomprobante2 in tipocomprobantes2 track by tipocomprobante2.id" ng-model="tipocomprobante2" ng-change="listarComprobantes2()" name="idttipocomprobante" class="form-control input-sm">
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                        <label>Comprobante <span class="span-salmon">(*)</span></label>
                                                                        <select ng-options="comprobante2 as comprobante2.nombre for comprobante2 in comprobantes2 track by comprobante2.id" ng-model="comprobante2" name="comprobante" class="form-control input-sm">
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                        <label title="Numero comprobante">N° comp.</label>
                                                                        <input ng-model="comprobante2.numeroc" name="nrocomprobante" class="form-control input-sm" placeholder="NUMERO" disabled="">
                                                                    </div>
                                                                    <div class="col-ss-12 col-xs-6 col-sm-2">
                                                                        <label title="Serie comprobante">Serie comp.</label>
                                                                        <input ng-model="comprobante2.seriec" name="seriecomprobante" class="form-control input-sm" placeholder="SERIE" disabled="">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <fieldset>
                                                                        <legend>Creditos por pagar</legend>
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <div class="panel-group" id="accordion">
                                                                                <form name="cuotaform" ng-validate="validateCuotaform">
                                                                                    <div class="panel panel-default" ng-repeat="credito in creditos">
                                                                                        <div class="panel-heading">
                                                                                            <h4 class="panel-title">
                                                                                                <a style="color: blueviolet" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$index}}">
                                                                                                    {{credito.montoa|currency:'S/. ':2}}
                                                                                                </a>
                                                                                                <a style="float: right;text-decoration: none">
                                                                                                    Fecha venta: {{credito.fecha}}
                                                                                                </a>
                                                                                            </h4>
                                                                                        </div>
                                                                                        <div id="collapse{{$index}}" class="panel-collapse collapse">
                                                                                            <div class="panel-body">
                                                                                                <div class="row">
                                                                                                    <div class="col-ss-12 col-xs-4 col-sm-2">
                                                                                                        <label>Codigo venta</label>
                                                                                                        <input ng-model="credito.venta.codigo" class="form-control input-sm" type="text" disabled="">
                                                                                                    </div>
                                                                                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                                        <label>Total</label>
                                                                                                        <input ng-model="credito.monto" class="form-control input-sm" type="number" disabled="">
                                                                                                    </div>
                                                                                                    <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                                                        <label>Deuda</label>
                                                                                                        <input ng-model="credito.montoa" class="form-control input-sm red bold" type="number" disabled="">
                                                                                                    </div>
                                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                                        <label>Importe a pagar</label>
                                                                                                        <input ng-model="credito.cuota" min="0.1" max="{{credito.montoa}}" required="true" class="form-control input-sm" type="number">
                                                                                                    </div>
                                                                                                    <div class="col-ss-12 col-xs-6 col-sm-4 btn-col">
                                                                                                        <button class="btn-primary btn-sm" ng-click="cobrarCuota(credito, cuotaform)">Cobrar</button>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-12" ng-show="creditos.length <= 0">
                                                                            <p>No hay creditos por pagar de este cliente</p>
                                                                        </div>
                                                                    </fieldset>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset>
                                                        <legend>Registro de cobros</legend>
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                                <table class="table table-striped jambo_table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>N°</th>
                                                                            <th>Cliente</th>
                                                                            <th>Nro comprobante</th>
                                                                            <th>Sre Comprobante</th>
                                                                            <th>Monto</th>
                                                                            <th>Fecha</th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="cuotas.length > 0" dir-paginate="cuota in cuotas|itemsPerPage:15" pagination-id="tc">
                                                                            <td>{{$index}}</td>
                                                                            <td>{{cuota.nombrecliente}}</td>
                                                                            <td>{{cuota.nrocomprobante}}</td>
                                                                            <td>{{cuota.seriecomprobante}}</td>
                                                                            <td>{{cuota.monto|currency:'S/. ':2}}</td>
                                                                            <td>{{cuota.fecha}}</td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="impCompCuota(cuota)" style="color: blue"><i class="fa fa-file-pdf-o"></i> Recibo.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="cuotas.length <= 0">
                                                                            <td colspan="7" class="dataTables_empty">No se encontró ningun registro</td>
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
                                                    </fieldset>
                                                </div>
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

        <script src="${pageContext.request.contextPath}/assets/controller/pos/ventaModule.js" type="text/javascript"></script>

        <script type = "text/javascript">
                                                                                    $('form[name=formulariov] input[name=fechasalida]').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>

