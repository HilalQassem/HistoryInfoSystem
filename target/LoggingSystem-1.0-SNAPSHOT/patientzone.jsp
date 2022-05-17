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
</head>
<body>
        <table>
            <caption>Profile</caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Number</th>
                <th>Join Date</th>
                <th>SSN</th>
            </tr>
            <tr>
                <td>${patient.getPatientId()}</td>
                <td>${patient.getName()}</td>
                <td>${patient.getDateOfBirth()}</td>
                <td>${patient.getNumber()}</td>
                <td>${patient.getJoinDate()}</td>
                <td>${patient.getSsn()}</td>
            </tr>
        </table>
        <br/>
        <br/>
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
                <td><a href="download?filename=${visit.getPrescription()}">Download</a></td>
                <td><a href="download?filename=${visit.getTest()}">Download</a></td>
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
