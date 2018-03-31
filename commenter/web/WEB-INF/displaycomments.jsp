<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,500" rel="stylesheet">
        <title>Twiddler</title>
        <style>
            body {
                margin: 0;
                background-color: #e6ecf1;
            }
            
            h1 {
                border-radius: 10px 10px 0 0;
                margin: 0 auto;
                width: 50%;
                padding: 15px 25px;
                background-color: #56bd8d;
                color: white;
                font-size: 3em;
                border-bottom: 5px solid #449772;
            }
            
            .comment-block {
                margin: 0 auto;
                width: 50%;
                padding: 15px 25px;
                background-color: white;
                border-bottom: 1px solid #eee;
                
            }
            
            .comment-block:nth-child(odd) {
                background-color: #f8f7f7;
            }
            
            .name {
                font-family: 'Roboto', sans-serif;
                color: rgb(100,100,100);
                display: inline-block;
                font-size: 1.1em;
                font-weight: 500;
                margin-bottom: 0;
                margin-top: 0;
            }
            
            .timestamp {
                font-size: 0.9em;
                border-left: 2px solid #56bd8d;
                color: rgb(150,150,150);
                display: inline-block;
                margin: 0 5px;
                padding-left: 5px;
            }
            
            .comment {
                font-family: 'Roboto', sans-serif;
                font-weight: 300;
                font-size: 1.2em;
                color: rgb(100,100,100);
                margin-bottom: 5px;
            }
        
            a.button {
                font-family: 'Roboto', sans-serif;
                margin: 0 auto;
                display: block;
                width: 50%;
                text-decoration: none;
                padding: 15px 25px;
                background-color: #56bd8d;
                border-radius: 0 0 10px 10px;
                color: white;
                font-size: 1.2em;
                text-align: center;
                border-top: 5px solid #449772;
            }
            
            a.button:hover {
                background-color: #449772;
            }
        
        </style>
    </head>
    <body>
        <h1>Twiddler</h1>

        <c:forEach var="comment" items="${commentList}">
            <div class='comment-block'>
                <p class='name'><c:out value="${comment.name}"/></p>
                <p class='timestamp'>${comment.timeStamp}</p>
                <p class='comment'>${comment.comment}</p>
            </div>
        </c:forEach>

        <a href="${pageContext.request.contextPath}/AddComment" class='button'>Add New Comment</a> 

    </body>
</html>
