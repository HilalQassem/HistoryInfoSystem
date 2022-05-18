<%@ page import="com.health.HistoryInfoSystem.Patient" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Patient[] patients=(Patient[]) request.getAttribute("patients");%>
<html>
<head>
    <title>My Patients</title>
</head>
<body>
    <table>
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
            <td><input type="submit" value="Get Patient Log"/></td>
        </tr>
        </form>
      </c:forEach>
    </table>
    <style>
        table,th,td {
            border: 1px solid black;
        }
    </style>

</body>
</html>
