<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
         <link href="https://fonts.googleapis.com/css?family=Indie+Flower|Nunito" rel="stylesheet">
        <style>
            body {
                margin: 0 auto;
                background-color: rgb(230,230,230);
                font-family: 'Nunito', sans-serif;
            }
            
            h1 {
                float: left;
                padding-left: 50px;
                color: #f17022;
            }
            
            table {
                margin: 25px 25px 25px 50px;
            }
            
            td input {
                margin-left: 20px;
            }
            
            .top-header {
                margin: 0;
                background-color: #fdda24;
                border-bottom: 5px solid #e8c92f;
                overflow: hidden;
            }
            
            .members {
                padding-right: 20px;
                float: right;
            }
            
            input[type=submit] {
                -webkit-appearance: none;
                font-size: 1.5em;
                border-radius: 5px;
                margin-top: 20px;
                background-color: #f48c6b;
                color: white;
                border: none;
                cursor: pointer;
            }
            
            input[type=submit]:hover {
                background-color: #51acc1;
            }
            
            .login-forms {
                display: inline;
                float: right;
                padding-right: 40px;
            }
            
            .login-forms form {
                display: inline;
                padding-right: 10px;                
            }
            
            .blog-container {
                text-align: justify;
                max-width: 700px;
                margin: 0 auto;
                margin-top: 20px;
                margin-bottom: 20px;
            }
            
            body .blog-container:first-of-type {
                margin-top: 35px;
            }
            
            .blog-header {
                margin-bottom: 10px;
            }
            
            .blog-title {
                font-size: 1.5em;
                padding-left: 10px;
                border-left: 5px solid #f2c6c6;
                color: #f17022;
                font-family: 'Indie Flower', cursive;
            }
            
            .blog-title:hover {
                border-left: 5px solid #51acc1;
            }
            
            .blog-author {
                float: right;
                color: rgb(125, 125, 125);
            }
            
            .blog-content {
                color: rgb(50, 50, 50);
                font-size: 1.1em;
                border-bottom: 2px solid #f2c6c6;
                padding-bottom: 10px;
            }
            
            .user-logged-in {
                border-left: 3px solid white;
                display: inline;
                color: #f17022;
                padding: 0 20px 0 10px;
            }
            
            .footer-members {
                border-top: 5px solid #e8c92f;
                position: fixed;
                bottom: 0;
                background-color: #fdda24;
                width: 100%;
                margin: 0;
                padding-right: 50px;
                text-align: right;
                color: #f17022;
            }
            
            .blog-body {
                margin-bottom: 60px;
            }
            
            .form-submit-btn {
                float: right;
            }
            
            .invalid-entry-msg {
                padding-left: 0;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class='top-header'>
            <h1>Create Account</h1>
            
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
