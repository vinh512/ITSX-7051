<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Students</title>
    </head>
    <body>
        <h1>Hawking Academy - Students</h1>
        <hr>
        <c:forEach var="student" items="${studentList}">
            ${student} <br>
        </c:forEach>
    </body>
</html>
