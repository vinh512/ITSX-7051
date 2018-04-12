<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Austin Taco Blog</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower|Nunito" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class='top-header'>
            <h1>Austin Taco Blog</h1>        
            
            <c:choose>
                <c:when test="${user != null}">
                    <div class="login-forms">
                        <h2 class='user-logged-in'><c:out value="${user.name}"/></h2>

                        <form action="${pageContext.request.contextPath}/LogOutServlet" method="GET" >
                            <input type="submit" value="Log Out">
                        </form> 

                        <form action="${pageContext.request.contextPath}/CreateBlogServlet" method="GET" >
                            <input type="submit" value="Create Blog">
                        </form>    
                    </div>
                </c:when>
                
                <c:otherwise>
                    <div class="login-forms">
                        <form action="${pageContext.request.contextPath}/LoginServlet" method="GET" >
                            <input type="submit" value="Login">
                        </form>

                        <form action="${pageContext.request.contextPath}/CreateAccountServlet" method="GET" >
                            <input type="submit" value="Create Account">
                        </form>   
                    </div>
                </c:otherwise>
            </c:choose>        
        </div> <!-- end of header-->

        <div class='blog-body'>
            
        <c:forEach var="blog" items="${blogList}">
            <div class='blog-container'>
                <div class='blog-header'>
                    <span class='blog-title'><c:out value="${blog.title}"/></span>
                    <span class='blog-author'>&#8211; <c:out value="${blog.name}"/></span>
                </div>
                
                <div class='blog-content'><c:out value="${blog.contentBody}"/></div>
                <br>
            </div>
        </c:forEach>
        </div>

        <h2 class='footer-members'>Join ${numberOfUsers} (and growing) number of users!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>

    </body>
</html>
