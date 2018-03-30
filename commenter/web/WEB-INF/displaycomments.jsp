<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comments Page</title>
    </head>
    <body>
        <h1>Display Comments here!</h1>

        <c:forEach var="comment" items="${commentList}">

            <div>
                <p><c:out value="${comment.name}"/></p>
                <p>${comment.timeStamp}</p>
                <p>${comment.comment}</p>
                <hr>
            </div>

        </c:forEach>

        <a href="${pageContext.request.contextPath}/AddComment">Add New Comment</a> 

    </body>
</html>
