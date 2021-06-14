<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Crystal Fitness</title>
    <link rel="stylesheet" type="text/css" href="css/team.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

<div class="container">
    <p class="teamWord">
        Галлерея
    </p>
    <ul>
    <c:forEach var="photo" items="${photos}">
           <li style="display: inline">
               <img src="../img/${photo.photo}" alt="">
           </li>
    </c:forEach>
    </ul>
    <br><br><br><br><br><br><br><br>

</div>
</body>
</html>

