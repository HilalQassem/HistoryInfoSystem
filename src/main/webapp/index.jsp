<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/styles.css"/>" />
   <link rel="stylesheet" href="<c:url value="assets/css/normalize.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/home.css"/>" />
    <link rel="stylesheet" href="<c:url value="assets/css/all.min.css"/>"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

</head>
<body>
<!--header-->
<header class="header">
    <a href="#" class="logo"> <i class="fas fa-heartbeat"></i>WeCare</a>
    <nav class="navbar">
        <a href="#home">home</a>
        <a href="#contact">contact</a>
        <a href="#about">about</a>
    </nav>
    <button id="menu-btn" class="fas fa-bars"></button>
</header>
<!--sidebar section-->
<div class="sidebar">
    <div class="logo-content">
        <div class="lo">
            <i class="fa fa-sign-in"></i>
            <div class="logo_name">Login</div>
        </div>
        <!-- <i class="fas fa-bars" id="bt"></i>-->
    </div>
    <ul class="nav_list">
        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Patient login</span>-->
                <form action="patientlogin.jsp" class="">
                    <button>Patient Login</button></form>
            </a>
            <!-- <span class="tooltip">Patient</span>-->
        </li>

        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Doctor login</span>-->
                <form action="doctorlogin.jsp" class="">
                    <button>Doctor Login</button> </form>
            </a>
            <!--<span class="tooltip">Doctor</span>-->
        </li>

        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!-- <span class="links_name">Departement Admin login</span>-->
                <form action="deptadminlogin.jsp" class="">
                    <button class="dep">Departement Admin Login</button>
                </form>

            </a>
            <!--<span class="tooltip">Depatement Admin</span>-->
        </li>

        <li>
            <a href="#">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Admin login</span>-->
                <form action="adminlogin.jsp" class="">
                    <button>Admin login</button>
                </form>
            </a>
            <!-- <span class="tooltip">Admin</span>-->
        </li>
    </ul>
</div>

<!--home-->
<section class="home" id="home">
    <div class="image">
        <img src="assets/images/dd.png" alt="">
    </div>
    <div class="content">
        <h3>stay safe, stay healthy</h3>
        <p>welcome to our hospital, you can signup and see you're profile and visits</p>
        <a href="#" class="btn"> contact us <span class="fas fa-chevron-right"></span></a>
    </div>
</section>

</body>


</html>