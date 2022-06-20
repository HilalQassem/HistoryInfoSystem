<%@ page import="com.health.HistoryInfoSystem.Patient" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.Visit" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  Patient patient=(Patient) request.getAttribute("patient");
    Visit[] visits=(Visit[]) request.getAttribute("visits");
%>
<html>
<head>
    <title>${patient.getName()}</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/zone.css"/>" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200&family=Indie+Flower&family=Rubik+Moonrocks&family=Skranji&display=swap" rel="stylesheet">
</head>
<body>
<main>
    <div class="page">
        <h1>Profile</h1>
        <table class="layout display responsive-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Join Date</th>
                <th>Number</th>
                <th>SSN</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${patient.getPatientId()}</td>
                <td>${patient.getName()}</td>
                <td>${patient.getDateOfBirth()}</td>
                <td>${patient.getNumber()}</td>
                <td>${patient.getJoinDate()}</td>
                <td>${patient.getSsn()}</td>
            </tr>
            </tbody>
        </table>
    </div>
        <br/>
        <br/>
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
            <c:forEach items="${visits}" var="visit">
                <tbody>
            <tr>
                <td>${visit.getVisitId()}</td>
                <td>${visit.getPatientName()}</td>
                <td>${visit.getDoctorName()}</td>
                <td>${visit.getDate()}</td>
                <td>${visit.getReason()}</td>
                <td><a href="download?filename=${visit.getPrescription()}">${empty visit.getPrescription()?'':'Download'}</a></td>
                <td><a href="download?filename=${visit.getTest()}">${empty visit.getTest().equals('')?'':'Download'}</a></td>
                <td>${visit.getNotes()}</td>
            </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>
</main>
</body>
</html>
