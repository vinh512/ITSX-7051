<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Taco World!</h1>
        <br>
        
        <c:forEach var="blog" items="${blogList}">
            <br>
            ${blog.title} - ${blog.name}
            <br>
            ${blog.contentBody}
            <br>
        </c:forEach>
            
            
    </body>
</html>
