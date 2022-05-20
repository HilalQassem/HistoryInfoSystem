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
</head>
<body>
${message}
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
          <th></th>
        </tr>
            </thead>
            <tbody>
        <c:forEach items="${doctors}" var="doctor">
          <form action="delete-doctor" method="post">
            <tr>
              <td><input type="number" value="${doctor.getDoctorId()}" name="doctorId" readonly></td>
              <td><input type="text" value="${doctor.getName()}" name="name" readonly ></td>
              <td><input type="text" value="${doctor.getSpecialty()}" name="specialty" readonly ></td>
              <td><input type="text" value="${doctor.getUsername()}" name="username" readonly ></td>
              <td><input type="text" value="${doctor.getPassword()}" name="password" readonly ></td>
              <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
              <td><input type="submit" value="Delete" class="bt"></td>
            </tr>
          </form>
        </c:forEach>
        <form action="add-doctor" method="post">
          <tr>
            <td><input type="hidden" name="doctorId" readonly></td>
            <td><input type="text" name="name"></td>
            <td><input type="text" name="specialty"></td>
            <td><input type="text" name="username"></td>
            <td><input type="text" name="password" ></td>
            <input type="hidden" value="${deptAdmin.getDepartmentId()}" name="departmentId">
            <td><input type="submit" value="Add" class="bt"></td>
          </tr>
        </form>
            </tbody>
      </table>
    </div>
</main>
</body>
</html>
