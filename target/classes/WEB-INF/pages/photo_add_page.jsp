<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Photo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" action="/photo/add" method="post">
        <div class="form-group"><h3>New photo</h3></div>
        <div class="form-group"><input type="text" class="form-control" name="photo" placeholder="Ссылка на фото"></div>
        <div class="form-group"><input type="submit" class="btn btn-primary" value="Добавить"></div>
    </form>
</div>
</body>
</html>

