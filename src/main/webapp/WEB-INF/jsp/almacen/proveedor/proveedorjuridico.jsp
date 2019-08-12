<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="proveedorModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Proveedor juridico</title>
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

        <script src="${pageContext.request.contextPath}/assets/js/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-ui-1.11.4.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="proveedorjuridicoController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>REGISTRAR PROVEEDOR JURIDICO</h2>
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
                                        <fieldset>
                                            <form name="formulariopj" ng-validate="validatepj">
                                                <div class="col-ss-12 col-xs-12 col-sm-12">
                                                    <div class="panel panel-primary">
                                                        <div class="panel-heading">
                                                            <label>DATOS PRINCIPALES</label>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="form-group col-ss-12 col-xs-3 col-sm-2">
                                                                    <label>CÓDIGO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.codigo" name="codigo" class="form-control input-sm" type="text" disabled="" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-5 col-sm-4">
                                                                    <label>TIPO PROVEEDOR<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="tipoproveedor as tipoproveedor.nombre for tipoproveedor in tipoproveedores track by tipoproveedor.id" ng-model="proveedor.idttipoproveedor" name="tipoproveedor" class="form-control input-sm" disabled=""></select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                    <label>ESTADO<span class="span-salmon">(*)</span></label>
                                                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="proveedor.estado" name="estado" class="form-control input-sm" disabled=""></select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                    <label>RUC<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.proveedorjuridico.ruc" name="ruc" class="form-control input-sm" type="number">
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-ss-12 col-xs-5 col-sm-6">
                                                                    <label>RAZON SOCIAL<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.proveedorjuridico.razonsocial" name="razonsocial" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                    <label>NOMBRE COMERCIAL<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.proveedorjuridico.nombrecomercial" name="nombrecomercial" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                    <label>GIRO NEGOCIO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.proveedorjuridico.jironegocio" name="jironegocio" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                    <label>TELÉFONO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.proveedorjuridico.telefono" name="telefono" class="form-control input-sm" type="number">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                    <label>FECHA FUNDACIÓN</label>
                                                                    <input ng-model="proveedor.proveedorjuridico.fechafundacion" name="fechafundacion" class="form-control input-sm">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-3 col-sm-3">
                                                                    <label>EMAIL</label>
                                                                    <input ng-model="proveedor.proveedorjuridico.email" name="email" class="form-control input-sm" uppercased>
                                                                </div>
                                                            </div> 
                                                            <legend>--DATOS DEL DOMICILIO FISCAL--</legend>
                                                            <div class="row">
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>PAIS</label>
                                                                    <select ng-options="pais as pais.denominacion for pais in paises track by pais.id" ng-model="pais" ng-change="listarDepartamento()" name="pais" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>DEPARTAMENTO</label>
                                                                    <select ng-options="departamento as departamento.denominacion for departamento in departamentos track by departamento.id" ng-model="departamento" ng-change="listarProvincia()" name="departamento" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>PROVINCIA</label>
                                                                    <select ng-options="provincia as provincia.denominacion for provincia in provincias track by provincia.id" ng-model="provincia" ng-change="listarDistrito()" name="provincia" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>DISTRITO</label>
                                                                    <select ng-options="distrito as distrito.denominacion for distrito in distritos track by distrito.id" ng-model="distrito" name="distrito" class="form-control input-sm"></select>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-8 col-sm-8">
                                                                    <label>DIRECCIÓN<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="proveedor.proveedorjuridico.direccion" name="direccion" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </fieldset>
                                        <fieldset>
                                            <div class="col-ss-12 col-xs-12 col-sm-12">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <label>REGISTRAR REPRESENTANTE LEGAL</label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <form name="formulariorl" ng-submit="registrarrl(formulariorl)" ng-validate="validaterl">
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>DNI<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="representantelegal.dni" name="dni" class="form-control input-sm" type="number">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>NOMBRE<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="representantelegal.nombre" name="nombre" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>APELLIDO PATERNO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="representantelegal.apellidopat" name="apellidopat" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>APELLIDO MATERNO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="representantelegal.apellidomat" name="apellidomat" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>CARGO<span class="span-salmon">(*)</span></label>
                                                                    <input ng-model="representantelegal.cargo" name="cargo" class="form-control input-sm" type="text" uppercased>
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>CELULAR</label>
                                                                    <input ng-model="representantelegal.celular" name="celular" class="form-control input-sm" type="number">
                                                                </div>
                                                                <div class="form-group col-ss-12 col-xs-4 col-sm-4">
                                                                    <label>EMAIL</label>
                                                                    <input ng-model="representantelegal.email" name="email" class="form-control input-sm" uppercased>
                                                                </div>
                                                                <div class="col-ss-12 col-xs-12 col-sm-12" style="padding-top: 15px">
                                                                    <button type="submit" class="btn btn-success">Add. Representante Legal</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-ss-12 col-xs-12">
                                                                <table class="table table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>N°</th>
                                                                            <th>NOMBRE COMPLETO</th>
                                                                            <th>DNI</th>
                                                                            <th>CARGO</th>
                                                                            <th>Opt.</th>
                                                                            <th>Opt.</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr ng-show="representantelegals.length > 0" ng-repeat="representantelegal in representantelegals">
                                                                            <td>{{representantelegal.id}}</td>
                                                                            <td>{{representantelegal.nombre}}, {{representantelegal.apellidopat}} {{representantelegal.apellidomat}}</td>
                                                                            <td>{{representantelegal.dni}}</td>
                                                                            <td>{{representantelegal.cargo}}</td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="mostrarrl(representantelegal)" style="color: blue"><i class="fa fa-edit"></i>Mod.</a>
                                                                            </td>
                                                                            <td>
                                                                                <a href="javascript:void(0)" ng-click="eliminarrl(representantelegal)" style="color: red"><i class="fa fa-trash"></i>Del.</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr ng-show="representantelegals.length <= 0">
                                                                            <td colspan="5" class="dataTables_empty">No hay ningun registro de representante legal</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-ss-12 col-xs-12 col-sm-12">
                                            <button ng-click="registrarpj(formulariopj)" type="button" class="btn btn-primary">REGISTRAR</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <div class="profile_title">
                                        <div class="col-ss-12 col-xs-4">
                                            <h2>LISTA DE PROVEEDORES JURIDICOS</h2>
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
                                    <div class="row">
                                        <div class="col-ss-12 col-xs-12">
                                            <table class="table table-striped jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th>N°</th>
                                                        <th>Codigo</th>
                                                        <th>Razon social</th>
                                                        <th>Ruc</th>
                                                        <th>Telefono</th>
                                                        <th>Direccion</th>
                                                        <th>Estado</th>
                                                        <th>Rpt.</th>
                                                        <th>Opt.</th>
                                                        <th>Opt.</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-show="proveedores.length > 0" dir-paginate="proveedor in proveedores|itemsPerPage:15">
                                                        <td>{{proveedor.id}}</td>
                                                        <td>{{proveedor.codigo}}</td>
                                                        <td>{{proveedor.proveedorjuridico.razonsocial}}</td>
                                                        <td>{{proveedor.proveedorjuridico.ruc}}</td>
                                                        <td>{{proveedor.proveedorjuridico.telefono}}</td>
                                                        <td>{{proveedor.proveedorjuridico.direccion}}</td>
                                                        <td>{{proveedor.estado}}</td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/proveedor/fichapj?type=pdf&&id={{proveedor.id}}" target="_blank" style="color: blueviolet"><i class="fa fa-file-pdf-o"></i> Rpt.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostrarpj(proveedor)" style="color: blue"><i class="fa fa-edit"></i> Mod.</a>

                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="eliminarpj(proveedor)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="proveedores.length <= 0">
                                                        <td colspan="11" class="dataTables_empty">No hay ningun registro de representante legal</td>
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
                    <jsp:include page="../shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>

        <div id="modalpj" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title text-center">Modificar proveedor juridico <b>{{proveedora.codigo}}</b></h4>
                    </div>
                    <div class="modal-body">
                        <form name="formulariopja" ng-submit="actualizarpj(formulariopja)" ng-validate="validatepj">
                            <div class="row">
                                <div class="col-ss-12 col-xs-4">
                                    <label>Tipo proveedor <span class="span-salmon">(*)</span></label>
                                    <select ng-options="tipoproveedor as tipoproveedor.nombre for tipoproveedor in tipoproveedores track by tipoproveedor.id" ng-model="proveedora.idttipoproveedor" name="tipoproveedor" class="form-control input-sm" disabled=""></select>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Estado <span class="span-salmon">(*)</span></label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="proveedora.estado" name="estado" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Ruc <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedorjuridico.ruc" name="ruc" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>Razon social <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedorjuridico.razonsocial" name="razonsocial" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Nombre comercial <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedorjuridico.nombrecomercial" name="nombrecomercial" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Jiro de negocio <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedorjuridico.jironegocio" name="jironegocio" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Telefono <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedorjuridico.telefono" name="telefono" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Fecha fundacion</label>
                                    <input ng-model="proveedora.proveedorjuridico.fechafundacion" name="fechafundacion" class="form-control input-sm">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Email</label>
                                    <input ng-model="proveedora.proveedorjuridico.email" name="email" class="form-control input-sm" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-12 btn-col">
                                    <div class="panel panel-danger">
                                        <div class="panel-heading">
                                            <label>Domicilio fiscal</label>
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
                                                    <label>Direccion <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="proveedora.proveedorjuridico.direccion" name="direccion" class="form-control input-sm" type="text" uppercased>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <form name="formulariorla" ng-submit="registrarrla(formulariorla)" ng-validate="validaterl">
                            <div class="row">
                                <legend>Representante legal</legend>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Dni <span class="span-salmon">(*)</span></label>
                                    <input ng-model="representantelegala.dni" name="dni" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Nombre <span class="span-salmon">(*)</span></label>
                                    <input ng-model="representantelegala.nombre" name="nombre" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                    <input ng-model="representantelegala.apellidopat" name="apellidopat" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                    <input ng-model="representantelegala.apellidomat" name="apellidomat" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Cargo <span class="span-salmon">(*)</span></label>
                                    <input ng-model="representantelegala.cargo" name="cargo" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Celular</label>
                                    <input ng-model="representantelegala.celular" name="celular" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Email</label>
                                    <input ng-model="representantelegala.email" name="email" class="form-control input-sm" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-12" style="padding-top: 15px">
                                    <button type="submit" class="btn btn-success btn-xs">Agregar repr. leg.</button>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-ss-12 col-xs-12">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Nombre</th>
                                            <th>Dni</th>
                                            <th>Cargo</th>
                                            <th>Opt.</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-show="representantelegalsa.length > 0" ng-repeat="representantelegal in representantelegalsa">
                                            <td>{{representantelegal.id}}</td>
                                            <td>{{representantelegal.nombre}} {{representantelegal.apellidopat}} {{representantelegal.apellidomat}}</td>
                                            <td>{{representantelegal.dni}}</td>
                                            <td>{{representantelegal.cargo}}</td>
                                            <td>
                                                <a href="javascript:void(0)" ng-click="eliminarrla(representantelegal)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                            </td>
                                        </tr>
                                        <tr ng-show="representantelegalsa.length <= 0">
                                            <td colspan="5" class="dataTables_empty">No hay ningun registro de representante legal</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" ng-click="actualizarpj(formulariopja)" class="btn btn-primary">Actualizar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/proveedorModule.js" type="text/javascript"></script>

        <script type="text/javascript">
                                    $("form[name=formulariopj] input[name=fechafundacion]").datepicker({dateFormat: 'yy-mm-dd'});
                                    $("form[name=formulariopja] input[name=fechafundacion]").datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>
