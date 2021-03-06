<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>


    <title>Панель управления пользователями</title>
</head>
<body>
<div class="container">

            <h1 class="page-header" align="center">Панель управления пользователями.</h1>


    <div class="col-lg-11">
        <div class="panel panel-primary">
            <div class="panel-body">
                <c:if test="${requestScope.exception == true}">
                    <div class="alert alert-danger">
                        <c:forEach var="exceptionMessage" items="${requestScope.exceptionMessages}">
                            <p><strong>Warning! </strong>${exceptionMessage}</p>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${requestScope.info == true}">
                    <div class="alert alert-success">
                        <c:forEach var="infoMessage" items="${requestScope.infoMessages}">
                            <p><strong>Success! </strong>${infoMessage}</p>
                        </c:forEach>
                    </div>
                </c:if>
                <form style="display: inline" class="form-select-button" method="POST" action="/addUser">
                    <button type="submit" class="btn btn-default">Добавить</button>
                </form>
                <form style="display: inline" method="GET" action="/users">
                    <button type="submit" class="btn btn-info">Список пользователей</button>
                </form>

            </div>
        </div>
    </div>


    <div class="col-lg-11">
        <div class="panel panel-default">
            <div class="panel-heading">
                Список пользователей
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Имя</th>
                            <th>Фамилия</th>
                            <th>Возраст</th>
                            <th>Email</th>
                            <th>Роль</th>
                            <th>Действие</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td><c:out value="${user.id}"></c:out></td>
                                <td><c:out value="${user.firstName}"></c:out></td>
                                <td><c:out value="${user.lastName}"></c:out></td>
                                <td><c:out value="${user.age}"></c:out></td>
                                <td><c:out value="${user.email}"></c:out></td>
                                <td><c:out value="${user.role}"></c:out></td>
                                <td>
                                    <a href="/edit/<c:out value="${user.id}"></c:out>" class="btn btn-primary">Изменить</a>
                                    <a href="/delete/<c:out value="${user.id}"></c:out>"
                                       class="btn btn-danger">Удалить</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.table-responsive -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</div>
</div>
<script type="text/javascript">
    $.ajax({
        url: '/getJson',         	// указываем URL и
        dataType: "json",                 	// тип загружаемых данных
        success: function (data) { 		// вешаем свой обработчик на функцию success
            $.each(data, function (i, val) {	// обрабатываем полученные данные
                console.log(val.lastName);
            });
        }

    });


</script>
<form action="/search" method="get">
    <input type="search" name="q">
    <button type="submit">Search</button>
</form>

<div class="entry">
    <h1>My New Post</h1>
    <div class="body">
        This is my first post!
    </div>
</div>
</body>
</html>