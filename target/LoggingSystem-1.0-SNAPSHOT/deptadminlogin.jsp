<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/styles.css"/>" />
</head>
<body>
<header><h1>LOGIN</h1></header>
<main>
${message}
<form action="deptAdmin-zone" method="post" class="form_class">
    <input type="text" name="username" placeholder="Username" class="in">
    <input type="password" name="password" placeholder="Password" class="in">
    <br/>
    <br/>
    <input type="submit" value="Login" class="su"/>
</form>
</main>
</body>
</html>
