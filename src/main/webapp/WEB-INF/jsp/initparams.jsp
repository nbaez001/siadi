<%-- 
    Document   : index
    Created on : 18/08/2016, 05:36:16 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="indexModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Parametros iniciales</title>
        <jsp:include page="shared/favicon.jsp" flush="true"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/jquery/jquery-ui-1.11.4.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/build.css" rel="stylesheet" type="text/css"/>

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
    <body style="background:#F7F7F7;" ng-controller="initparamsController" ng-cloak>
        <div style="width: 90%;margin: 0 auto">
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div class="container">
                <div class="animate">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>Parametros iniciales </h4>
                            </div>
                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <a href="${pageContext.request.contextPath}/login">Regresar a inicio <i class="fa fa-home fa-2x"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Agencias</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Usuarios</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Bobeda</a>
                                        </li>
                                    </ul>
                                    <div id="myTabContent" class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <fieldset>
                                                        <legend>Agencia</legend>
                                                        <div class="row" style="padding-bottom: 15px">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <form name="formularioe" ng-submit="registrare(formularioe)" ng-validate="validatee">
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-8 col-sm-9">
                                                                            <div class="row">
                                                                                <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                                    <label>Ruc <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="agencia.ruc" name="ruc" type="number" class="form-control input-sm" placeholder="RUC">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-8 col-sm-5">
                                                                                    <label>Razon social <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="agencia.razonsocial" name="razonsocial" type="text" class="form-control input-sm" placeholder="NOMBRE DE LA EMPRESA" uppercased>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-8 col-sm-4">
                                                                                    <label>Nombre comercial <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="agencia.nombrecomercial" name="nombrecomercial" type="text" class="form-control input-sm" placeholder="NOMBRE COMERCIAL" uppercased>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4 col-md-4">
                                                                                    <label>Telefono <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="agencia.telefono" name="telefono" type="number" class="form-control input-sm" placeholder="TELEFONO">
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4 col-md-4">
                                                                                    <label>Pais</label>
                                                                                    <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais" ng-change="listarDepartamento()" name="pais" class="form-control input-sm"></select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4 col-md-4">
                                                                                    <label>Provincia</label>
                                                                                    <select ng-options="departamento as departamento.denominacion for departamento in departamentos track by departamento.id" ng-model="departamento" ng-change="listarProvincia()" name="departamento" class="form-control input-sm"></select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4 col-md-4">
                                                                                    <label>Departamento</label>
                                                                                    <select ng-options="provincia as provincia.denominacion for provincia in provincias track by provincia.id" ng-model="provincia" ng-change="listarDistrito()" name="provincia" class="form-control input-sm"></select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-4 col-md-4">
                                                                                    <label>Distrito</label>
                                                                                    <select ng-options="distrito as distrito.denominacion for distrito in distritos track by distrito.id" ng-model="distrito" name="distrito" class="form-control input-sm"></select>
                                                                                </div>
                                                                                <div class="col-ss-12 col-xs-8 col-md-4">
                                                                                    <label>Dirección <span class="span-salmon">(*)</span></label>
                                                                                    <input ng-model="agencia.direccion" name="direccion" type="text" class="form-control input-sm" placeholder="DIRECCION" uppercased>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-ss-12 col-xs-4 col-sm-3">
                                                                            <label>Imagen <span class="span-salmon">(*)</span></label>
                                                                            <input ng-file-model="file" name="file" type="file" class="file" id="file-fr" data-min-file-count="1">
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-12 col-sm-12 btn-col">
                                                                            <button type="submit" class="btn btn-primary btn-sm">Registrar</button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                                <table class="table table-striped jambo_table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>N°</th>
                                                                            <th>Razon social</th>
                                                                            <th>Nombre comercial</th>
                                                                            <th>Ruc</th>
                                                                            <th>Telefono</th>
                                                                            <th>Direccion</th>
                                                                            <th>Img.</th>
                                                                            <th>Opt.</th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="agencias.length > 0" ng-repeat="agencia in agencias">
                                                                            <td>{{agencia.id}}</td>
                                                                            <td>{{agencia.razonsocial}}</td>
                                                                            <td>{{agencia.nombrecomercial}}</td>
                                                                            <td>{{agencia.ruc}}</td>
                                                                            <td>{{agencia.telefono}}</td>
                                                                            <td>{{agencia.direccion}}</td>
                                                                            <td title="{{agencia.urllogo}}">
                                                                                <a href="${pageContext.request.contextPath}{{agencia.urllogo}}" target="_blank"><i class="fa fa-picture-o"></i> Img.</a>
                                                                            </td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="mostrare(agencia)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                                            </td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="eliminare(agencia)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="agencias.length <= 0">
                                                                            <td colspan="9" class="dataTables_empty">No se encontró ningun registro</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
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
                                                        <legend>Datos personales</legend>
                                                        <div class="row" style="padding-bottom: 15px">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <form name="formulariou" ng-submit="registraru(formulariou)" ng-validate="validateu">
                                                                    <div class="row">
                                                                        <fieldset>
                                                                            <div class="col-ss-12 col-xs-4 col-sm-2">
                                                                                <label>Dni <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="usuario.colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-8 col-sm-4">
                                                                                <label>Nombre <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="usuario.colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" uppercased>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="usuario.colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" uppercased>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="usuario.colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" uppercased>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                <label>Celular <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="usuario.colaborador.celular" name="celular" class="form-control input-sm" placeholder="CELULAR" type="number">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                <label>Email</label>
                                                                                <input ng-model="usuario.colaborador.email" name="email" class="form-control input-sm" type="text" placeholder="E-MAIL" uppercased>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                <label>Ruc</label>
                                                                                <input ng-model="usuario.colaborador.ruc" name="ruc" class="form-control input-sm" placeholder="RUC" type="number">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-3">
                                                                                <label>Fecha nacimiento</label>
                                                                                <input ng-model="usuario.colaborador.fechanac" name="fechanac" class="form-control input-sm" placeholder="FECHA NACIMIENTO">
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
                                                                                                <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais3" ng-change="listarDepartamento3()" name="pais" class="form-control input-sm"></select>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4">
                                                                                                <label>Departamento</label>
                                                                                                <select ng-options="departamento as departamento.denominacion for departamento in departamentos3 track by departamento.id" ng-model="departamento3" ng-change="listarProvincia3()" name="departamento" class="form-control input-sm"></select>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4">
                                                                                                <label>Provincia</label>
                                                                                                <select ng-options="provincia as provincia.denominacion for provincia in provincias3 track by provincia.id" ng-model="provincia3" ng-change="listarDistrito3()" name="provincia" class="form-control input-sm"></select>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-4">
                                                                                                <label>Distrito</label>
                                                                                                <select ng-options="distrito as distrito.denominacion for distrito in distritos3 track by distrito.id" ng-model="distrito3" name="distrito" class="form-control input-sm"></select>
                                                                                            </div>
                                                                                            <div class="col-ss-12 col-xs-8">
                                                                                                <label>Dirección <span class="span-salmon">(*)</span></label>
                                                                                                <input ng-model="usuario.colaborador.direccion" name="direccion" class="form-control input-sm" placeholder="DIRECCION" uppercased>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="row">
                                                                        <fieldset>
                                                                            <legend>Datos de usuario</legend>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                <label>Agencia <span class="span-salmon">(*)</span></label>
                                                                                <select ng-options="agencia as agencia.razonsocial for agencia in agencias track by agencia.id" ng-model="usuario.colaborador.agencia" name="agencia" class="form-control input-sm"></select>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-sm-4">
                                                                                <label>Cargo <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="usuario.colaborador.cargo" name="cargo" class="form-control input-sm" type="text" placeholder="CARGO" uppercased>
                                                                            </div>
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
                                                            <div class="col-ss-12 col-xs-offset-8 col-xs-4 filtro-busqueda btn-col">
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
                                                                            <th ng-click="sort('colaborador.cargo')">Cargo
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'colaborador.cargo'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sort('usuario')">Usuario
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'usuario'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sort('contrasena')">Contraseña
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'contrasena'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th>Opt.</th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="usuarios.length > 0" dir-paginate="usuario in usuarios|itemsPerPage:10|filter:buscar|orderBy:sortKey:reverse" pagination-id="lu">
                                                                            <td>{{usuario.id}}</td>
                                                                            <td>{{usuario.colaborador.nombre}} {{usuario.colaborador.apellidopat}} {{usuario.colaborador.apellidomat}}</td>
                                                                            <td>{{usuario.colaborador.dni}}</td>
                                                                            <td>{{usuario.colaborador.cargo}}</td>
                                                                            <td>{{usuario.usuario}}</td>
                                                                            <td>{{usuario.contrasena}}</td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="mostraru(usuario)" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                                            </td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="eliminaru(usuario)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="usuarios.length <= 0">
                                                                            <td colspan="8" class="dataTables_empty">No se encontró ningun registro de usuarios</td>
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
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab2">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <fieldset>
                                                        <legend>Bobeda</legend>
                                                        <div class="row" style="padding-bottom: 15px">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <form name="formulariob" ng-submit="registrarb(formulariob)" ng-validate="validateb">
                                                                    <div class="row">
                                                                        <fieldset>
                                                                            <div class="col-ss-12 col-xs-6 col-lg-3">
                                                                                <label>Agencia <span class="span-salmon">(*)</span></label>
                                                                                <select ng-options="agencia as agencia.razonsocial for agencia in agencias track by agencia.id" ng-model="bobeda.agencia" name="agencia" class="form-control input-sm"></select>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-lg-3">
                                                                                <label>Nombre <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="bobeda.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" uppercased>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-lg-3">
                                                                                <label>Estado <span class="span-salmon">(*)</span></label>
                                                                                <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="bobeda.estado" name="estado" class="form-control input-sm" disabled=""></select>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 col-lg-3">
                                                                                <label>Fecha apertura <span class="span-salmon">(*)</span></label>
                                                                                <input ng-model="bobeda.fechaapertura" name="fechaapertura" class="form-control input-sm" type="text" placeholder="FECHA APERTURA" disabled="">
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 btn-col">
                                                                                <div class="panel panel-danger">
                                                                                    <div class="panel-body">
                                                                                        <fieldset>
                                                                                            <legend>Inicial</legend>
                                                                                            <table class="table table-striped content-middle">
                                                                                                <thead>
                                                                                                    <tr class="headings">
                                                                                                        <th>Denominacion</th>
                                                                                                        <th>Valor</th>
                                                                                                        <th style="text-align: center">Cantidad</th>
                                                                                                        <th>Total</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td>DOS CIENTOS SOLES</td>
                                                                                                        <td>200.00</td>
                                                                                                        <td><input ng-model="bobeda.doscientoss" ng-keyup="calcularTotal()" name="doscientoss" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.doscientoss * 200.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CIEN SOLES</td>
                                                                                                        <td>100.00</td>
                                                                                                        <td><input ng-model="bobeda.ciens" ng-keyup="calcularTotal()" name="ciens" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.ciens * 100.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CINCUENTA SOLES</td>
                                                                                                        <td>50.00</td>
                                                                                                        <td><input ng-model="bobeda.cincuentas" ng-keyup="calcularTotal()" name="cincuentas" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.cincuentas * 50.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>VEINTE SOLES</td>
                                                                                                        <td>20.00</td>
                                                                                                        <td><input ng-model="bobeda.veintes" ng-keyup="calcularTotal()" name="veintes" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.veintes * 20.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>DIEZ SOLES</td>
                                                                                                        <td>10.00</td>
                                                                                                        <td><input ng-model="bobeda.diezs" ng-keyup="calcularTotal()" name="diezs" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.diezs * 10.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CINCO SOLES</td>
                                                                                                        <td>5.00</td>
                                                                                                        <td><input ng-model="bobeda.cincos" ng-keyup="calcularTotal()" name="cincos" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.cincos * 5.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>DOS SOLES</td>
                                                                                                        <td>2.00</td>
                                                                                                        <td><input ng-model="bobeda.doss" ng-keyup="calcularTotal()" name="doss" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.doss * 2.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>UN SOL</td>
                                                                                                        <td>1.00</td>
                                                                                                        <td><input ng-model="bobeda.uns" ng-keyup="calcularTotal()" name="uns" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.uns * 1.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CINCUENTA CENTIMOS</td>
                                                                                                        <td>0.50</td>
                                                                                                        <td><input ng-model="bobeda.cincuentac" ng-keyup="calcularTotal()" name="cincuentac" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.cincuentac * 0.50|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>VEINTE CENTIMOS</td>
                                                                                                        <td>0.20</td>
                                                                                                        <td><input ng-model="bobeda.veintec" ng-keyup="calcularTotal()" name="veintec" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.veintec * 0.20|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>DIEZ CENTIMOS</td>
                                                                                                        <td>0.10</td>
                                                                                                        <td><input ng-model="bobeda.diezc" ng-keyup="calcularTotal()" name="diezc" class="form-control input-sm input-middle" type="number"></td>
                                                                                                        <td>{{bobeda.diezc * 0.10|number:2}}</td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <b>Total</b> {{bobeda.montoapertura|number:2}}
                                                                                        </fieldset>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-ss-12 col-xs-6 btn-col">
                                                                                <div class="panel panel-danger">
                                                                                    <div class="panel-body">
                                                                                        <fieldset>
                                                                                            <legend>Final</legend>
                                                                                            <table class="table table-striped table-input-padding">
                                                                                                <thead>
                                                                                                    <tr class="headings">
                                                                                                        <th>Denominacion</th>
                                                                                                        <th>Valor</th>
                                                                                                        <th>Cantidad</th>
                                                                                                        <th>Total</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td>DOS CIENTOS SOLES</td>
                                                                                                        <td>200.00</td>
                                                                                                        <td>{{bobeda.doscientoss|number:1}}</td>
                                                                                                        <td>{{bobeda.doscientoss * 200.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CIEN SOLES</td>
                                                                                                        <td>100.00</td>
                                                                                                        <td>{{bobeda.ciens|number:1}}</td>
                                                                                                        <td>{{bobeda.ciens * 100.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CINCUENTA SOLES</td>
                                                                                                        <td>50.00</td>
                                                                                                        <td>{{bobeda.cincuentas|number:1}}</td>
                                                                                                        <td>{{bobeda.cincuentas * 50.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>VEINTE SOLES</td>
                                                                                                        <td>20.00</td>
                                                                                                        <td>{{bobeda.veintes|number:1}}</td>
                                                                                                        <td>{{bobeda.veintes * 20.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>DIEZ SOLES</td>
                                                                                                        <td>10.00</td>
                                                                                                        <td>{{bobeda.diezs|number:1}}</td>
                                                                                                        <td>{{bobeda.diezs * 10.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CINCO SOLES</td>
                                                                                                        <td>5.00</td>
                                                                                                        <td>{{bobeda.cincos|number:1}}</td>
                                                                                                        <td>{{bobeda.cincos * 5.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>DOS SOLES</td>
                                                                                                        <td>2.00</td>
                                                                                                        <td>{{bobeda.doss|number:1}}</td>
                                                                                                        <td>{{bobeda.doss * 2.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>UN SOL</td>
                                                                                                        <td>1.00</td>
                                                                                                        <td>{{bobeda.uns|number:1}}</td>
                                                                                                        <td>{{bobeda.uns * 1.00|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>CINCUENTA CENTIMOS</td>
                                                                                                        <td>0.50</td>
                                                                                                        <td>{{bobeda.cincuentac|number:1}}</td>
                                                                                                        <td>{{bobeda.cincuentac * 0.50|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>VEINTE CENTIMOS</td>
                                                                                                        <td>0.20</td>
                                                                                                        <td>{{bobeda.veintec|number:1}}</td>
                                                                                                        <td>{{bobeda.veintec * 0.20|number:2}}</td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>DIEZ CENTIMOS</td>
                                                                                                        <td>0.10</td>
                                                                                                        <td>{{bobeda.diezc|number:1}}</td>
                                                                                                        <td>{{bobeda.diezc * 0.10|number:2}}</td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <b>Total</b> {{bobeda.montocierre|number:2}}
                                                                                        </fieldset>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-ss-12 col-xs-12">
                                                                            <button type="submit" class="btn btn-primary btn-sm">Registrar</button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                                <table class="table table-striped jambo_table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th ng-click="sortb('id')">N°
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('agencia.razonsocial')">Agencia
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'agencia.razonsocial'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('nombre')">Nombre
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'nombre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('montoapertura')">Monto apertura
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'montoapertura'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('montocierre')">Monto cierre
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'montocierre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('fechaapertura')">Fecha apertura
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'fechaapertura'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('fechacierre')">Fecha cierre
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'fechacierre'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th ng-click="sortb('estado')">Estado
                                                                                <span class="glyphicon sort-icon" ng-show="sortKey === 'estado'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
                                                                            </th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="bobedas.length > 0" dir-paginate="bobeda in bobedas|itemsPerPage:10|orderBy:sortKey:reverse" pagination-id="lb">
                                                                            <td>{{$index + 1}}</td>
                                                                            <td>{{bobeda.agencia.razonsocial}}</td>
                                                                            <td>{{bobeda.nombre}}</td>
                                                                            <td>{{bobeda.montoapertura|currency:'S/. ':2}}</td>
                                                                            <td>{{bobeda.montocierre|currency:'S/. ':2}}</td>
                                                                            <td>{{bobeda.fechaapertura}}</td>
                                                                            <td>{{bobeda.fechacierre}}</td>
                                                                            <td><i ng-show="bobeda.estado" class="blue bold">ACTIVO</i><i ng-show="!bobeda.estado" class="red bold">INACTIVO</i></td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="eliminarb(bobeda)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="bobedas.length <= 0">
                                                                            <td colspan="9" class="dataTables_empty">No se encontró ningun registro de bobedas</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="col-ss-12 col-xs-12" style="text-align: right">
                                                                <dir-pagination-controls
                                                                    max-size="5"
                                                                    direction-links="true"
                                                                    boundary-links="true"
                                                                    pagination-id="lb">
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
                    <jsp:include page="shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>
        <div id="modalAgencia" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formularioea" ng-submit="actualizare(formularioea)" ng-validate="validatee">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modificar agencia</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-ss-12 col-xs-6">
                                    <label>Ruc <span class="span-salmon">(*)</span></label>
                                    <input ng-model="agenciaa.ruc" name="ruc" type="number" class="form-control input-sm">
                                </div>
                                <div class="col-ss-12 col-xs-6">
                                    <label>Razon social <span class="span-salmon">(*)</span></label>
                                    <input ng-model="agenciaa.razonsocial" name="razonsocial" type="text" class="form-control input-sm" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-6">
                                    <label>Nombre comercial <span class="span-salmon">(*)</span></label>
                                    <input ng-model="agenciaa.nombrecomercial" name="nombrecomercial" type="text" class="form-control input-sm" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-6">
                                    <label>Telefono <span class="span-salmon">(*)</span></label>
                                    <input ng-model="agenciaa.telefono" name="telefono" type="number" class="form-control input-sm">
                                </div>
                                <div class="col-ss-12 col-xs-6">
                                    <label>Pais</label>
                                    <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais2" ng-change="listarDepartamento2()" name="pais" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Provincia</label>
                                    <select ng-options="departamento as departamento.denominacion for departamento in departamentos2 track by departamento.id" ng-model="departamento2" ng-change="listarProvincia2()" name="departamento" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Departamento</label>
                                    <select ng-options="provincia as provincia.denominacion for provincia in provincias2 track by provincia.id" ng-model="provincia2" ng-change="listarDistrito2()" name="provincia" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Distrito</label>
                                    <select ng-options="distrito as distrito.denominacion for distrito in distritos2 track by distrito.id" ng-model="distrito2" name="distrito" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-8">
                                    <label>Direccion <span class="span-salmon">(*)</span></label>
                                    <input ng-model="agenciaa.direccion" name="direccion" type="text" class="form-control input-sm" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-5">
                                    <label>¿Seleccionar nueva imagen?</label>
                                    <select ng-options="opcion as opcion.nombre for opcion in opciones track by opcion.id" ng-model="opcion" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-7">
                                    <label>Imagen</label>
                                    <div ng-show="opcion.id === false">
                                        <img src="${pageContext.request.contextPath}{{productoa.urllogo}}" class="img-responsive" alt="${pageContext.request.contextPath}/assets/report/logo.jpg">
                                    </div>
                                    <div ng-show="opcion.id === true">
                                        <input ng-file-model="file2" name="file2" type="file" class="file" id="file-fr2" data-min-file-count="1">
                                    </div>
                                </div>
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
                                        <input ng-model="usuarioa.colaborador.dni" name="dni" class="form-control input-sm" type="number" placeholder="DNI">
                                    </div>
                                    <div class="col-ss-12 col-xs-8 col-sm-4">
                                        <label>Nombre <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.nombre" name="nombre" class="form-control input-sm" type="text" placeholder="NOMBRE" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.apellidopat" name="apellidopat" class="form-control input-sm" type="text" placeholder="APELLIDO PATERNO" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.apellidomat" name="apellidomat" class="form-control input-sm" type="text" placeholder="APELLIDO MATERNO" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Celular <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.celular" name="celular" class="form-control input-sm" placeholder="CELULAR" type="number">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Email</label>
                                        <input ng-model="usuarioa.colaborador.email" name="email" class="form-control input-sm" type="text" placeholder="E-MAIL" uppercased>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Ruc</label>
                                        <input ng-model="usuarioa.colaborador.ruc" name="ruc" class="form-control input-sm" placeholder="RUC" type="number">
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-3">
                                        <label>Fecha nacimiento</label>
                                        <input ng-model="usuarioa.colaborador.fechanac" name="fechanac" class="form-control input-sm" placeholder="FECHA NACIMIENTO">
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
                                                        <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais4" ng-change="listarDepartamento4()" name="pais" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Departamento</label>
                                                        <select ng-options="departamento as departamento.denominacion for departamento in departamentos4 track by departamento.id" ng-model="departamento4" ng-change="listarProvincia4()" name="departamento" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Provincia</label>
                                                        <select ng-options="provincia as provincia.denominacion for provincia in provincias4 track by provincia.id" ng-model="provincia4" ng-change="listarDistrito4()" name="provincia" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-4">
                                                        <label>Distrito</label>
                                                        <select ng-options="distrito as distrito.denominacion for distrito in distritos4 track by distrito.id" ng-model="distrito4" name="distrito" class="form-control input-sm"></select>
                                                    </div>
                                                    <div class="col-ss-12 col-xs-8">
                                                        <label>Dirección <span class="span-salmon">(*)</span></label>
                                                        <input ng-model="usuarioa.colaborador.direccion" name="direccion" class="form-control input-sm" placeholder="DIRECCION" uppercased>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="row">
                                <fieldset>
                                    <legend>Datos de usuario</legend>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Agencia <span class="span-salmon">(*)</span></label>
                                        <select ng-options="agencia as agencia.razonsocial for agencia in agencias track by agencia.id" ng-model="usuarioa.colaborador.agencia" name="agencia" class="form-control input-sm"></select>
                                    </div>
                                    <div class="col-ss-12 col-xs-6 col-sm-4">
                                        <label>Cargo <span class="span-salmon">(*)</span></label>
                                        <input ng-model="usuarioa.colaborador.cargo" name="cargo" class="form-control input-sm" type="text" placeholder="CARGO" uppercased>
                                    </div>
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
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/indexModule.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                                                    $('#file-fr').fileinput({
                                                                                        allowedFileExtensions: ['jpg'],
                                                                                        maxFileSize: 100000,
                                                                                        maxFileCount: 1
                                                                                    });

                                                                                    $('form[name=formulariou] input[name=fechanac]').datepicker({dateFormat: 'yy-mm-dd'});
                                                                                    $('form[name=formularioua] input[name=fechanac]').datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>