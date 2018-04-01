<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,500" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Twiddler</title>
    </head>
    <body>
        <h1>Twiddler</h1>

        <c:forEach var="comment" items="${commentList}">
            <div class='comment-block'>
                <p class='name'><c:out value="${comment.name}"/></p>
                <p class='timestamp'>${comment.timeStamp}</p>
                <p class='comment'><c:out value="${comment.comment}"/></p>
            </div>
        </c:forEach>

        <a href="${pageContext.request.contextPath}/AddComment" class='button'>Add New Comment</a> 

        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var originalColor;
                var commentNodeList = document.getElementsByClassName('comment-block');

                for (var i = 0; i < commentNodeList.length; i++) {
                    commentNodeList[i].addEventListener('mouseover', mouseOver, false);
                    commentNodeList[i].addEventListener('mouseout', mouseOut, false);
                }

                function mouseOver() {
                    originalColor = this.style.backgroundColor;
                    this.style.backgroundColor = "#e0faee";
                }

                function mouseOut() {
                    this.style.backgroundColor = originalColor;
                }
            });
        </script>
    </body>
</html>
