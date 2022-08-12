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
    <link rel="stylesheet" href="<c:url value="/assets/css/zone.css"/>" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200&family=Indie+Flower&family=Rubik+Moonrocks&family=Skranji&display=swap" rel="stylesheet">
</head>
<body>
<main>

        <div class="page">
            <h1>Departments</h1>
            <table class="layout display responsive-table">
                <thead>
        <tr>
            <th>Department ID</th>
            <th>Department Name</th>
            <th></th>
        </tr>
                </thead>
                <tbody>
        <c:forEach items="${departments}" var="department">
            <form action="delete-department" method="post">
            <tr>
                <td><input type="number" value="${department.getDepartmentId()}" name="departmentId" readonly></td>
                <td><input type="text" value="${department.getName()}" name="departmentName" readonly></td>
                <td><input type="submit" value="Delete" class="bt"></td>
            </tr>
            </form>
        </c:forEach>
        <form action="add-department" method="post">
            <tr>
                <td><input type="number" value="" name="departmentId" readonly></td>
                <td><input type="text" name="departmentName" required></td>
                <td><input type="submit" value="Add" class="bt"></td>
            </tr>
        </form>
                </tbody>
    </table>
    </div>
    </br>
    </br>
    <div class="page">
        <h1>Department Admins</h1>
        <table class="layout display responsive-table">
            <thead>
    <tr>
        <th>Admin ID</th>
        <th>Admin Name</th>
        <th>Admins' Department ID</th>
        <th>Admins' Department Name</th>
        <th>Admins' Username</th>
        <th>Admins' Password</th>
        <th></th>
    </tr>
            </thead>
        <tbody>
    <c:forEach items="${deptAdmins}" var="deptAdmin">
        <form action="delete-departmentAdmin" method="post">
            <tr>
                <td><input type="number" value="${deptAdmin.getAdminId()}" name="deptAdminId" readonly></td>
                <td><input type="text" value="${deptAdmin.getName()}" name="name" readonly></td>
                <td><input type="number" value="${deptAdmin.getDepartmentId()}" name="deptId" readonly></td>
                <td><input type="text" value="${deptAdmin.getDepartmentName()}" name="deptName" readonly></td>
                <td><input type="text" value="${deptAdmin.getUsername()}" name="username" readonly></td>
                <td><input type="text" value="${deptAdmin.getPassword()}" name="password" readonly></td>
                <td><input type="submit" value="Delete" class="bt"></td>
            </tr>
        </form>
    </c:forEach>
    <form action="add-departmentAdmin" method="post">
        <tr>
            <td><input type="number" name="deptAdminId" readonly></td>
            <td><input type="text" name="name" required></td>
            <td><input type="hidden" value="" name="deptId" readonly></td>
            <td><input type="text" name="deptName"  required></td>
            <td><input type="text" name="username"  required></td>
            <td><input type="text" name="password" required></td>
            <td><input type="submit" value="Add" class="bt"></td>
        </tr>
    </form>
        </tbody>
    </table>
    </div>
    <c:if test="${!empty message}">
        <div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none'">
            &times;</span><p>${message}</p></div>
    </c:if>

    <a href="index.jsp" class="aaa"><img src="assets/images/ar.png" class="pp"></a>
</main>
</body>
</html>
