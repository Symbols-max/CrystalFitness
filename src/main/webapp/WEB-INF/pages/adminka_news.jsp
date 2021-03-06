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
                    <li><button type="button" id="add_news" class="btn btn-default navbar-btn">Добавить новость</button></li>
                    <li style="margin-right: 5%"><button type="button" id="delete_news" class="btn btn-default navbar-btn">Удалить новость</button></li>
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
            <td><b>Название</b></td>
            <td><b>Короткое описание</b></td>
            <td><b>Полное описание</b></td>
            <td><b>Дата</b></td>
        </tr>
        </thead>
        <c:forEach items="${newss}" var="news">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${news.id}" id="checkbox_${news.id}"/></td>
                <td>${news.title}</td>
                <td>${news.shortDescription}</td>
                <td><a href="/full_news/${news.id}">Узнать больше</a></td>
                <td>${news.date}</td>
            </tr>
        </c:forEach>
    </table>

    <%--    <nav aria-label="Page navigation">--%>
    <%--        <ul class="pagination">--%>
    <%--            <c:if test="${allPages ne null}">--%>
    <%--                <c:forEach var="i" begin="1" end="${allPages}">--%>
    <%--                    <li><a href="/?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>--%>
    <%--                </c:forEach>--%>
    <%--            </c:if>--%>
    <%--            <c:if test="${byGroupPages ne null}">--%>
    <%--                <c:forEach var="i" begin="1" end="${byGroupPages}">--%>
    <%--                    <li><a href="/group/${groupId}?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>--%>
    <%--                </c:forEach>--%>
    <%--            </c:if>--%>
    <%--        </ul>--%>
    <%--    </nav>--%>
    <div>
        <p><a href="/adminka">Назад</a></p>
        <c:url value="/logout" var="logoutUrl" />
        <p><a href="${logoutUrl}">Выйти</a></p>
    </div>
</div>

<script>

    $('#add_news').click(function(){
        window.location.href='/news_add_page';
    });


    $('#delete_news').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/news/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>
