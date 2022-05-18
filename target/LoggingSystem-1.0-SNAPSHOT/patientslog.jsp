<%@ page import="com.health.HistoryInfoSystem.Visit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  Visit[] visits=(Visit[]) request.getAttribute("visits");
    String patientName=(String) request.getAttribute("name");
%>
<html>
<head>
    <title>${patientName}</title>
</head>
<body>
<table>
    <caption>Logs</caption>
    <tr>
        <th>VisitId</th>
        <th>Patient Name</th>
        <th>Doctor Name</th>
        <th>Date</th>
        <th>Reason</th>
        <th>Prescription</th>
        <th>Test</th>
        <th>Notes</th>
    </tr>
    <c:forEach items="${visits}" var="visit">
        <tr>
            <td>${visit.getVisitId()}</td>
            <td>${visit.getPatientName()}</td>
            <td>${visit.getDoctorName()}</td>
            <td>${visit.getDate()}</td>
            <td>${visit.getReason()}</td>
            <td><a href="download?filename=${visit.getPrescription()}">${empty visit.getPrescription().equals('')?'':'Download'}</a></td>
            <td><a href="download?filename=${visit.getTest()}">${empty visit.getTest().equals('')?'':'Download'}</a></td>
            <td>${visit.getNotes()}</td>
        </tr>
    </c:forEach>
</table>
<style>
    table,th,td {
        border: 1px solid black;
    }
</style>
</body>
</html>
