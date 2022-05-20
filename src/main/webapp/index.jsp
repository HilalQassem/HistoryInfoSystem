<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/styles.css"/>" />
    <link rel="stylesheet" href="<c:url value="assets/css/normalize.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/home.css"/>" />
    <title>Welcome</title>
</head>
<body>
<div class="header">
    <div class="container">
        <img class="logo" src="assets/images/p2.jpg"/>
    </div>
</div>
<div class ="landing">
    <div class ="welcome">
        <p>WELCOME TO OUR</p>
        <p>HOSPITAL</p>
    </div>
</div>
<div class="logging">
    <div class="container">
        <form action="patientlogin.jsp" class="">
            <button>Patient Login</button>
        </form>
        <form action="doctorlogin.jsp" class="">
            <button>Doctor Login</button>
        </form>
        <form action="deptadminlogin.jsp" class="">
            <button class="dep">Departement Admin Login</button>
        </form>
        <form action="adminlogin.jsp" class="">
            <button>Admin Login</button>
        </form>
    </div>
</div>

</body>
</html>