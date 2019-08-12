<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="colaboradorModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mantener parametros</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
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
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="registroController" ng-cloak="">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Registrar personal</h2>
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
                                    <form name="formulario" ng-submit="registraru(formulario)" ng-validate="validateu">
                                        <div class="row">
                                            <fieldset>
                                                <div class="col-ss-12 col-xs-4 col-sm-2">
                                                    <label>Dni <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI">
                                                </div>
                                                <div class="col-ss-12 col-xs-8 col-sm-4">
                                                    <label>Nombre <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" uppercased>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" uppercased>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" uppercased>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Celular <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.celular" name="celular" class="form-control input-sm" placeholder="CELULAR" type="number">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Email</label>
                                                    <input ng-model="colaborador.email" name="email" class="form-control input-sm" type="text" placeholder="E-MAIL" uppercased>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Ruc</label>
                                                    <input ng-model="colaborador.ruc" name="ruc" class="form-control input-sm" placeholder="RUC" type="number">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Fecha nacimiento</label>
                                                    <input ng-model="colaborador.fechanac" name="fechanac" class="form-control input-sm" placeholder="FECHA NACIMIENTO">
                                                </div>
                                                <div class="col-ss-12 col-xs-12 btn-col">
                                                    <div class="panel panel-danger">
                                                        <div class="panel-heading">
                                                            Direccion
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="col-ss-12 col-xs-4">
                                                                    <label>Pais</label>
                                                                    <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais" ng-change="listarDepartamento()" name="pais" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="col-ss-12 col-xs-4">
                                                                    <label>Departamento</label>
                                                                    <select ng-options="departamento as departamento.denominacion for departamento in departamentos track by departamento.id" ng-model="departamento" ng-change="listarProvincia()" name="departamento" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="col-ss-12 col-xs-4">
                                                                    <label>Provincia</label>
                                                                    <select ng-options="provincia as provincia.denominacion for provincia in provincias track by provincia.id" ng-model="provincia" ng-change="listarDistrito()" name="provincia" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="col-ss-12 col-xs-4">
                                                                    <label>Distrito</label>
                                                                    <select ng-options="distrito as distrito.denominacion for distrito in distritos track by distrito.id" ng-model="distrito" name="distrito" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="col-ss-12 col-xs-8">
                                                                    <label>Dirección <span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="colaborador.direccion" name="direccion" class="form-control input-sm" placeholder="DIRECCION" uppercased>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-8">
                                                    <label>Agencia <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.agencia.razonsocial" name="agencia" class="form-control input-sm" disabled="">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Cargo <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="colaborador.cargo" name="cargo" class="form-control input-sm" type="text" placeholder="CARGO" uppercased>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 btn-col">
                                                <button class="btn btn-primary" type="submit">Registrar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <div class="profile_title">
                                        <div class="col-ss-12 col-xs-4">
                                            <h2>Registro colaboradores</h2>
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
                                    <div class="row" style="padding-top: 15px">
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
                                                        <th ng-click="sort('colaborador.nombre')">Nombre y apellidos
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.nombre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('colaborador.dni')">Dni
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.dni'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('colaborador.celular')">Telefono
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.celular'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('colaborador.direccion')">Dirección
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.direccion'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th ng-click="sort('colaborador.cargo')">Cargo
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.cargo'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="colaboradores.length > 0" dir-paginate="colaborador in colaboradores|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="lu">
                                                        <td>{{$index + 1}}</td>
                                                        <td>{{colaborador.nombre}} {{colaborador.apellidopat}} {{colaborador.apellidomat}}</td>
                                                        <td>{{colaborador.dni}}</td>
                                                        <td>{{colaborador.celular}}</td>
                                                        <td>{{colaborador.direccion}}</td>
                                                        <td>{{colaborador.cargo}}</td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostraru(colaborador)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="eliminaru(colaborador)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="colaboradores.length <= 0">
                                                        <td colspan="8">No se encontró ningun registro</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-ss-12 col-xs-12" style="text-align: right">
                                            <dir-pagination-controls
                                                max-size="5"
                                                direction-links="true"
                                                boundary-links="true"
                                                pagination-id="lu   ">
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
        <div id="modalUsuario" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formularioa" ng-submit="actualizaru(formularioa)" ng-validate="validateu">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modificar colaborador</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <fieldset>
                                    <div class="col-ss-12 col-xs-4 col-sm-2">
                                        <label>Dni <span class="span-salmon">(*)</span></label>
                                        <input ng-model="colaboradora.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI">
                                    </div>
                                    <div class="col-ss-12 col-xs-8 col-sm-4">
                                        <label>Nombre <span class="span-salmon">(*)</span></label>
                                        <input ng-model="colaboradora.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                        <input ng-model="colaboradora.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                        <input ng-model="colaboradora.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Celular <span class="span-salmon">(*)</span></label>
                                        <input ng-model="colaboradora.celular" name="celular" class="form-control input-sm" placeholder="CELULAR" type="number">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Email</label>
                                        <input ng-model="colaboradora.email" name="email" class="form-control input-sm" type="text" placeholder="E-MAIL" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Ruc</label>
                                        <input ng-model="colaboradora.ruc" name="ruc" class="form-control input-sm" placeholder="RUC" type="number">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Fecha nacimiento</label>
                                        <input ng-model="colaboradora.fechanac" name="fechanac" class="form-control input-sm" placeholder="FECHA NACIMIENTO">
                                    </div>
                                    <div class="col-ss-12 col-xs-12 btn-col">
                                        <div class="panel panel-danger">
                                            <div class="panel-heading">
                                                Direccion
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Pais</label>
                                                        <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais2" ng-change="listarDepartamento2()" name="pais" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Departamento</label>
                                                        <select ng-options="departamento as departamento.denominacion for departamento in departamentos2 track by departamento.id" ng-model="departamento2" ng-change="listarProvincia2()" name="departamento" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Provincia</label>
                                                        <select ng-options="provincia as provincia.denominacion for provincia in provincias2 track by provincia.id" ng-model="provincia2" ng-change="listarDistrito2()" name="provincia" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Distrito</label>
                                                        <select ng-options="distrito as distrito.denominacion for distrito in distritos2 track by distrito.id" ng-model="distrito2" name="distrito" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-8">
                                                        <label>Dirección <span class="span-salmon">(*)</span></label>
                                                        <input ng-model="colaboradora.direccion" name="direccion" class="form-control input-sm" placeholder="DIRECCION" uppercased>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Cargo <span class="span-salmon">(*)</span></label>
                                        <input ng-model="colaboradora.cargo" name="cargo" class="form-control input-sm" type="text" placeholder="CARGO" uppercased>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary input-sm">Actualizar</button>
                            <button type="button" class="btn btn-danger input-sm" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/personal/colaboradorModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                    $('form[name=formulario] input[name=fechanac]').datepicker({dateFormat: 'yy-mm-dd'});
                                                    $('form[name=formularioa] input[name=fechanac]').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>