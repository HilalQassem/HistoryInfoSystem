<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Doctor doctor=(Doctor) session.getAttribute("doctor");%>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/doctorzz.css"/>"/>
    <title>${doctor.getName()}</title>
</head>
<body>
<header class="hd">
    <a>Doctor Zone</a>
</header>
<section class="hh">
        ${message}
        <form  action="get-patients" method="post" class="gg">
            <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId" class="in">
            <button>Get Patients List</button>
        </form>
        <br/>
        <br/>
        <form action="get-patient-log" method="post" class="ll">
            <input type="text"  name="name" placeholder="name" class="info">
            <button>Get Patient Log</button>
        </form>
        <br/>
        <br/>
        <form action="add-patient" method="post">
            <input type="text" name="name" placeholder="Name">
            <input type="date" placeholder="dateOfBirth" name="dateOfBirth">
            <input type="tel" placeholder="number" name="number">
            <input type="tel" placeholder="SSN" name="ssn">
            <button>Add Patient</button>
        </form>
        <br/>
        <br/>
        <form action="add-visit" method="post" enctype = "multipart/form-data">
            <input type="text" name="patientName" placeholder="Patient Name">
            <input type="date" placeholder="date" name="date">
            <input type="text" placeholder="Reason" name="reason">
            <input type="file" placeholder="Prescription" name="prescription" size="50">
            <input type="file" placeholder="Test" name="test" size="50">
            <input type="text" placeholder="Notes" name="notes">
            <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId">
            <button>Add Visit</button>
        </form>
</section>
</body>
</html>
