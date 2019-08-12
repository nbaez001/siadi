<%-- 
    Document   : marca
    Created on : 22/08/2016, 04:27:38 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="administracionModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Parametros venta</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap-3.3.6.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/admin/animate.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap/build.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/cmxform.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datatables/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/assets/css/admin/site.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/admin/custom.css" rel="stylesheet">
        
        <link href="${pageContext.request.contextPath}/assets/css/orgchart/organigrama.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            var contextPath = '${pageContext.request.contextPath}';</script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap-3.3.6.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/orgchart/organigrama.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/admin/custom.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/notify/pnotify.nonblock.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body class="nav-md" ng-controller="paramspersonalController" ng-cloak>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../shared/navbar.jsp" flush="true"/>
                <jsp:include page="../shared/header.jsp" flush="true"/>
                <div class="right_col">
                    <div class="row">
                        <div class="col-ss-12 col-xs-4 col-xs-push-8 col-lg-3 col-lg-push-9">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="overflow: visible">Registrar dependencia</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <form name="formulariod" ng-validate="validated">
                                        <div class="row">
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Agencia</label>
                                                <input ng-model="dependencia.agencia.razonsocial" class="form-control input-sm" type="text" disabled="">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Dependencia superior <span class="span-salmon">(*)</span></label>
                                                <select ng-options="iddepende as iddepende.nombre for iddepende in dependencias2 track by iddepende.id" ng-model="dependencia.iddepende" class="form-control input-sm" name="iddepende">
                                                </select>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Nombre <span class="span-salmon">(*)</span></label>
                                                <input ng-model="dependencia.nombre" ng-keyup="obtenerCodigo(dependencia)" class="form-control input-sm" name="nombre" uppercased type="text" placeholder="NOMBRE DEPENDENCIA">
                                                <div class="checkbox checkbox-success">
                                                    <input ng-model="dependencia.rrhh" id="rrhh" type="checkbox" title="Confirmar oficina de recursos humanos, para otorgar privilegios">
                                                    <label for="rrhh" title="Confirmar oficina de recursos humanos, para otorgar privilegios">
                                                        ¿Es la oficina de R.R.H.H.?
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Abreviatura <span class="span-salmon">(*)</span></label>
                                                <input ng-model="dependencia.abreviatura" class="form-control input-sm" name="abreviatura" uppercased type="text" placeholder="ABREVIATURA">
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Estado <span class="span-salmon">(*)</span></label>
                                                <select ng-options="estado as estado.nombre for estado in estados track by estado.id" ng-model="dependencia.estado" class="form-control input-sm" name="estado">
                                                </select>
                                            </div>
                                            <div class="col-ss-12 col-xs-12">
                                                <label>Descripcion </label>
                                                <textarea ng-model="dependencia.descripcion" class="form-control input-sm" name="descripcion" uppercased placeholder="DESCRIPCION" rows="2">
                                                </textarea>
                                            </div>
                                            <div class="col-ss-12 col-xs-12 btn-col">
                                                <button ng-if="dependencia.id <= 0" ng-click="registrard(formulariod)" type="button" class="btn btn-primary btn-sm">Registrar</button>
                                                <button ng-if="dependencia.id > 0" ng-click="actualizard(formulariod)" type="button" class="btn btn-primary btn-sm">Atualizar</button>
                                                <button ng-if="dependencia.id > 0" ng-click="cancelard()" type="button" class="btn btn-danger btn-sm">Cancelar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-ss-12 col-xs-8 col-xs-pull-4 col-lg-9 col-lg-pull-3">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Lista de dependencias</h2>
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
                                    <table class="table table-striped jambo_table">
                                        <thead>
                                            <tr>
                                                <th ng-click="sort('id')">N°
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'id'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('nombre')">Nombre
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('abreviatura')">Abreviatura
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'abreviatura'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('iddepende.nombre')">Superior
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'iddepende.nombre'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th ng-click="sort('estado')">Estado
                                                    <span class="glyphicon sort-icon" ng-show="sortKey === 'estado'" ng-class="{'glyphicon-chevron-up':reverse, 'glyphicon-chevron-down':!reverse}"></span>
                                                </th>
                                                <th>Opt.</th>
                                                <th>Opt.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-show="dependencias.length > 0" dir-paginate="dependencia in dependencias|itemsPerPage:7|filter:buscar|orderBy:sortKey:reverse" pagination-id="tc">
                                                <td>{{$index + 1}}</td>
                                                <td>{{dependencia.nombre}}</td>
                                                <td>{{dependencia.abreviatura}}</td>
                                                <td>{{dependencia.iddepende.nombre}}</td>
                                                <td>{{dependencia.estado}}</td>
                                                <td>
                                                    <a href="javascript:void(0)" ng-click="mostrard(dependencia)" ng-show="dependencia.id !== 0" style="color: blue"><i class="fa fa-edit"></i> Edit.</a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0)" ng-click="eliminard(dependencia)" ng-show="dependencia.id !== 0" style="color: red"><i class="fa fa-trash"></i> Del.</a>
                                                </td>
                                            </tr>
                                            <tr ng-show="dependencias.length <= 0">
                                                <td colspan="8" class="dataTables_empty">No se encontró ningun registro de dependencias</td>
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
                        </div>
                        <div class="col-ss-12 col-xs-12" id="organigrama">
                            
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

        <script src="${pageContext.request.contextPath}/assets/controller/personal/administracionModule.js" type="text/javascript"></script>
        <script type='text/javascript'>
	(function(){
		// Carga de datos para el organigrama
		organigrama.data = data;
		// creación del organigrama, se le manda el id del contenedor
		organigrama.create('organigrama');
		// Agregamos los eventos para los botones
		organigrama.eventAdd(EventoAdd);
		organigrama.eventEdit(EventoEdit);

		function EventoAdd(id){
			$('#myModal').modal('show');
		}

		function EventoEdit(id){
			$('#myModal').modal('show');
		}
		$('#myModal').modal({
		  keyboard: false,
		  backdrop: "static",
		  show: false
		});
	})();
</script>
    </body>
</html>
