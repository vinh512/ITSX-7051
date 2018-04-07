<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Blog Page</title>
    </head>
    <body>
        <h1>Create Blog</h1>
        
        <form action="${pageContext.request.contextPath}/CreateBlogServlet" method="POST">
            <input type="hidden" name="name" value="${sessionScope.user.name}">
            Title: <input type="text" name="title">
            <br><br>
            <textarea rows="4" cols="50" name="blog" placeholder="Enter Blog..."></textarea>
            <br>
            <input type="submit">
        </form>
    </body>
</html>
