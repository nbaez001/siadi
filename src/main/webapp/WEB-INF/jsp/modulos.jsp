<%-- 
    Document   : index
    Created on : 18/08/2016, 05:36:16 PM
    Author     : nerio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="indexModule">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Modulos</title>
        <jsp:include page="shared/favicon.jsp" flush="true"/>
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

        <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js" type="text/javascript"></script>
    </head>
    <body style="background:#F7F7F7;" ng-controller="modulosController" ng-cloak>
        <div style="width: 90%;margin: 0 auto">
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div class="container">
                <div class="animate">
                    <div class="" style="min-height: 640px">
                        <div class="page-title">
                            <div class="title_left">
                                <h4>MODULOS DE ACCESO AL SISTEMA <small>SIADI</small></h4>
                            </div>
                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Buscar...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Ir!</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div ng-show="mostrar" class="row">
                            <p style="font-weight: bold; color: red; font-size: 17px">${message}</p>
                        </div>
                        <div class="row">
                            <c:forEach var="modulo" items="${user.moduloaccesos}">
                                <a href="${pageContext.request.contextPath}${modulo.ruta}/home">
                                    <div class="animated flipInY col-ss-12 col-xs-6 col-sm-4">
                                        <c:choose>
                                            <c:when test="${modulo.codigo eq '01'}">
                                                <div class="panel panel-primary">
                                                    <div class="panel-heading">
                                                        <div class="row">
                                                            <div class="col-xs-3">
                                                                <i class="fa ${modulo.icono} fa-5x"></i>
                                                            </div>
                                                            <div class="col-xs-9 text-right pull-right">
                                                                <div class="huge"><i class="fa fa-desktop"></i></div>
                                                                <div>${modulo.nombre}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Ir a modulo</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${modulo.codigo eq '02'}">
                                                <div class="panel panel-red">
                                                    <div class="panel-heading">
                                                        <div class="row">
                                                            <div class="col-xs-3">
                                                                <i class="fa ${modulo.icono} fa-5x"></i>
                                                            </div>
                                                            <div class="col-xs-9 text-right pull-right">
                                                                <div class="huge"><i class="fa fa-desktop"></i></div>
                                                                <div>${modulo.nombre}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Ir a modulo</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${modulo.codigo eq '03'}">
                                                <div class="panel panel-green">
                                                    <div class="panel-heading">
                                                        <div class="row">
                                                            <div class="col-xs-3">
                                                                <i class="fa ${modulo.icono} fa-5x"></i>
                                                            </div>
                                                            <div class="col-xs-9 text-right pull-right">
                                                                <div class="huge"><i class="fa fa-desktop"></i></div>
                                                                <div>${modulo.nombre}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Ir a modulo</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${modulo.codigo eq '04'}">
                                                <div class="panel panel-yellow">
                                                    <div class="panel-heading">
                                                        <div class="row">
                                                            <div class="col-xs-3">
                                                                <i class="fa ${modulo.icono} fa-5x"></i>
                                                            </div>
                                                            <div class="col-xs-9 text-right pull-right">
                                                                <div class="huge"><i class="fa fa-desktop"></i></div>
                                                                <div>${modulo.nombre}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Ir a modulo</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="panel panel-purple">
                                                    <div class="panel-heading">
                                                        <div class="row">
                                                            <div class="col-xs-3">
                                                                <i class="fa ${modulo.icono} fa-5x"></i>
                                                            </div>
                                                            <div class="col-xs-9 text-right pull-right">
                                                                <div class="huge"><i class="fa fa-desktop"></i></div>
                                                                <div>${modulo.nombre}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <span class="pull-left">Ir a modulo</span>
                                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <jsp:include page="shared/footer.jsp" flush="true"/>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-local-storage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-components.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/angular/angular-pagination.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/controller/indexModule.js" type="text/javascript"></script>
    </body>
</html>