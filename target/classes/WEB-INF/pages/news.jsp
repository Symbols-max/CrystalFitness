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
    <style>
        .zatemnenie {
            background: rgba(102, 102, 102, 0.5);
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            display: none;
        }
        .okno {
            word-break: break-all;
            width: 50%;
            height: 80%;
            padding: 15px;
            border: 3px solid #8FBB4B;
            border-radius: 10px;
            color: #8FBB4B;
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin: auto;
            background: #FFFFFF;
        }
        .zatemnenie:target {display: block;}
    </style>
</head>
<body>

<div class="container">
    <p class="teamWord">
        Новости
    </p>
<c:forEach var="news" items="${newss}">
    <div class="form" style="margin-top: 3%;
    background-color: #8FBB4B;
    border: 0;
    border-radius: 150px;
    width: 80%;
    margin-left: 10%;
    height: 10%;
    filter: drop-shadow(0px 4px 100px rgba(0, 0, 0, 0.25));
    margin-bottom: 5%;">
        <br>
        <p class="text" style="margin-left:10%;margin-right:10%;word-break:
        break-all;text-align: center;font-size: xx-large">
           ${news.title}
        </p>
        <br>
            <p class="text" style="margin-left:3%;margin-right:3%;word-break:
        break-all;font-size:large">
                    ${news.shortDescription}
            </p>
        <br>
            <p class="text" style="margin-left:6%;margin-right:5%;font-size: medium">
                    ${news.date}
                <a href="#${news.id}" style="margin-left: 62%;text-decoration: none;font-size: large;
                color: #FFFFFF">
                    Узнать больше...
                </a>
            </p>
        <br>
    </div>
    </c:forEach>
    <br><br><br><br><br><br><br><br>
<c:forEach var="news" items="${newss}">
    <a href="#" class="zatemnenie" id="${news.id}">
        <div class="okno">
            ${news.text}
        </div>
    </a>
</c:forEach>
</div>
</body>
</html>

