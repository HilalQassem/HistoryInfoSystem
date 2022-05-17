<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    ${message}
    <form action="admin-zone" method="post">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <br/>
        <br/>
        <input type="submit" value="Login"/>
    </form>
</body>
</html>
