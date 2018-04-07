<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
    </head>
    <body>
        <h1>Create Account Page here!</h1>
        
        <c:if test="${errorMsg}">
            <h1>Invalid Input!</h1>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/CreateAccountServlet" method="POST">
            Name: <input type="text" name="name">
            <br>
            Password: <input type="text" name="password">
            <br>
            <input type="submit">
        </form>
    </body>
</html>
