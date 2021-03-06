<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CrystalFitness</title>
    <link rel="stylesheet" type="text/css" href="css/adminka.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="cc" >
    <a class="link"  href="/adminka_trainers">Тренера</a>
    <br><br>
    <a class="link" href="/adminka_news">Новости</a>
    <br><br>
    <a class="link" href="/adminka_gallery">Галерея</a>
    <br><br>
    <a class="link" href="/adminka_clubs">Клубы</a>
    <c:url value="/logout" var="logoutUrl" />
    <br><br>
    <c:url value="/logout" var="logoutUrl" />
    <p style="margin-bottom: 2%; font-size: x-large"><a class="logout" href="${logoutUrl}">Выйти</a></p>
</div>
</body>
</html>
