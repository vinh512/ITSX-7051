<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies Page</title>
    </head>
    <body>
        <h1>Show Movies List here!</h1>
        
        test
        <h1>${movies}</h1>
        
        <c:forEach var="movie" items="${movies}">
            <ul>
                <li>test</li>
                <li>${movie.title}</li>
            </ul>
        </c:forEach>
    </body>
</html>
