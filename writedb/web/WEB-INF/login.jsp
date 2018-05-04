<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                font-family: arial, sans-serif;
            }
            h1 {
                display: inline-block;
            }
            .invalid-entry-msg {
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Login:</h1>
        
        <c:if test="${sessionScope.invalidLogin}">
            <c:remove var="invalidLogin" scope="session"/>
            <h1 class='invalid-entry-msg'>&nbsp;- Invalid Input!</h1>
        </c:if>
        
        <form method="POST" action="/writedb/HomeServlet">
            <table>
                <tr>
                    <td>Email</td>
                    <td>Password</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="login_email"></td>
                    <td><input type="text" name="login_password"></td>
                    <td><input type="submit" value="Submit"></td> 
                </tr>
            </table>
        </form>

        <br>
        <br>

        <h1>Register:</h1>
        
        
        <c:if test="${sessionScope.invalidRegister}">
            <c:remove var="invalidRegister" scope="session"/>
            <h1 class='invalid-entry-msg'>&nbsp;- Invalid Input!</h1>
        </c:if>

        <form method="POST" action="/writedb/UserDetailsServlet">
            <table>
                <tr>
                    <td><input type="text" name="first_name" placeholder="First name"></td>
                    <td><input type="text" name="last_name" placeholder="Last name"></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="email" placeholder="Email"></td>                    
                    <td><input type="text" name="password" placeholder="Password"></td>
                    <td><input type="submit" value="Submit"></td> 
                </tr>
            </table>
        </form>
        
    </body>
</html>
