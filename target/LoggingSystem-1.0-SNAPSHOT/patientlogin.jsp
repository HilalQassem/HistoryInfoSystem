<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
        ${message}
        <form action="patient-zone" method="post">
            <input type="text" name="name" placeholder="Name">
            <input type="number" name="ssn" placeholder="SSN">
            <br/>
            <br/>
            <input type="submit" value="Login"/>
        </form>
</body>
</html>
