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
        <title>INVENTARIO PRODUCTO</title>
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

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="inventarioController" ng-cloak>
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
                                        <h2>INVENTARIO DE PRODUCTOS</h2>
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
                                            <div class="col-ss-12 col-xs-9 col-sm-10">
                                                <div class="form-group col-ss-12 col-xs-6 col-sm-7">
                                                    <label form="nombreprodinvt">NOMBRE</label>
                                                    <input id="nombreprodinvt" ng-model="producto.nombre" class="form-control input-sm" type="text" uppercased auto-complete="buscarProductoPorNombre">
                                                </div>
                                                <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                    <label for="codigoproductinv">CÓDIGO</label>
                                                    <input id="codigoproductinv" ng-model="producto.codigo" class="form-control input-sm" type="text" uppercased auto-complete="buscarProductoPorCodigo">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-7 btn-col">
                                                    <div class="left col-xs-12">
                                                        <ul class="list-unstyled">
                                                            <li><i class="fa fa-sign-out"></i> PRODUCTO: {{producto.nombre}}</li>
                                                            <li><i class="fa fa-sign-out"></i> CÓDIGO: {{producto.codigo}}</li>
                                                            <li><i class="fa fa-info-circle"></i><strong> CATEGORIA: </strong> {{producto.categoria.denominacion}}</li>
                                                            <li><i class="fa fa-info-circle"></i> <strong>MARCA: </strong> {{producto.marca.denominacion}}</li>
                                                            <li><i class="fa fa-info-circle"></i> <strong>UNIDAD MEDIDA: </strong> {{producto.idtunidadmedida}}</li>
                                                            <li><i class="fa fa-info-circle"></i> <strong>TIPO PRODUCTO: </strong> {{producto.idttipo}}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-5 btn-col">
                                                    <div class="left col-xs-12">
                                                        <ul class="list-unstyled">
                                                            <li ng-show="producto.estado === true">
                                                                <i class="fa fa-sign-out"></i> Estado: ACTIVO
                                                            </li>
                                                            <li ng-show="producto.estado === false">
                                                                <i class="fa fa-sign-out"></i> Estado: INACTIVO
                                                            </li>
                                                            <li><i class="fa fa-sign-out"></i> Usuario creación    : {{producto.idusuariocrea}}</li>
                                                            <li><i class="fa fa-sign-out"></i> Fecha creación      : {{producto.fechusuariocrea}}</li>
                                                            <li><i class="fa fa-sign-out"></i> Usuario modificación: {{producto.idusuariocrea}}</li>
                                                            <li><i class="fa fa-sign-out"></i> Fecha modificación  : {{producto.fechusuariocrea}}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-12">
                                                    <div class="left col-xs-12">
                                                        <ul class="list-unstyled">
                                                            <li><i class="fa fa-angle-double-right"></i>DESCRIPCIÓN : {{producto.descripcion}}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hidden-ss col-ss-12 col-xs-3 col-sm-2">
                                                <img ng-src="${pageContext.request.contextPath}{{producto.urlfoto}}" alt="${pageContext.request.contextPath}/assets/files/img/producto.jpg" class="img-rounded img-responsive">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <fieldset>
                                                <legend>INVENTARIO Y UBICACIONES</legend>
                                                <div ng-if="inventarios.length <= 0" class="col-ss-12 col-xs-12 col-sm-12 animated fadeInDown"><a href="javascript:void(0)" ng-click="agregarInventario()"><i class="fa fa-plus-square" style="color: blue">AGREGAR INVENTARIO</i></a></div>
                                                <div ng-if="inventarios.length > 0" class="col-ss-12 col-xs-6 col-sm-4 animated fadeInDown" ng-repeat="inv in inventarios">
                                                    <div class="well profile_view">
                                                        <form name="finv" ng-submit="registrarInventario(inv)">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <a class="title">INGRESO: <i ng-if="inv.id !== 0">{{inv.fechusuariocrea}}</i><i ng-if="inv.id === 0">HOY</i></a>
                                                                <a ng-if="inv.id === 0" ng-click="quitarInventario(inv)" href="javascript:void(0)" class="pull-right" style="color: red"><i class="fa fa-close"></i></a>
                                                                <div class="left col-ss-12 col-xs-12" ng-if="!inv.modif">
                                                                    <p><strong>ALMACEN: </strong>{{inv.andamio.almacen.nombre}}</p>
                                                                    <p><strong>ANDAMIO: </strong>{{inv.andamio.nombre}}</p>
                                                                    <ul class="list-unstyled">
                                                                        <li><i class="fa fa-sign-out"></i> CANTIDAD: {{inv.cantidad}} <small>{{inv.nabreviatura}}</small></li>
                                                                        <li><i class="fa fa-sign-out"></i> PRECIO DESCONTADO (X Menor): {{inv.preciomenmin}}</li>
                                                                        <li><i class="fa fa-sign-out"></i> PRECIO FIJO (X Menor): {{inv.preciomenmax}}</li>
                                                                        <li><i class="fa fa-sign-out"></i> PRECIO DESCONTADO (X Mayor): {{inv.preciomaymin}}</li>
                                                                        <li><i class="fa fa-sign-out"></i> PRECIO FIJO (X Mayor): {{inv.preciomaymax}}</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="left col-ss-12 col-xs-12" ng-if="inv.modif">
                                                                    <div class="row">
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label>ALMACEN</label>
                                                                            <select ng-options="almacen as almacen.nombre for almacen in almacenes track by almacen.id" ng-model="inv.andamio.almacen" ng-change="listarAndamio2(inv.andamio.almacen, inv)" name="almacen" class="form-control input-sm" required=""></select>
                                                                        </div>
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label>ANDAMIO</label>
                                                                            <select ng-options="andamio as andamio.nombre for andamio in andamios track by andamio.id" ng-model="inv.andamio" name="andamio" class="form-control input-sm" required=""></select>
                                                                        </div>
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label for="cantidadinvprod">CANTIDAD</label>
                                                                            <input id="cantidadinvprod" ng-model="inv.cantidad" class="form-control input-sm has-feedback-left" decimals="1" type="number" required="" placeholder="CANTIDAD">
                                                                            <span class="form-control-feedback left" aria-hidden="true" style="background-color: gainsboro; color: blueviolet; margin-top: 25px">{{inv.abreviatura}}</span>
                                                                        </div>
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label for="pdxmenor">PRECIO DESCONTADO (X Menor)</label>
                                                                            <input id="pdxmenor" ng-model="inv.preciomenmin" decimals="2" name="preciomenmin" class="form-control input-sm" type="number" step="any" placeholder="PRECIO MINIMO AL CONTADO" required="">
                                                                        </div>
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label for="pfxmenor">PRECIO FIJO (X Menor)</label>
                                                                            <input id="pfxmenor" ng-model="inv.preciomenmax" decimals="2" name="preciomenmax" class="form-control input-sm" type="number" step="any" placeholder="PRECIO MAXIMO AL CONTADO" required="">
                                                                        </div>
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label for="pdxmayor">PRECIO DESCONTADO (X Mayor)</label>
                                                                            <input id="pdxmayor" ng-model="inv.preciomaymin" decimals="2" name="preciomaymin" class="form-control input-sm" type="number" step="any" placeholder="PRECIO MINIMO AL CREDITO" required="">
                                                                        </div>
                                                                        <div class="form-group col-ss-12 col-xs-12">
                                                                            <label for="pfxmayor">PRECIO FIJO(X Mayor)</label>
                                                                            <input id="pfxmayor" ng-model="inv.preciomaymax" decimals="2" name="preciomaymax" class="form-control input-sm" type="number" step="any" placeholder="PRECIO MAXIMO AL CREDITO" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12 bottom">
                                                                <div class="col-ss-12 col-xs-12">
                                                                    <button ng-if="!inv.modif" ng-click="seleccionarInventario(inv)" type="button" class="btn btn-primary btn-xs"><i class="fa fa-money"></i>MODIFICAR</button>
                                                                    <button ng-if="inv.modif" type="submit" class="btn btn-success btn-xs"><i class="fa fa-money"></i>GUARDAR</button>
                                                                    <button ng-if="inv.modif" ng-click="cancelarInventario()" type="button" class="btn btn-primary btn-xs"><i class="fa fa-money"></i>CANCELAR</button>
                                                                    <button ng-if="inv.id !== 0" ng-click="eliminarInventario(inv)" type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>ELIMINAR</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-3" ng-if="inventarios.length > 0"><a href="javascript:void(0)" ng-click="agregarInventario()"><i class="fa fa-plus-square" style="color: blue">AGREGAR INVENTARIO</i></a></div>
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/administracionModule.js" type="text/javascript"></script>
    </body>
</html>