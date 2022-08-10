<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.DeptAdmin" %>
<%@ page import="com.health.HistoryInfoSystem.Department" %>
<%@ page import="com.health.HistoryInfoSystem.Admin" %>
<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DeptAdmin deptAdmin =(DeptAdmin) session.getAttribute("deptAdmin");
    Doctor[] doctors =(Doctor[]) request.getAttribute("doctors");
    Integer update =(Integer) request.getAttribute("update");
%>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/normalize.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/departmenthome.css"/>" />
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
            <div class="logo_name">DeptAdmin Home</div>
        </div>
        <!-- <i class="fas fa-bars" id="bt"></i>-->
    </div>
    <ul class="nav_list">
        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!-- <span class="links_name">Departement Admin login</span>-->
                <button class="dep" onclick="manageDoctors()">Manage Doctors</button>
            </a>

            <!--<span class="tooltip">Depatement Admin</span>-->
        </li>

    </ul>
</div>

<!--home-->
<section class="home" id="home" style="display: ${update==1?"none":""}">
    <div class="image">
        <img src="assets/images/dept.png" alt="">
    </div>
    <div class="content">
        <h3>Hello, DeptAdmin!</h3>
        <p>welcome to our hospital, you can get information here </p>
        <a href="#" class="btn"> contact us <span class="fas fa-chevron-right"></span></a>
    </div>
</section>
<section style="display: ${update==1?"":"none"}" id="doctorManagementPanel">
    <div class="page">
        <h1>Department Doctors</h1>
        <table class="layout display responsive-table">
            <thead>
            <tr>
                <th>Doctor ID</th>
                <th>Doctor Name</th>
                <th>Specialty</th>
                <th>Doctors' Username</th>
                <th>Doctors' Password</th>
                <th>isBlocked</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${doctors}" var="doctor">
                <form action="delete-doctor" method="post">
                    <tr>
                        <td><input type="number" value="${doctor.getDoctorId()}" name="doctorId" readonly></td>
                        <td><input type="text" value="${doctor.getName()}" name="name" readonly></td>
                        <td><input type="text" value="${doctor.getSpecialty()}" name="specialty" readonly></td>
                        <td><input type="text" value="${doctor.getUsername()}" name="username" readonly></td>
                        <td><input type="text" value="${doctor.getPassword()}" name="password" readonly></td>
                        <td><input type="checkbox"  name="isBlocked" onclick="submit()" form="block" ${doctor.isBlocked()?"checked":""}></td>
                        <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
                        <td><input type="submit" value="Delete" class="bt"></td>
                    </tr>
                </form>
                <form action="block-doctor" method="post" id="block">
                    <input type="hidden" value="${doctor.getDoctorId()}" name="doctorId">
                    <input type="hidden" value="off" name="isBlocked">
                </form>
            </c:forEach>
            <form action="add-doctor" method="post">
                <tr>
                    <td><input type="hidden" name="doctorId" readonly></td>
                    <td><input type="text" name="name" required></td>
                    <td><input type="text" name="specialty" required></td>
                    <td><input type="text" name="username" required></td>
                    <td><input type="text" name="password" required></td>
                    <td></td>
                    <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
                    <td><input type="submit" value="Add" class="bt" ></td>
                </tr>
            </form>
            </tbody>
        </table>
        <span class="ss">${message}</span>
    </div>
</section>
<script>
    function manageDoctors() {
        var x = document.getElementById("doctorManagementPanel");
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