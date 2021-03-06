<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CrystalFitness</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="groupList" class="nav navbar-nav">
                    <li><button type="button" id="add_trainers" class="btn btn-default navbar-btn">Добавить тренера</button></li>
                    <li style="margin-right: 5%"><button type="button" id="delete_trainers" class="btn btn-default navbar-btn">Удалить тренера</button></li>
                    <%--                        Изменить клуб:--%>
                    <%--                    <li class="dropdown">--%>
                    <%--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Клубы <span class="caret"></span></a>--%>
                    <%--                        <ul class="dropdown-menu">--%>
                    <%--                            <c:forEach items="${gyms}" var="gym">--%>
                    <%--                                <li><a href="/gym_edit_page?${gym.id}">${gym.adress}</a></li>--%>
                    <%--                            </c:forEach>--%>
                    <%--                        </ul>--%>
                    <%--                    </li>--%>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <table class="table table-striped">
        <thead>
        <tr>
            <td></td>
            <td><b>Зал</b></td>
            <td><b>Имя</b></td>
            <td><b>Возраст</b></td>
            <td><b>Описание</b></td>
            <td><b>Достижения</b></td>
            <td><b>Фото</b></td>
        </tr>
        </thead>
        <c:forEach items="${trainers}" var="trainer">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${trainer.id}" id="checkbox_${trainer.id}"/></td>
                <c:choose>
                    <c:when test="${trainer.gym ne null}">
                        <td>${trainer.gym.adress}</td>
                    </c:when>
                </c:choose>
                <td>${trainer.name}</td>
                <td>${trainer.age}</td>
                <td><a href="/description_trainer/${trainer.id}">Узнать больше</a></td>
                <td><a href="/achivment_trainer/${trainer.id}">Узнать больше</a></td>
                <td><a href="/photo_trainer/${trainer.id}">Посмотреть</a></td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <p><a href="/adminka">Назад</a></p>
        <c:url value="/logout" var="logoutUrl" />
        <p><a href="${logoutUrl}">Выйти</a></p>
    </div>
</div>

<script>

    $('#add_trainers').click(function(){
        window.location.href='/trainers_add_page';
    });


    $('#delete_trainers').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/trainers/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>
