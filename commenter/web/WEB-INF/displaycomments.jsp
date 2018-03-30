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
        <p>Current Object: ${commentManager.class}</p>
        <p>Current Object: ${commentList}</p>
        
    
    <c:forEach var="comment" items="${commentList}">
        
            <p>${comment.name}</p>
        
    </c:forEach>
    
        
        
        <a href="${pageContext.request.contextPath}/AddComment">Add New Comment</a> 
            
    </body>
</html>
