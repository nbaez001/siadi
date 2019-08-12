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
        <title>Formato 13.1</title>
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
    <body class="nav-md" ng-controller="formato131Controller" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>

                <div class="right_col">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Formato 13.1 SUNAT </h4>
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
                                        <h2>Registro del inventario permanente con saldos</h2>
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
                                            <div class="col-ss-12 col-xs-5 col-sm-4">
                                                <div class="row">
                                                    <div class="col-ss-12 col-xs-6" style="margin-bottom: 5px">
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <label>Buscar producto</label>
                                                                <input type="text" ng-model="buscar" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="hidden-ss col-xs-4" style="text-align: right">
                                                        <img src="${pageContext.request.contextPath}/assets/files/img/aqui.gif" class="right" alt="" style="height: 50px;">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12">
                                                        <table class="table table-striped jambo_table">
                                                            <thead>
                                                                <tr>
                                                                    <th ng-click="sort('codigo')">Cod.
                                                                        <span class="glyphicon sort-icon" ng-show="sortKey === 'codigo'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':
                                                                                    !reverse}"></span>
                                                                    </th>
                                                                    <th ng-click="sort('nombre')">Producto
                                                                        <span class="glyphicon sort-icon" ng-show="sortKey === 'nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':
                                                                                    !reverse}"></span>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr ng-show="productos.length > 0" dir-paginate="producto in productos|itemsPerPage:5|filter:buscar|orderBy:sortKey:reverse" pagination-id="tp" ng-click="mostrarDetallemovimiento(producto)">
                                                                    <td>{{producto.codigo}}</td>
                                                                    <td>{{producto.nombre}}</td>
                                                                </tr>
                                                                <tr ng-show="productos.length <= 0">
                                                                    <td colspan="2" class="dataTables_empty">No hay registros de productos</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12" style="text-align: center">
                                                        <dir-pagination-controls
                                                            max-size="5"
                                                            direction-links="true"
                                                            boundary-links="true"
                                                            pagination-id="tp">
                                                        </dir-pagination-controls>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-7 col-sm-8">
                                                <div class="row">
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Periodo</label>
                                                        <input class="form-control input-sm" type="text" disabled="" value="{{mes.nombre}} {{anio.anio}}">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-ss-12 col-xs-5">
                                                        <label>Ruc</label>
                                                        <input ng-model="empresa.ruc" class="form-control input-sm" type="number" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-7">
                                                        <label>Razon social</label>
                                                        <input ng-model="empresa.razonsocial" class="form-control input-sm" type="text" disabled="">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-12">
                                                        <label>Establecimiento</label>
                                                        <input ng-model="empresa.direccion" class="form-control input-sm" type="text" disabled="">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Codigo existencia</label>
                                                        <input ng-model="producto.codigo" class="form-control input-sm" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-8">
                                                        <label>Descripcion</label>
                                                        <input ng-model="producto.nombre" class="form-control input-sm" type="text">
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 has-feedback">
                                                        <label>Tipo (TABLA 5)</label>
                                                        <input ng-model="producto.idttipo.nombre" class="form-control input-sm has-feedback-left" type="text">
                                                        <span class="form-control-feedback left" aria-hidden="true" style="background-color: gainsboro; color: blueviolet">{{producto.idttipo.codigo}}</span>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-6 has-feedback">
                                                        <label>Unidad medida (TABLA 6)</label>
                                                        <input ng-model="producto.idtunidadmedida.nombre" class="form-control input-sm has-feedback-left" type="text">
                                                        <span class="form-control-feedback left" aria-hidden="true" style="background-color: gainsboro; color: blueviolet">{{producto.idtunidadmedida.codigo}}</span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-ss-12 col-xs-12 btn-col">
                                                        <button class="btn btn-primary" type="button" onclick="imprSelec('tablaformato131')"><i class="fa fa-print"></i> Imprimir</button>
                                                        <button class="btn btn-success" type="button" disabled=""><i class="fa fa-file-excel-o"></i> Exportar a Excel</button>
                                                        <button class="btn btn-warning" type="button"><i class="fa fa-mail-reply"></i> Regresar</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-12" style="padding-top: 15px">
                                                <table class="table table-striped jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th>Fecha</th>
                                                            <th>Serie</th>
                                                            <th>Numero</th>
                                                            <th>Tipo oper.</th>
                                                            <th>Cantidad</th>
                                                            <th>Costo unit.</th>
                                                            <th>Costo tota.</th>
                                                            <th>Cantidad</th>
                                                            <th>Costo unit.</th>
                                                            <th>Costo tota.</th>
                                                            <th>Cantidad</th>
                                                            <th>Costo unit.</th>
                                                            <th>Costo tota.</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-show="movimientos.length > 0" dir-paginate="movimiento in movimientos|itemsPerPage:20" pagination-id="tm">
                                                            <td>{{movimiento.fecha}}</td>
                                                            <td>{{movimiento.serie}}</td>
                                                            <td>{{movimiento.numero}}</td>
                                                            <td>{{movimiento.tipooperacion}}</td>
                                                            <td>{{movimiento.cantidadc}}</td>
                                                            <td>{{movimiento.preciounitarioc}}</td>
                                                            <td>{{movimiento.subtotalc}}</td>
                                                            <td>{{movimiento.cantidadv}}</td>
                                                            <td>{{movimiento.preciounitariov}}</td>
                                                            <td>{{movimiento.subtotalv}}</td>
                                                            <td>{{movimiento.cantidad}}</td>
                                                            <td>{{movimiento.preciounitario}}</td>
                                                            <td>{{movimiento.subtotal}}</td>
                                                        </tr>
                                                        <tr ng-show="movimientos.length <= 0">
                                                            <td colspan="13" class="dataTables_empty">No hay registros de movimientos</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="col-ss-12 col-xs-12"  hidden="" id="tablaformato131">
                                                    <div class="row">
                                                        <div class="col-ss-12 col-xs-4">
                                                            <img src="${pageContext.request.contextPath}/assets/report/logo.jpg" alt="" style="height: 100px">
                                                        </div>
                                                        <div class="col-ss-12 col-xs-8" style="vertical-align: middle">
                                                            <h4>Registro del inventario permanente con saldos <small>FORMATO 13.1 SUNAT</small></h4>
                                                            <h5><b>PRODUCTO: </b>{{producto.nombre}} ({{producto.codigo}})</h5>
                                                        </div>
                                                        <div class="col-ss-12 col-xs-12">
                                                            <table class="table table-striped jambo_table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Fecha</th>
                                                                        <th>Serie</th>
                                                                        <th>Numero</th>
                                                                        <th>Tipo oper.</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Costo unit.</th>
                                                                        <th>Costo tota.</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Costo unit.</th>
                                                                        <th>Costo tota.</th>
                                                                        <th>Cantidad</th>
                                                                        <th>Costo unit.</th>
                                                                        <th>Costo tota.</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr ng-show="movimientos.length > 0" ng-repeat="movimiento in movimientos">
                                                                        <td>{{movimiento.fecha}}</td>
                                                                        <td>{{movimiento.serie}}</td>
                                                                        <td>{{movimiento.numero}}</td>
                                                                        <td>{{movimiento.tipooperacion}}</td>
                                                                        <td>{{movimiento.cantidadc}}</td>
                                                                        <td>{{movimiento.preciounitarioc}}</td>
                                                                        <td>{{movimiento.subtotalc}}</td>
                                                                        <td>{{movimiento.cantidadv}}</td>
                                                                        <td>{{movimiento.preciounitariov}}</td>
                                                                        <td>{{movimiento.subtotalv}}</td>
                                                                        <td>{{movimiento.cantidad}}</td>
                                                                        <td>{{movimiento.preciounitario}}</td>
                                                                        <td>{{movimiento.subtotal}}</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <dir-pagination-controls
                                                    max-size="5"
                                                    direction-links="true"
                                                    boundary-links="true"
                                                    pagination-id="tm">
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/reporteModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                                                    function imprSelec(muestra) {
                                                                                        var ficha = document.getElementById(muestra);

                                                                                        var ventimp = window.open(' ', 'popimpr');
                                                                                        ventimp.document.write(ficha.innerHTML);
                                                                                        ventimp.document.close();

                                                                                        var css = ventimp.document.createElement("link");
                                                                                        css.setAttribute("href", "${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css");
                                                                                        css.setAttribute("rel", "stylesheet");
                                                                                        css.setAttribute("type", "text/css");
                                                                                        ventimp.document.head.appendChild(css);

                                                                                        ventimp.print();
                                                                                        ventimp.close();
                                                                                    };
        </script>
    </body>
</html>