<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="controlModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Otorgar permiso</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/build.css" rel="stylesheet" type="text/css"/>
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
    <body class="nav-md" ng-controller="otpermisoController" ng-cloak="">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Solicitudes de autorización (JEFE DE AREA)</h2>
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
                                        <div class="col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                            <label>Buscar</label>
                                            <input type="text" ng-model="buscar1" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                        </div>
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th ng-click="sort('id')">N°
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th ng-click="sort('idttipopermiso')">Tipo permiso
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'idttipopermiso'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th ng-click="sort('fecha')">Fecha
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fecha'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th ng-click="sort('horasalida')">Hora salida
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'horasalida'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th ng-click="sort('horaretorno')">Hora retorno
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'horaretorno'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th ng-click="sort('destino')">Destino
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'destino'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th ng-click="sort('autorizja')">Autorizacion J.A.
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'autorizja'" ng-class="{'glyphicon-chevron-up':reverse1,'glyphicon-chevron-down':!reverse1}"></span>
                                                        </th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="permisos.length > 0 && permiso.autorizjp == 0 && permiso.autorizja == 0" dir-paginate="permiso in permisos|itemsPerPage:10|filter:buscar1|orderBy:sortKey:reverse1" pagination-id="lp1">
                                                        <td>{{$index + 1}}</td>
                                                        <td>{{permiso.idttipopermiso.nombre}}</td>
                                                        <td>{{permiso.fecha|date :'dd MMM yyyy'}}</td>
                                                        <td>{{permiso.horasalida|date :'HH:mm a'}}</td>
                                                        <td>{{permiso.horaretorno|date :'HH:mm a'}}</td>
                                                        <td>{{permiso.destino}}</td>
                                                        <td><text ng-show="permiso.autorizja" style="color: blue; font-weight: bold">AUTORIZADO</text><text ng-show="!permiso.autorizja" style="color: red; font-weight: bold">NO AUTORIZADO</text></td>
                                                        <td><button class="btn btn-primary" ng-click="confirmar(permiso,1,1)" type="button">Confirmar</button></td>
                                                        <td><button class="btn btn-danger" ng-click="denegar(permiso,1,2)" type="button">Denegar</button></td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostrarpja(permiso)" style="color: blue"><i class="fa fa-edit"></i> Ver detalle.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="permisos.length <= 0">
                                                        <td colspan="10">No se encontró ningun registro</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="text-align: right">
                                            <dir-pagination-controls
                                                max-size="5"
                                                direction-links="true"
                                                boundary-links="true"
                                                pagination-id="lp1">
                                            </dir-pagination-controls>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Solicitudes de autorización (JEFE DE PERSONAL)</h2>
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
                                        <div class="col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda">
                                            <label>Buscar</label>
                                            <input type="text" ng-model="buscar" class="form-control input-sm" placeholder="Buscar..." uppercased>
                                        </div>
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th ng-click="sort('id')">N°
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('idttipopermiso')">Tipo permiso
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'idttipopermiso'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('fecha')">Fecha
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'fecha'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('horasalida')">Hora salida
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'horasalida'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('horaretorno')">Hora retorno
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'horaretorno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('destino')">Destino
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'destino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('autorizjp')">Autorizacion J.P.
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'autorizjp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="permisos.length > 0 && (permiso.autorizjp == 0 && permiso.autorizja != 0)" dir-paginate="permiso in permisos|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="lp">
                                                        <td>{{$index + 1}}</td>
                                                        <td>{{permiso.idttipopermiso.nombre}}</td>
                                                        <td>{{permiso.fecha|date :'dd MMM yyyy'}}</td>
                                                        <td>{{permiso.horasalida|date :'HH:mm a'}}</td>
                                                        <td>{{permiso.horaretorno|date :'HH:mm a'}}</td>
                                                        <td>{{permiso.destino}}</td>
                                                        <td><text ng-show="permiso.autorizjp" style="color: blue; font-weight: bold">AUTORIZADO</text><text ng-show="!permiso.autorizjp" style="color: red; font-weight: bold">NO AUTORIZADO</text></td>
                                                        <td><button class="btn btn-primary" ng-click="confirmar(permiso,2,1)" type="button">Confirmar</button></td>
                                                        <td><button class="btn btn-danger" ng-click="denegar(permiso,2,2)" type="button">Denegar</button></td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostrarpjp(permiso)" style="color: blue"><i class="fa fa-edit"></i> Ver detalle.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="permisos.length <= 0">
                                                        <td colspan="10">No se encontró ningun registro</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="text-align: right">
                                            <dir-pagination-controls
                                                max-size="5"
                                                direction-links="true"
                                                boundary-links="true"
                                                pagination-id="lp">
                                            </dir-pagination-controls>
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
        <div id="modalPermiso" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Detalle permiso</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <fieldset>
                                <div class="left col-xs-12">
                                    <ul class="list-unstyled">
                                        <li><i class="fa fa-sign-out"></i> Nombre: {{permisoa.contrato.colaborador.nombre}} {{permisoa.contrato.colaborador.apellidopat}} {{permisoa.contrato.colaborador.apellidomat}}</li>
                                        <li><i class="fa fa-sign-out"></i> Agencia: {{permisoa.contrato.colaborador.agencia.razonsocial}}</li>
                                        <li><i class="fa fa-info-circle"></i><strong> Dependencia: </strong> {{permisoa.contrato.dependencia.nombre}} ({{permisoa.contrato.dependencia.abreviatura}})</li>
                                        <li><i class="fa fa-info-circle"></i> <strong>Contrato: </strong> {{permisoa.contrato.codigo}}</li>
                                    </ul>
                                </div>
                            </fieldset>
                        </div>
                        <div class="row">
                            <fieldset>
                                <legend>Datos de permiso</legend>
                                <div class="left col-xs-12">
                                    <ul class="list-unstyled">
                                        <li><i class="fa fa-sign-out"></i> Tipo permiso: {{permisoa.idttipopermiso.nombre}}</li>
                                        <li><i class="fa fa-sign-out"></i> Fecha: {{permisoa.fecha}}</li>
                                        <li><i class="fa fa-info-circle"></i><strong> Hora salida: </strong> {{permisoa.horasalida|date :'HH:mm a'}})</li>
                                        <li><i class="fa fa-info-circle"></i> <strong>Hora retorno: </strong> {{permisoa.horaretorno|date :'HH:mm a'}}</li>
                                        <li><i class="fa fa-info-circle"></i> <strong>Destino: </strong> {{permisoa.destino}}</li>
                                        <li><i class="fa fa-info-circle"></i> Detalle: {{permisoa.descripcion}}</li>
                                    </ul>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button ng-click="actualizarp(1)" type="button" class="btn btn-primary input-sm">Otorgar</button>
                        <button ng-click="actualizarp(-1)" type="button" class="btn btn-primary input-sm">Denegar</button>
                        <button type="button" class="btn btn-danger input-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/personal/controlModule.js" type="text/javascript"></script>
    </body>
</html>