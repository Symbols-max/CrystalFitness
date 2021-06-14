<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Trainers</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" action="/trainers/add" method="post">
        <div class="form-group"><h3>New trainer</h3></div>
        <select class="selectpicker form-control form-group" name="gym">
            <option value="-1"></option>
            <c:forEach items="${gyms}" var="gym">
                <option value="${gym.id}">${gym.adress}</option>
            </c:forEach>
        </select>
        <div class="form-group"><input type="text" class="form-control" name="name" placeholder="Имя"></div>
        <div class="form-group"><input type="number" class="form-control" name="age" placeholder="Возраст"></div>
        <div class="form-group"><textarea name="description" cols="150" rows="5" placeholder="Описание"></textarea></div>
        <div class="form-group"><textarea name="achivment" cols="150" rows="5" placeholder="Достижения"></textarea></div>
        <div class="form-group"><input type="text" class="form-control" name="photo" placeholder="Ссылка на фотографию"></div>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Добавить"></div>
    </form>
</div>
</body>
</html>