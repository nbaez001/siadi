<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="${pageContext.request.contextPath}/modulos" class="site_title"><i class="fa fa-paw"></i> <span>SIADI</span></a>
        </div>
        <div class="clearfix"></div>
        <div class="profile">
            <div class="profile_pic">
                <img src="${pageContext.request.contextPath}/assets/files/img/admin.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2>${user.colaborador.nombre} ${user.colaborador.apellidopat}</h2>
            </div>
        </div>
        <br/>
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>${user.colaborador.cargo}</h3>
                <ul class="nav side-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}${modulo.ruta}/home"><i class="fa fa-home"></i> Home</a>
                    </li>
                    <c:forEach var="rol" items="${modulo.rolaccesos}">
                        <li><a><i class="fa ${rol.icono}"></i> ${rol.nombre} <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                <c:forEach var="funcion" items="${rol.funcionaccesos}">
                                    <li><a href="${pageContext.request.contextPath}${modulo.ruta}${rol.ruta}${funcion.ruta}">${funcion.nombre}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
    </div>
</div>
