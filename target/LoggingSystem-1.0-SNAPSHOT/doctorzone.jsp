<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Doctor doctor=(Doctor) session.getAttribute("doctor");%>
<html>
<head>
    <title>${doctor.getName()}</title>
</head>
<body>
        ${message}
        <form action="get-patients" method="post">
            <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId">
            <input type="submit" value="Get Patients List"/>
        </form>
        <br/>
        <br/>
        <form action="get-patient-log" method="post">
            <input type="text" name="name" placeholder="name">
            <input type="submit" value="Get Patient Log"/>
        </form>
        <br/>
        <br/>
        <form action="add-patient" method="post">
            <input type="text" name="name" placeholder="Name">
            <input type="date" placeholder="dateOfBirth" name="dateOfBirth">
            <input type="tel" placeholder="number" name="number">
            <input type="tel" placeholder="SSN" name="ssn">
            <input type="submit" value="Add Patient"/>
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
            <input type="submit" value="Add Visit"/>
        </form>
</body>
</html>