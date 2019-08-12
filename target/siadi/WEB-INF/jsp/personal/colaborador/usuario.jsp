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
        <title>Registro usuarios</title>
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
    <body class="nav-md" ng-controller="usuarioController" ng-cloak="">
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
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <input ng-model="usuario.colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI" ng-disabled="disDni" auto-complete="buscarColDni">
                                                            <i class="fa fa-search searchg" ng-click="disDni = !disDni"  style="line-height:28px"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-8 col-sm-4">
                                                    <label>Nombre <span class="span-salmon">(*)</span></label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <input ng-model="usuario.colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" ng-disabled="disNombre" auto-complete="buscarColNombre" uppercased>
                                                            <i class="fa fa-search searchg" ng-click="disNombre = !disNombre"  style="line-height:28px"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <input ng-model="usuario.colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" ng-disabled="disApellidopat" auto-complete="buscarColNombre" uppercased>
                                                            <i class="fa fa-search searchg" ng-click="disApellidopat = !disApellidopat"  style="line-height:28px"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-3">
                                                    <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                                    <div class="form-group">
                                                        <span class="input-icon">
                                                            <input ng-model="usuario.colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" ng-disabled="disApellidomat" auto-complete="buscarColNombre" uppercased>
                                                            <i class="fa fa-search searchg" ng-click="disApellidomat = !disApellidomat"  style="line-height:28px"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="row">
                                            <fieldset>
                                                <legend>Datos de usuario</legend>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Id usuario <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="usuario.usuario" name="usuario" class="form-control input-sm" type="text" placeholder="USUARIO">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Contraseña <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="contrasena2" name="contrasena" id="contrasena" class="form-control input-sm" type="password"  placeholder="CONTRASEÑA">
                                                </div>
                                                <div class="col-ss-12 col-xs-6 col-sm-4">
                                                    <label>Confirmacion contraseña <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="usuario.contrasena" name="contrasena2" class="form-control input-sm" type="password" placeholder="CONFIRMAR CONTRASEÑA">
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="row">
                                            <fieldset>
                                                <legend>Permisos de acceso</legend>
                                                <div class="col-ss-12 col-xs-12">
                                                    <div class="panel-group" id="accordion">
                                                        <div class="panel panel-default" ng-repeat="modulo in modulos">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse{{$index}}">
                                                                        {{modulo.nombre}}
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapse{{$index}}" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="row" ng-repeat="rol in modulo.roles">
                                                                        <div class="signed_content">
                                                                            <h4 style="color: blueviolet"> {{rol.nombre}}</h4>
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-4" ng-repeat="funcion in rol.funciones">
                                                                            <div class="checkbox checkbox-success">
                                                                                <input ng-model="funcion.estado" id="checkbox{{funcion.id}}" type="checkbox">
                                                                                <label for="checkbox{{funcion.id}}">
                                                                                    {{funcion.nombre}}
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-ss-12 col-xs-12">
                                                    <button class="btn btn-primary input-sm" type="submit">Registrar</button>
                                                </div>
                                            </fieldset>
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
                                            <h2>Registro usuarios</h2>
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
                                                        <th ng-click="sort('usuario')">ID Usuario
                                                            <span class="glyphicon sort-icon" ng-show="sortKey === 'usuario'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                        </th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="usuarios.length > 0" dir-paginate="usuario in usuarios|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="lu">
                                                        <td>{{$index + 1}}</td>
                                                        <td>{{usuario.colaborador.nombre}} {{usuario.colaborador.apellidopat}} {{usuario.colaborador.apellidomat}}</td>
                                                        <td>{{usuario.colaborador.dni}}</td>
                                                        <td>{{usuario.colaborador.celular}}</td>
                                                        <td>{{usuario.colaborador.direccion}}</td>
                                                        <td>{{usuario.colaborador.cargo}}</td>
                                                        <td>{{usuario.usuario}}</td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostraru(usuario)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="eliminaru(usuario)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="usuarios.length <= 0">
                                                        <td colspan="9">No se encontró ningun registro</td>
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
                    <form name="formularioua" ng-submit="actualizaru(formularioua)" ng-validate="validateua">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modificar usuario</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <fieldset>
                                    <div class="col-ss-12 col-xs-4 col-sm-2">
                                        <label>Dni <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI" disabled="">
                                    </div>
                                    <div class="col-ss-12 col-xs-8 col-sm-4">
                                        <label>Nombre <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" disabled="">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" disabled="">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" disabled="">
                                    </div>
                                </fieldset>
                            </div>
                            <div class="row">
                                <fieldset>
                                    <legend>Datos de usuario</legend>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Id usuario <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.usuario" name="usuario" class="form-control input-sm" type="text" placeholder="USUARIO">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Contraseña <span class="span-salmon">(*)</span></label>
                                        <input ng-model="contrasena3" name="contrasena" id="contrasenaa" class="form-control input-sm" type="password"  placeholder="CONTRASEÑA">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Confirmacion contraseña <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.contrasena" name="contrasena2" class="form-control input-sm" type="password" placeholder="CONFIRMAR CONTRASEÑA">
                                    </div>
                                </fieldset>
                            </div>
                            <div class="row">
                                <fieldset>
                                    <legend>Permisos de acceso</legend>
                                    <div class="col-ss-12 col-xs-12">
                                        <div class="panel-group" id="accordiona">
                                            <div class="panel panel-default" ng-repeat="modulo in modulosa">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordiona" href="#collapsea{{$index}}">
                                                            {{modulo.nombre}}
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapsea{{$index}}" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="row" ng-repeat="rol in modulo.roles">
                                                            <div class="signed_content">
                                                                <h4 style="color: blueviolet"> {{rol.nombre}}</h4>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-4" ng-repeat="funcion in rol.funciones">
                                                                <div class="checkbox checkbox-success">
                                                                    <input ng-model="funcion.estado" id="checkbox{{funcion.id}}" type="checkbox">
                                                                    <label for="checkbox{{funcion.id}}">
                                                                        {{funcion.nombre}}
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
    </body>
</html>