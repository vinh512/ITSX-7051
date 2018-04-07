<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Log in Page here!</h1>
        
        <c:if test="${userInvalid}">
            <h1>Invalid User!</h1>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/LoginServlet" method="POST">
            Name: <input type="text" name="name">
            <br>
            Password: <input type="text" name="password">
            <br>
            <input type="submit">
        </form>
    </body>
</html>
