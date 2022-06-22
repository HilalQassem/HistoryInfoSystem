<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="assets/css/about1..css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/all.min.css"/>"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

</head>
<body>
<header class="header">
    <a href="#" class="logo"> <i class="fas fa-heartbeat"></i>WeCare</a>
    <nav class="navbar">
        <a href="index.jsp">home</a>
        <a href="mailto:sidramohamad77@gmail.com">contact</a>
        <a href="about.jsp">about</a>
    </nav>
</header>

<section class="home" id="home">
    <div class="image">
        <img src="assets/images/hos.png" alt="">
    </div>
    <div class="content">
        <h3>WeCare Hospital</h3>
        <p>Hello, welcome to our hospital
        we are WeCare Hospital, we can help you in every medical thing, we hope that we can treat you,
            call us if you have any comments.</p>
            <a href="mailto:sidramohamad77@gmail.com" class="btn"> contact us <span class="fas fa-chevron-right"></span></a>
    </div>
    <div class="image">
        <img src="assets/images/doc.png" alt="">
    </div>
        <div class="content">
            <h3>WeCare Doctors</h3>
            <p>Hello, welcome to our hospital
                we are WeCare Hospital,thanks for coming, our doctors are all
            professionals, we have a variety in all sections, and if you want to more about
            our doctors you can visit us.</p>
        </div>
    <div class="image">
        <img src="assets/images/pa.png" alt="">
    </div>
        <div class="content">
            <h3>WeCare Treatment</h3>
            <p>Hello, welcome to our hospital
                we are WeCare Hospital,thanks for coming, we have all types of treatment, we have a crew specialize with
            all kinds of patients, for more information you can visit our hospital.</p>
        </div>
    <div class="image">
        <img src="assets/images/pp.png" alt="">
    </div>
    <div class="content">
        <h3>WeCare Searches</h3>
    <p>Hello, welcome to our hospital
        we are WeCare Hospital,thanks for coming, we have a specializes doctors for searches in our
    hospital, our doctors keep up with developments, so that we hope we can find a solution
    in every sector, for mor information you can visit us.</p>
    </div>
</section>
</body>
</html>
