<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.DeptAdmin" %>
<%@ page import="com.health.HistoryInfoSystem.Department" %>
<%@ page import="com.health.HistoryInfoSystem.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Admin admin=(Admin) session.getAttribute("admin");
    Department[] departments=(Department[]) request.getAttribute("departments");
    DeptAdmin[] deptAdmins=(DeptAdmin[]) request.getAttribute("deptAdmins");
%>

<html>
<head>
    <title>${admin.getName()}</title>
</head>
<body>
    ${message}
    <table>
        <caption>Departments</caption>
        <tr>
            <th>Department ID</th>
            <th>Department Name</th>
            <th></th>
        </tr>
        <c:forEach items="${departments}" var="department">
            <form action="delete-department" method="post">
            <tr>
                <td><input type="number" value="${department.getDepartmentId()}" name="departmentId" readonly></td>
                <td><input type="text" value="${department.getName()}" name="departmentName" readonly></td>
                <td><input type="submit" value="Delete"></td>
            </tr>
            </form>
        </c:forEach>
        <form action="add-department" method="post">
            <tr>
                <td><input type="number" value="" name="departmentId" readonly></td>
                <td><input type="text" name="departmentName"></td>
                <td><input type="submit" value="Add"></td>
            </tr>
        </form>
    </table>
    </br>
    </br>
    <table>
    <caption>Department Admins</caption>
    <tr>
        <th>Admin ID</th>
        <th>Admin Name</th>
        <th>Admins' Department ID</th>
        <th>Admins' Department Name</th>
        <th>Admins' Username</th>
        <th>Admins' Password</th>
        <th></th>
    </tr>
    <c:forEach items="${deptAdmins}" var="deptAdmin">
        <form action="delete-departmentAdmin" method="post">
            <tr>
                <td><input type="number" value="${deptAdmin.getAdminId()}" name="deptAdminId" readonly></td>
                <td><input type="text" value="${deptAdmin.getName()}" name="name" readonly></td>
                <td><input type="number" value="${deptAdmin.getDepartmentId()}" name="deptId" readonly></td>
                <td><input type="text" value="${deptAdmin.getDepartmentName()}" name="deptName" readonly></td>
                <td><input type="text" value="${deptAdmin.getUsername()}" name="username" readonly></td>
                <td><input type="text" value="${deptAdmin.getPassword()}" name="password" readonly></td>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </form>
    </c:forEach>
    <form action="add-departmentAdmin" method="post">
        <tr>
            <td><input type="number" name="deptAdminId" readonly></td>
            <td><input type="text" name="name"></td>
            <td><input type="hidden" value="" name="deptId" readonly></td>
            <td><input type="text" name="deptName" ></td>
            <td><input type="text" name="username" ></td>
            <td><input type="text" name="password"></td>
            <td><input type="submit" value="Add"></td>
        </tr>
    </form>
    </table>
    <style>
        table,th,td {
            border: 1px solid black;
        }
    </style>
</body>
</html>
