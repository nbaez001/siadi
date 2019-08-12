<%-- 
    Document   : proveedornatural
    Created on : 08/09/2016, 04:42:19 PM
    Author     : ROMAQUI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="proveedorModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Proveedor natural</title>
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
        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="proveedornaturalController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>

                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>REGISTRAR PROVEEDOR NATURAL</h2>
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
                                    <fieldset>
                                        <form name="formulariopn" ng-submit="registrarpn(formulariopn)" ng-validate="validatepn">
                                            <div class="col-ss-12 col-xs-12 col-sm-12">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <label>DATOS PRINCIPALES</label>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="form-group col-ss-12 col-xs-3 col-sm-2">
                                                                <label>CÓDIGO<span class="span-salmon">(*)</span></label>
                                                                <input ng-model="proveedor.codigo" name="codigo" class="form-control input-sm" type="text" disabled="">
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-5 col-sm-4">
                                                                <label>TIPO PROVEEDOR<span class="span-salmon">(*)</span></label>
                                                                <select ng-options="tipoproveedor as tipoproveedor.nombre for tipoproveedor in tipoproveedores track by tipoproveedor.id" ng-model="proveedor.idttipoproveedor" name="tipoproveedor" class="form-control input-sm" disabled=""></select>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>ESTADO<span class="span-salmon">(*)</span></label>
                                                                <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="proveedor.estado" name="estado" class="form-control input-sm" disabled=""></select>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>DNI<span class="span-salmon">(*)</span></label>
                                                                <input ng-model="proveedor.proveedornatural.dni" name="dni" class="form-control input-sm" type="number">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>NOMBRE<span class="span-salmon">(*)</span></label>
                                                                <input ng-model="proveedor.proveedornatural.nombre" name="nombre" class="form-control input-sm" type="text" uppercased>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>APELLIDO PATERNO<span class="span-salmon">(*)</span></label>
                                                                <input ng-model="proveedor.proveedornatural.apellidopat" name="apellidopaterno" class="form-control input-sm" type="text" uppercased>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>APELLIDO MATERNO<span class="span-salmon">(*)</span></label>
                                                                <input ng-model="proveedor.proveedornatural.apellidomat" name="apellidomaterno" class="form-control input-sm" type="text" uppercased>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>SEXO<span class="span-salmon">(*)</span></label>
                                                                <select ng-options="genero as genero.nombre for genero in generos track by genero.id" ng-model="proveedor.proveedornatural.idtgenero" name="genero" class="form-control input-sm"></select>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-ss-12 col-xs-4 col-sm-3">
                                                                <label>CELULAR<span class="span-salmon">(*)</span></label>
                                                                <input ng-model="proveedor.proveedornatural.celular" name="celular" class="form-control input-sm" type="number">
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                <label>ESTADO CIVIL<span class="span-salmon">(*)</span></label>
                                                                <select ng-options="estadocivil as estadocivil.nombre for estadocivil in estadociviles track by estadocivil.id" ng-model="proveedor.proveedornatural.idtestadocivil" name="estadocivil" class="form-control input-sm"></select>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                <label>RUC</label>
                                                                <input ng-model="proveedor.proveedornatural.ruc"  class="form-control input-sm" type="number">
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                <label>FECHA NACIMIENTO</label>
                                                                <input ng-model="proveedor.proveedornatural.fechanac" name="fechanac" class="form-control input-sm" placeholder="--2016-12-13--">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-ss-12 col-xs-12 col-sm-6">
                                                                <label>OBSERVACIÓN</label>
                                                                <textarea ng-model="proveedor.observacion" name="observacion" class="form-control input-sm" rows="2" uppercased></textarea>
                                                            </div>
                                                            <div class="form-group col-ss-12 col-xs-6 col-sm-3">
                                                                <label>EMAIL</label>
                                                                <input ng-model="proveedor.proveedornatural.email" name="email" class="form-control input-sm" uppercased>
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
                                                                <input ng-model="proveedor.proveedornatural.direccion" name="direccion" class="form-control input-sm" type="text" uppercased>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>   
                                            </div>
                                            <div class="col-ss-12 col-xs-12 col-sm-12">
                                                <button type="submit" class="btn btn-primary">REGISTRAR</button>
                                            </div>
                                        </form>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <div class="profile_title">
                                        <div class="col-ss-12 col-xs-4">
                                            <h2>Lista de proveedor natural</h2>
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
                                                        <th>Nombre</th>
                                                        <th>Celular</th>                                                        
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
                                                        <td>{{proveedor.proveedornatural.nombre}}, {{proveedor.proveedornatural.apellidopat}} {{proveedor.proveedornatural.apellidomat}}</td>
                                                        <td>{{proveedor.proveedornatural.celular}}</td>
                                                        <td>{{proveedor.proveedornatural.direccion}}</td>
                                                        <td>{{proveedor.estado}}</td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/proveedor/fichapn?type=pdf&&id={{proveedor.id}}" target="_blank" style="color: blueviolet"><i class="fa fa-file-pdf-o"></i> Rpt.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="mostrarpn(proveedor)" style="color: blue" data-toggle="modal" data-target="#modalpn"><i class="fa fa-edit"></i>Actu.</a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" ng-click="eliminarpn(proveedor)" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                        </td>
                                                    </tr>
                                                    <tr ng-show="proveedores.length <= 0">
                                                        <td colspan="9" class="dataTables_empty">No hay ningun registro de representante legal</td>
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

        <div id="modalpn" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="formulariopna" ng-submit="actualizarpn(formulariopna)" ng-validate="validatepn">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modificar proveedor natural</h4>
                        </div>
                        <div class="modal-body">                                   
                            <div class="row">
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>Codigo <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.codigo" name="codigo" class="form-control input-sm" type="text" disabled="" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>Estado <span class="span-salmon">(*)</span></label>
                                    <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="proveedora.estado" name="estado" class="form-control input-sm" disabled=""></select>
                                </div>
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>Tipo proveedor <span class="span-salmon">(*)</span></label>
                                    <select ng-options="tipoproveedor as tipoproveedor.nombre for tipoproveedor in tipoproveedores track by tipoproveedor.id" ng-model="proveedora.idttipoproveedor" name="tipoproveedor" class="form-control input-sm" disabled=""></select>
                                </div>                                
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>DNI <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedornatural.dni" name="ruc" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>Nombre <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedornatural.nombre" name="nombre" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>Apellido paterno <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedornatural.apellidopat" name="apellidopaterno" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Apellido materno <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedornatural.apellidomat" name="apellidomaterno" class="form-control input-sm" type="text" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Celular <span class="span-salmon">(*)</span></label>
                                    <input ng-model="proveedora.proveedornatural.celular" name="celular" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Genero <span class="span-salmon">(*)</span></label>
                                    <select ng-options="genero as genero.nombre for genero in generos track by genero.id" ng-model="proveedora.proveedornatural.idtgenero" name="genero" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Estado Civil <span class="span-salmon">(*)</span></label>
                                    <select ng-options="estadocivil as estadocivil.nombre for estadocivil in estadociviles track by estadocivil.id" ng-model="proveedora.proveedornatural.idtestadocivil" name="estadocivil" class="form-control input-sm"></select>
                                </div>
                                <div class="col-ss-12 col-xs-4 ">
                                    <label>RUC </label>
                                    <input ng-model="proveedora.proveedornatural.ruc" name="ruc" class="form-control input-sm" type="number">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Fecha nacimiento </label>
                                    <input ng-model="proveedora.proveedornatural.fechanac" name="fechanac" class="form-control input-sm">
                                </div>
                                <div class="col-ss-12 col-xs-4">
                                    <label>Email</label>
                                    <input ng-model="proveedora.proveedornatural.email" name="email" class="form-control input-sm" uppercased>
                                </div>
                                <div class="col-ss-12 col-xs-12">
                                    <label>Observacion</label>
                                    <textarea ng-model="proveedora.observacion" name="observacion" class="form-control input-sm" rows="4" uppercased></textarea>
                                </div>
                                <div class="col-ss-12 col-xs-12 btn-col"> 
                                    <div class="panel panel-danger">
                                        <div class="panel-heading">
                                            <label>Datos del domicilio</label>
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
                                                    <label>Direccion <span class="span-salmon">(*)</span></label>
                                                    <input ng-model="proveedora.proveedornatural.direccion" name="direccion" class="form-control input-sm" type="text" uppercased>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/almacen/proveedorModule.js" type="text/javascript"></script>

        <script type="text/javascript">
                                                                $("form[name=formulariopn] input[name=fechanac]").datepicker({dateFormat: 'yy-mm-dd'});
                                                                $("form[name=formulariopna] input[name=fechanac]").datepicker({dateFormat: 'yy-mm-dd'});
        </script>
    </body>
</html>
