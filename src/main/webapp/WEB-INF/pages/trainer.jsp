<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Crystal Fitness</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body{
            padding: 0;
            margin: 0;
            color: #FFFFFF;
            font-family:'Montserrat', sans-serif;
            font-style: normal;
            font-size: x-large;
        }

        * {
            box-sizing: border-box;
        }

        p{
            margin: 0;
            padding: 0;
        }

        .container{
            overflow: hidden;
            margin: 0 auto;
            background:
                    url('../img/theme3.svg') no-repeat left center / cover;
        }

        .name_age{
            margin: 0;
            padding-top: 2%;
            font-size: 36px;
            color: #FFFFFF;
            text-align: center;
        }

        .adress{
            margin: 0;
            padding-top: 1%;
            padding-bottom: 2%;
            font-size: 24px;
            color: #FFFFFF;
            text-align: center;
        }

        table{
            width: 80%;
            margin-left: 5%;
            margin-right: 15%;
        }

        .tableText{
            word-break: break-all;
            width: 80%;
            vertical-align: top;
            margin-left: 5%;
            font-size: 24px;
            color: #FFFFFF;
        }
    </style>
</head>
<body>
<div class="container">
    <p class="name_age">
        ${trainer.name}, ${trainer.age}
    </p>
    <p class="adress">
        ${trainer.gym.adress}
    </p>
    <table>
        <tr><td style="width: 20%">
            <img class="photo" src="../img/${trainer.photo}" alt="trainer_photo">
        </td>
        <td class="tableText">
            <p  style="margin-left: 5%">О тренере:<br>${trainer.description}</p>
            <br>
            <p  style="margin-left: 5%">Спортивные достижения:<br>${trainer.achivment}</p>
        </td></tr>
    </table>
    <br><br>
</div>
</body>
</html>

