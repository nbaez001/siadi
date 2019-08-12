<%-- 
    Document   : success
    Created on : 11/08/2019, 03:19:06 AM
    Author     : NERIO
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Confirmation Page</title>
    </head>
    <body>
        message : ${success}
        <br/>
        <br/>
        Go back to <a href="<c:url value='/list' />">List of All Employees</a>
    </body>
</html>
