<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.health.HistoryInfoSystem.DeptAdmin" %>
<%@ page import="com.health.HistoryInfoSystem.Department" %>
<%@ page import="com.health.HistoryInfoSystem.Admin" %>
<%@ page import="com.health.HistoryInfoSystem.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  DeptAdmin deptAdmin =(DeptAdmin) session.getAttribute("deptAdmin");
  Doctor[] doctors =(Doctor[]) request.getAttribute("doctors");
%>

<html>
<head>
  <title>${deptAdmin.getName()}</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/zone.css"/>" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200&family=Indie+Flower&family=Rubik+Moonrocks&family=Skranji&display=swap" rel="stylesheet">
</head>
<body>
<main>
    <div class="page">
        <h1>Department Doctors</h1>
        <table class="layout display responsive-table">
            <thead>
        <tr>
          <th>Doctor ID</th>
          <th>Doctor Name</th>
          <th>Specialty</th>
          <th>Doctors' Username</th>
          <th>Doctors' Password</th>
          <th>isBlocked</th>
          <th></th>
        </tr>
            </thead>
            <tbody>
        <c:forEach items="${doctors}" var="doctor">
          <form action="delete-doctor" method="post">
            <tr>
              <td><input type="number" value="${doctor.getDoctorId()}" name="doctorId" readonly></td>
              <td><input type="text" value="${doctor.getName()}" name="name" readonly></td>
              <td><input type="text" value="${doctor.getSpecialty()}" name="specialty" readonly></td>
              <td><input type="text" value="${doctor.getUsername()}" name="username" readonly></td>
              <td><input type="text" value="${doctor.getPassword()}" name="password" readonly></td>
              <td><input type="checkbox"  name="isBlocked" onclick="submit()" form="block" ${doctor.isBlocked()?"checked":""}></td>
              <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
              <td><input type="submit" value="Delete" class="bt"></td>
            </tr>
          </form>
        <form action="block-doctor" method="post" id="block">
            <input type="hidden" value="${doctor.getDoctorId()}" name="doctorId">
            <input type="hidden" value="off" name="isBlocked">
        </form>
        </c:forEach>
        <form action="add-doctor" method="post">
          <tr>
            <td><input type="hidden" name="doctorId" readonly></td>
            <td><input type="text" name="name"></td>
            <td><input type="text" name="specialty"></td>
            <td><input type="text" name="username"></td>
            <td><input type="text" name="password" ></td>
            <td></td>
            <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
            <td><input type="submit" value="Add" class="bt" ></td>
          </tr>
        </form>
            </tbody>
      </table>
        <span class="ss">${message}</span>
    </div>
    </br> </br>








<!..responsive..>


   <div class="page2">
       <h1>Department Doctors</h1>
       <table class="layout display responsive-table">
           <c:forEach items="${doctors}" var="doctor">
           <form action="delete-doctor" method="post">
               </c:forEach>
               <form action="add-doctor" method="post">
           <tr>
               <th>Doctor ID</th>
               <td><input type="number" value="${doctor.getDoctorId()}" name="doctorId" readonly></td>
               <td><input type="hidden" name="doctorId" readonly></td>

           </tr>
           <tr>
               <th>Doctor Name</th>
              <td><input type="text" value="${doctor.getName()}" name="name" readonly></td>
              <td><input type="text" name="name"></td>


           </tr>
           <tr>
               <th>Specialty</th>
               <td><input type="text" value="${doctor.getSpecialty()}" name="specialty" readonly></td>
               <td><input type="text" name="specialty"></td>

           </tr>
           <tr>
                <th>Doctors' Username</th>
               <td><input type="text" value="${doctor.getUsername()}" name="username" readonly></td>
               <td><input type="text" name="username"></td>

           </tr>
           <tr>
               <th>Doctors' Password</th>
               <td><input type="text" value="${doctor.getPassword()}" name="password" readonly></td>
               <td><input type="text" name="password" ></td>

           </tr>

           <tr>
               <th>isBlocked</th>
               <td><input type="checkbox"  name="isBlocked" onclick="submit()" form="block" ${doctor.isBlocked()?"checked":""}></td>

           </tr>
               <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
                   <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
               <tr>
                   <th></th>
                  <td><input type="submit" value="Delete" class="bt"></td>
                   <td><input type="submit" value="Add" class="bt" ></td>

               </tr></form></form>

       </table>

   </div>
    <a href="index.jsp" class="aa"><img src="assets/images/ar.png" class="pp"></a>
</main>
</body>
</html>
