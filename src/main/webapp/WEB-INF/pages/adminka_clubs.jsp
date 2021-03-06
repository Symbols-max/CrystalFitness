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
                    <li><button type="button" id="add_gym" class="btn btn-default navbar-btn">Добавить клуб</button></li>
                    <li style="margin-right: 5%"><button type="button" id="delete_gym" class="btn btn-default navbar-btn">Удалить клуб</button></li>
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
            <td><b>Adress</b></td>
            <td><b>Phone</b></td>
        </tr>
        </thead>
        <c:forEach items="${gyms}" var="gym">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${gym.id}" id="checkbox_${gym.id}"/></td>
                <td>${gym.adress}</td>
                <td>${gym.phone}</td>
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

    $('#add_gym').click(function(){
        window.location.href='/gym_add_page';
    });


    $('#delete_gym').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/gym/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>
