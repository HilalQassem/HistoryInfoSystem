<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value="/assets/css/styles.css"/>" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200&family=Indie+Flower&family=Rubik+Moonrocks&family=Skranji&display=swap" rel="stylesheet">
</head>
<body>
<header><h1>LOGIN</h1></header>
<main>

    <form action="doctor-zone" method="post" class="form_class">
        <input type="text" name="username" placeholder="Username" class="in" required>
        <input type="password" name="password" placeholder="Password" class="in" required>
        <br/>
        <br/>
        <input type="submit" value="Login" class="su"/>
    </form>
</main>
<footer>
    <c:if test="${!empty message}">
        <div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none'">
            &times;</span><p>${message}</p></div>
    </c:if>
</footer>
</body>
</html>
