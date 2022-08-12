<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Doctor doctor=(Doctor) session.getAttribute("doctor");%>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="assets/css/normalize.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/all.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="assets/css/doctorhome.css"/>"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
<body>
<!--header-->
<header class="header">
    <a href="#" class="logo"> <i class="fas fa-heartbeat"></i>WeCare</a>
    <nav class="navbar">
        <a href="#home">home</a>
        <a href="mailto:sidramohamad77@gmail.com">contact</a>
        <a href="about.jsp">about</a>
    </nav>
    <button id="menu-btn" class="fas fa-bars"></button>
</header>
<!--sidebar section-->
<div id="grid-container">
    <div class="sidebar" id="sidebar">
        <div class="logo-content">
            <div class="lo">
                <i class="fa fa-sign-in"></i>
                <div class="logo_name">Doctor Home</div>
            </div>
            <!-- <i class="fas fa-bars" id="bt"></i>-->
        </div>
        <ul class="nav_list">
            <li>
                <a href="#">
                    <i class="fas fa-user-alt"></i>
                    <!--<span class="links_name">Patient login</span>-->
                    <form  action="get-patients" method="post" class="gg">
                        <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId" class="in">
                        <button>Get Patients List</button>
                    </form>
                </a>
                <!-- <span class="tooltip">Patient</span>-->
            </li>

            <li>
                <a href="#">
                    <i class="fas fa-user-alt"></i>
                    <!--<span class="links_name">Doctor login</span>-->
                        <button onclick="showPanel('patientSearchInfo')">Get Patient Log</button>
                </a>
                <!--<span class="tooltip">Doctor</span>-->
            </li>

            <li>
                <a href="#">
                    <i class="fas fa-user-alt"></i>
                    <!-- <span class="links_name">Departement Admin login</span>-->
                        <button onclick="showPanel('newPatientInfo')">Add Patient</button>
                </a>
                <!--<span class="tooltip">Depatement Admin</span>-->
            </li>

            <li>
                <a href="#">
                    <i class="fas fa-user-alt"></i>
                    <!--<span class="links_name">Admin login</span>-->
                        <button onclick="showPanel('newVisitInfo')">Add Visit</button>
                </a>
                <!-- <span class="tooltip">Admin</span>-->
            </li>
        </ul>
    </div>

    <!--home-->
    <div id="operations">
        <div class="home" id="home" style="display: ${updateP==1||updateV==1?"none":""}">
            <div class="image">
                <img src="assets/images/dochome.png" alt="">
            </div>
            <div class="content">
                <h3>Hello, Doctor!</h3>
                <p>welcome to our hospital, here you can set your patients visits,
                and get their information</p>
                <a href="#" class="btn"> contact us <span class="fas fa-chevron-right"></span></a>
            </div>
        </div>
        <div id="patientSearchInfo" id="patientSearchInfo" style="display: none">
            <form action="get-patient-log" method="post" class="ll">
                <input type="text"  name="name" placeholder="name" class="info" required>
                <button>Get Patient Log</button>
                <c:if test="${!empty message}">
                    <div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none'">
                    &times;</span><p>${message}</p></div>
                </c:if>
            </form>
        </div>
        <div id="newPatientInfo" style="display: ${updateP==1?"":"none"}">
            <form action="add-patient" method="post">
                <input type="text" name="name" placeholder="Name" required>
                <input type="text" placeholder="Date of Birth" name="dateOfBirth" onfocus="this.type='date'" required>
                <input type="tel" placeholder="number" name="number" required>
                <input type="tel" placeholder="SSN" name="ssn" required>
                <button>Add Patient</button>
            </form>
        </div>
        <div id="newVisitInfo" style="display: ${updateV==1?"":"none"}">
            <form action="add-visit" method="post" enctype = "multipart/form-data">
                <input type="text" name="patientName" placeholder="Patient Name" required>
                <input type="text" placeholder="Visit Date" name="date" onfocus="this.type='date'" required>
                <input type="text" placeholder="Reason" name="reason" required>
                <button type="button" onclick="document.getElementById('prescription').click(); this.style='display:none';
                    prescription.style='';">Upload Prescription</button>
                <input type='file' name="prescription" id="prescription" style="display:none">
                <button type="button" onclick="document.getElementById('test').click(); this.style='display:none';
                    test.style='';">Upload Test</button>
                <input type='file' name="test" id="test" style="display:none">
                <input type="text" placeholder="Notes" name="notes">
                <input type="hidden" value="<%=doctor.getDoctorId()%>" name="doctorId">
                <button >Add Visit</button>
            </form>
        </div>
    </div>
</div>
<script>
    function showPanel(id) {
        var x = document.getElementById(id);
        var y = document.getElementById("home");
        if (x.style.display === "none") {
            y.style.display = "none"
            document.getElementById("newPatientInfo").style.display = "none";
            document.getElementById("patientSearchInfo").style.display = "none";
            document.getElementById("newVisitInfo").style.display = "none";
            x.style.display = "";
        } else {
            document.getElementById("newPatientInfo").style.display = "none";
            document.getElementById("patientSearchInfo").style.display = "none";
            document.getElementById("newVisitInfo").style.display = "none";
            y.style.display = "";
        }
    }
</script>
</body>


</html>