
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Doctor doctor=(Doctor) session.getAttribute("doctor");%>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/normalize.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/all.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/doctorhome.css"/>"/>
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
        <a href="sidramohamad77@gmail.com">contact</a>
        <a href="about.jsp">about</a>
    </nav>
    <button id="menu-btn" class="fas fa-bars"></button>
</header>
<!--sidebar section-->
<div class="sidebar">
    <div class="logo-content">
        <div class="lo">
            <i class="fa fa-sign-in"></i>
            <div class="logo_name">Doctor Home</div>
        </div>
        <!-- <i class="fas fa-bars" id="bt"></i>-->
    </div>
    <ul class="nav_list">
        <li>
            <a href="doctorzone.jsp">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Patient login</span>-->
                <form  action="get-patients" method="post" class="gg">
                    <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId" class="in">
                    <button>Get Patients List</button>
                </form>
            </a>
            <!-- <span class="tooltip">Patient</span>-->
        </li>

        <li>
            <a href="doctorzone.jsp">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Doctor login</span>-->
                <form action="add-patient" method="post" class="ll">
                    <button>Add Patient</button></form>
            </a>
            <!--<span class="tooltip">Doctor</span>-->
        </li>

        <li>
            <a href="doctorzone.jsp">
                <i class="fas fa-user-alt"></i>
                <!-- <span class="links_name">Departement Admin login</span>-->
                <form action="get-patient-log" method="post">
                    <button>Get Patient Log</button>
                </form>
            </a>
            <!--<span class="tooltip">Depatement Admin</span>-->
        </li>

        <li>
            <a href="doctorzone.jsp">
                <i class="fas fa-user-alt"></i>
                <!--<span class="links_name">Admin login</span>-->
                <form action="add-visit" method="post" enctype = "multipart/form-data">
                    <button >Add Visit</button></form>
            </a>
            <!-- <span class="tooltip">Admin</span>-->
        </li>
    </ul>
</div>

<!--home-->
<section class="home" id="home">
    <div class="image">
        <img src="assets/images/dochome.png" alt="">
    </div>
    <div class="content">
        <h3>Hello, Doctor!</h3>
        <p>welcome to our hospital, here you can set your patients visits,
        and get their information</p>
        <a href="#" class="btn"> contact us <span class="fas fa-chevron-right"></span></a>
    </div>
</section>

</body>


</html>