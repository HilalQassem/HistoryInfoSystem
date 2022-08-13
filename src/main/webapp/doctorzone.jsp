<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Doctor doctor=(Doctor) session.getAttribute("doctor");%>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/zonnn.css"/>"/>
    <title>${doctor.getName()}</title>
</head>
<body>
<header class="hd">
    <a>Doctor Zone</a>
</header>
<section class="hh">

        <form  action="get-patients" method="post" class="gg">
            <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId" class="in" class="box">
            <button class="btn">Get Patients List</button>
        </form>
        <br/>
        <br/>
        <form action="get-patient-log" method="post" class="ll">
            <input type="text"  name="name" placeholder="name"  required class="box">
            <button class="btn">Get Patient Log</button>
            <c:if test="${!empty message}">
            <div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none'">
            &times;</span><p>${message}</p></div>
        </c:if>
        </form>
        <br/>
        <br/>
        <form action="add-patient" method="post">
            <input type="text" name="name" placeholder="Name" required class="box">
            <input type="text" placeholder="Date of Birth" name="dateOfBirth" onfocus="this.type='date'" required class="box">
            <input type="tel" placeholder="number" name="number" required class="box">
            <input type="tel" placeholder="SSN" name="ssn" required class="box">
            <button class="btn">Add Patient</button>
        </form>
        <br/>
        <br/>
        <form action="add-visit" method="post" enctype = "multipart/form-data">
            <input type="text" name="patientName" placeholder="Patient Name" required class="box">
            <input type="text" placeholder="Visit Date" name="date" onfocus="this.type='date'" required class="box">
            <input type="text" placeholder="Reason" name="reason" required class="box">
            <button  class="btn"  type="button"  onclick="document.getElementById('prescription').click(); this.style='display:none';
            prescription.style='';">Upload Prescription</button>
            <input type='file' name="prescription" id="prescription" style="display:none" class="box">
            <button class="btn" type="button" onclick="document.getElementById('test').click(); this.style='display:none';
            test.style='';">Upload Test</button>
            <input type='file' name="test" id="test" style="display:none" class="box">
            <input type="text" placeholder="Notes" name="notes" class="box">
            <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId" class="box">
            <button class="btn" >Add Visit</button>
        </form>
    <c:if test="${!empty message}">
        <div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none'">
            &times;</span><p>${message}</p></div>
    </c:if>
            <a href="index.jsp" class="aa"><img src="assets/images/ar.png" class="pp"></a>
</section>
</body>
</html>
