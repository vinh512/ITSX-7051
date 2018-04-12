<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower|Nunito" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class='top-header'>
            <h1>Create Account</h1>
            
            <c:if test="${userExists}">
                <h1 class='invalid-entry-msg'>&nbsp;- User already in System - Log in</h1>
            </c:if>
                
            <c:if test="${errorMsg}">
                <h1 class='invalid-entry-msg'>&nbsp;- Invalid Input!</h1>
            </c:if>    
                
        </div>
        
        <form action="${pageContext.request.contextPath}/CreateAccountServlet" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td><label>Name:</label></td>
                        <td><input type="text" name="name"></td>
                    </tr>         
                    <tr>
                        <td><label>Password:</label></td>
                        <td><input type="text" name="password"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class='form-submit-btn' type="submit"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
