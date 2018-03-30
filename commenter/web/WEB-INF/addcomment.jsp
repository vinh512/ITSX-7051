<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Comment</title>
    </head>
    <body>
        <h1>Add Comment!</h1>
        <form action="${pageContext.request.contextPath}/AddComment" method="POST">
            Name: <input type="text" name="author">
            <br><br>
            <textarea rows="4" cols="50" name="comment" placeholder="Enter Comment..."></textarea>
            <br>
            <input type="submit">
        </form> 
    </body>
</html>
