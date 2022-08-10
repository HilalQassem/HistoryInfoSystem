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
    <link rel="stylesheet" href="<c:url value="assets/css/normalize.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/adminhome.css"/>" />
    <link rel="stylesheet" href="<c:url value="assets/css/all.min.css"/>"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="<c:url value="/assets/css/zone.css"/>" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200&family=Indie+Flower&family=Rubik+Moonrocks&family=Skranji&display=swap" rel="stylesheet">
    </head>
<body>

<!--header-->
<header class="header">
    <a href="#" class="logo"> <i class="fas fa-heartbeat"></i>WeCare</a>
    <nav class="navbar">
        <a href="#home">home</a>
        <a href="mailto:sidramohamad77@gmail.com">contact</a>
        <a href="about.jsp">about</a>
    </nav>
    <button id="menu-btn" class="fas fa-bars"></button>
</header>
<!--sidebar section-->
<div class="sidebar">
    <div class="logo-content">
        <div class="lo">
            <i class="fa fa-sign-in"></i>
            <div class="logo_name">Admin Home</div>
        </div>
        <!-- <i class="fas fa-bars" id="bt"></i>-->
    </div>
    <ul class="nav_list">
        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Patient login</span>-->
                    <button onclick="showPanel('departmentManagementPanel')">Manage Departments</button>
            </a>
            <!-- <span class="tooltip">Patient</span>-->
        </li>

        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!-- <span class="links_name">Departement Admin login</span>-->
                    <button class="dep" onclick="showPanel('deptAdminsManagementPanel')">Manage Department Admins</button>
            </a>
            <!--<span class="tooltip">Department Admin</span>-->
        </li>
    </ul>
</div>

<!--home-->
<section class="home" id="home" style="display: ${updateA==1||updateD==1?"none":""}">
    <div class="image">
        <img src="assets/images/admin.png" alt="">
    </div>
    <div class="content">
        <h3>Hello, Admin!</h3>
        <p>welcome to our hospital, you can get information here </p>
        <a href="#" class="btn"> contact us <span class="fas fa-chevron-right"></span></a>
    </div>
</section>
<section id="departmentManagementPanel" style="display: ${updateD==1?"":"none"}">
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
</section>
<section id="deptAdminsManagementPanel" style="display: ${updateA==1?"":"none"}">
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
</section>
<script>
    function showPanel(id) {
        var x = document.getElementById(id);
        var y = document.getElementById("home");
        if (x.style.display === "none") {
            y.style.display = "none"
            x.style.display = "";
        } else {
            x.style.display = "none";
            y.style.display = "";
        }
    }
</script>
</body>


</html>