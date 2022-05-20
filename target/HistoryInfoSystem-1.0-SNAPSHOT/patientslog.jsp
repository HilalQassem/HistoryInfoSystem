<%@ page import="com.health.HistoryInfoSystem.Visit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  Visit[] visits=(Visit[]) request.getAttribute("visits");
    String patientName=(String) request.getAttribute("name");
%>
<html>
<head>
    <title>${patientName}</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/zone.css"/>" />
</head>
<body>
<main>

    <div class="page">
        <h1>Logs</h1>
        <table class="layout display responsive-table">
            <thead>
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
            </thead>
            <tbody>
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
            </tbody>
</table>
    </div>
</main>
</body>
</html>
