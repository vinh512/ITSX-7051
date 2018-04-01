<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,500" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Add New Comment</title>
    </head>
    <body>
        <h1>Add Comment</h1>

        <div class='form-body'>
            <form action="${pageContext.request.contextPath}/AddComment" method="POST">
                <span class='name-font'>Name: </span><input class='input-name' type="text" name="author">
                <br><br>
                <textarea class='boxsizingBorder' rows="4" cols="50" name="comment" placeholder="Enter Comment..."></textarea>
                <br>
                <input type="submit">
            </form> 
        </div>

        <!-- displays error message based on input fields -->
        <c:choose>
            <c:when test="${errorMsg}">
                <div class='errorMsg'>Error - Input fields cannot be empty</div>
            </c:when>
            <c:when test="${nameErrorMsg}">
                <div class='errorMsg'>Error - Name input field cannot be empty</div>
            </c:when>
            <c:when test="${commentErrorMsg}">
                <div class='errorMsg'>Error - Comment input field cannot be empty</div>
            </c:when>
            <c:otherwise>
                <div class='errorMsg'>&nbsp;</div>
            </c:otherwise>
        </c:choose>    
    </body>
</html>
