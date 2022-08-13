<%@ page import="com.health.HistoryInfoSystem.Patient" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Patient[] patients=(Patient[]) request.getAttribute("patients");%>
<html>
<head>
    <title>My Patients</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/zone.css"/>" />
</head>
<body>
<main>
    <div class="page">
        <h1>My Patients</h1>
        <table class="layout display responsive-table">
            <thead>
      <tr>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Patient DOB</th>
        <th>Patient Number</th>
        <th>Patient Join Date</th>
        <th>Patient SSN</th>
        <th></th>
      </tr>
      <c:forEach items="${patients}" var="patient">
        <form action="get-patient-log" method="post">
        <tr>
            <td>${patient.getPatientId()}</td>
            <td>${patient.getName()}</td>
            <td>${patient.getDateOfBirth()}</td>
            <td>${patient.getNumber()}</td>
            <td>${patient.getJoinDate()}</td>
            <td>${patient.getSsn()}</td>
            <input type="hidden" value="${patient.getName()}" name="name">
            <td><input type="submit" value="Get Patient Log" class="bt"/></td>
        </tr>
        </form>
      </c:forEach>
        <form action="add-patient" method="post">
        <tr>
            <td></td>
            <td><input type="text" name="name"  required></td>
            <td><input type="text" name="dateOfBirth" onfocus="this.type='date'" required></td>
            <td><input type="tel" name="number" required></td>
            <td></td>
            <td><input type="tel" name="ssn" required></td>
            <td><button class="bt">Add Patient</button></td>
        </tr>
        </form>
    </table>
    </div>
    <a href="doctorzone.jsp" class="aa"><img src="assets/images/ar.png" class="pp"></a>
</main>
</body>
</html>
