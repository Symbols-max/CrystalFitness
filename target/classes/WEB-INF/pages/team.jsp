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
        Команда
    </p>
    <div class="tables">
        <ul>
            <li style="margin-right: 7%">
    <table style="padding-bottom: 10%">
<c:forEach items="${trainers1}" var="trainer">
            <tr>
                <td>
                <img class="photo" src="../img/${trainer.photo}" alt="trainer_photo"><br>
                    <p class="name">${trainer.name} ,
                        <c:choose>
                            <c:when test="${trainer.gym ne null}">
                                ${trainer.gym.adress}
                            </c:when>
                        </c:choose>
                    </p><br>
                    <a class="link" href="/trainer/${trainer.id}">Познакомиться</a>
                </td>
            </tr>
</c:forEach>
    </table>
            </li>
            <li style="margin-left: 7%">
    <table class="trainers" style="padding-bottom: 10%">
        <c:forEach items="${trainers2}" var="trainer">
            <tr style="margin-bottom: 5%">
                <td>
                    <img class="photo" src="../img/${trainer.photo}" alt="trainer_photo"><br>
                    <p class="name">${trainer.name} ,
                        <c:choose>
                            <c:when test="${trainer.gym ne null}">
                                ${trainer.gym.adress}
                            </c:when>
                        </c:choose>
                    </p><br>
                    <a class="link" href="/trainer/${trainer.id}">Познакомиться</a>
                </td>
            </tr>
        </c:forEach>
    </table>
            </li>
        </ul>
        <c:if test="${trainers3.size()!=0}">
            <div class="plus" style="padding-bottom: 5%">
            <c:forEach items="${trainers3}" var="trainer">
                <img class="photo" src="../img/${trainer.photo}" alt="trainer_photo"><br>
                <p class="name">${trainer.name} ,
                <c:choose>
                    <c:when test="${trainer.gym ne null}">
                        ${trainer.gym.adress}
                    </c:when>
                </c:choose>
                </p><br>
                <a class="link" href="/trainer/${trainer.id}">Познакомиться</a>
            </c:forEach>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>

