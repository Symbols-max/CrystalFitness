<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CrystalFitness</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body class="text-center">

<main class="form-signin">
    <c:url value="/j_spring_security_check" var="loginUrl" />
    <form action="${loginUrl}" method="POST">
        <h1 class="h3 mb-3 fw-normal">Подтвердите что Вы - администратор</h1>

        <div class="form-floating">
            <label class="loginText" for="floatingInput">Логин:</label>
            <input type="text" class="form-control" id="floatingInput" name="j_login" placeholder="login">
        </div>
        <div class="form-floating">
            <label for="floatingPassword">Пароль:</label>
            <input type="password" class="form-control" id="floatingPassword" name="j_password" placeholder="password">
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Отправить</button>
        <c:url value="/logout" var="logoutUrl" />
        <p style="margin-top: 5%"><a style="font-size: large" href="${logoutUrl}">Выйти</a></p>

        <c:if test="${param.error ne null}">
        <p>Введен неверный логин или пароль</p>
        </c:if>
    </form>
</main>
</body>
</html>
