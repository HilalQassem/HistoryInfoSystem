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
        <h1>Profile</h1>
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
    </table>
    </div>
</main>
</body>
</html>
