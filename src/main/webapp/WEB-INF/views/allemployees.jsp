<%-- 
    Document   : allemployees
    Created on : 11/08/2019, 03:18:38 AM
    Author     : NERIO
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Enrollments</title>
        <style>
            tr:first-child{
                font-weight: bold;
                background-color: #C6C9C4;
            }
        </style>
    </head>
    <body>
        <h2>List of Employees</h2>  
        <table>
            <tr>
                <td>NAME</td><td>Joining Date</td><td>Salary</td><td>SSN</td><td></td>
            </tr>
            <c:forEach items="${employees}" var="employee">
                <tr>
                    <td>${employee.name}</td>
                    <td>${employee.joiningDate}</td>
                    <td>${employee.salary}</td>
                    <td><a href="<c:url value='/edit-${employee.ssn}-employee' />">${employee.ssn}</a></td>
                    <td><a href="<c:url value='/delete-${employee.ssn}-employee' />">delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <br>
        
        <h2>List of colaboradores</h2>  
        <table>
            <tr>
                <td>NAME</td>
            </tr>
            <c:forEach items="${colaboradores}" var="col">
                <tr>
                    <td>${col.nombre}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <a href="<c:url value='/new' />">Add New Employee</a>
    </body>
</html>
