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
        <h2>Total Members: ${numberOfUsers}</h2>
        
        <c:choose>
            <c:when test="${user != null}">
                <h2>Logged in as <c:out value="${user.name}"></c:out></h2>
                
                <form action="${pageContext.request.contextPath}/LogOutServlet" method="GET" >
                    <input type="submit" value="Log Out">
                </form>    
            </c:when>
                
            <c:otherwise>
                <h2>Not logged in!</h2>
                
                <form action="${pageContext.request.contextPath}/LoginServlet" method="GET" >
                    <input type="submit" value="Login">
                </form>
                
                <form action="${pageContext.request.contextPath}/CreateAccountServlet" method="GET" >
                    <input type="submit" value="Create Account">
                </form>        
            </c:otherwise>
        </c:choose>
        
        
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
