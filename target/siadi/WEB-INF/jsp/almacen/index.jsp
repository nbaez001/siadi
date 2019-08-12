<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="homeModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="homeController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="shared/navbar.jsp" flush="true"/>
                <jsp:include page="shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                            <div class="left"></div>
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Usuarios</span>
                                <div class="count">{{usuarios.length}}</div>
                                <span class="count_bottom">Ultimo creado el:  <i class="green">{{last.fechusuariocrea}}</i></span>
                            </div>
                        </div>
                        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                            <div class="left"></div>
                            <div class="right">
                                <span class="count_top"><i class="fa fa-database"></i> Total Almacenes</span>
                                <div class="count">{{almacenes.length}}</div>
                                <span class="count_bottom">Ultimo creado el:  <i class="green">{{lasta.fechusuariocrea}}</i></span>
                            </div>
                        </div>
                        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                            <div class="left"></div>
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
                                <div class="count green">2,500</div>
                                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                            </div>
                        </div>
                        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                            <div class="left"></div>
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Females</span>
                                <div class="count">4,567</div>
                                <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
                            </div>
                        </div>
                        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                            <div class="left"></div>
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Collections</span>
                                <div class="count">2,315</div>
                                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                            </div>
                        </div>
                        <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                            <div class="left"></div>
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Connections</span>
                                <div class="count">7,325</div>
                                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                            </div>
                        </div>
                    </div>
                    <p class="error-message" ng-show="mostrar">{{message}}</p>
                    <div class="row">
                        <div class="col-ss-12 col-xs-12 col-sm-12 col-md-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Inventario</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
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
                                        <div class="col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                            <label>Buscar</label>
                                            <input type="text" ng-model="buscar" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                        </div>
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th ng-click="sort('id')">N°
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('producto.codigo')">Codigo
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'producto.codigo'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('producto.nombre')">Nombre
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'producto.nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Almacen</th>
                                                        <th>Ubicación</th>
                                                        <th>Cantidad</th>
                                                        <th title="Precio maximo por mayor">Precio fijo (X Mayor)</th>
                                                        <th title="Precio descontado por mayor">Precio descontado (X Mayor)</th>
                                                        <th title="Precio fijo por menor">Precio fijo (X Unidad)</th>
                                                        <th title="Precio descontado por menor">Precio descontado (X Unidad)</th>
                                                        
                                                     
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="inventarios.length > 0" dir-paginate="inventario in inventarios|itemsPerPage:50|filter:buscar|orderBy:sortKey:reverse">
                                                        <td>{{inventario.id}}</td>
                                                        <td>{{inventario.producto.codigo}}</td>
                                                        <td>{{inventario.producto.nombre}}</td>
                                                        <td>{{inventario.andamio.almacen.nombre}}</td>
                                                        <td>{{inventario.andamio.nombre}}</td>
                                                        <td>{{inventario.cantidad}}</td>
                                                        <td>{{inventario.preciomaymax|currency:'S/. ':2}}</td>
                                                            <td>{{inventario.preciomaymin|currency:'S/. ':2}}</td>
                                                          <td>{{inventario.preciomenmax|currency:'S/. ':2}}</td>
                                                        <td>{{inventario.preciomenmin|currency:'S/. ':2}}</td>
                                                      
                                                    
                                                    </tr>
                                                    <tr ng-show="inventarios.length <= 0">
                                                        <td colspan="10" class="dataTables_empty">No se encontró ningun registro de inventario</td>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/homeModule.js" type="text/javascript"></script>
    </body>
</html>