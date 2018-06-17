<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>Login</title>
        <style>
            .wrap {
                width: 700px;
            }
            
            .invalid-entry-msg {
                color: red;
            }
            </style>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <div class="container">

                <!-- Site Title -->
                <a class="navbar-brand" href="/neighborhoodpet/"><i class="fa fa-paw"></i>&nbsp;Nextdoor Pets</a>
            </div>
        </nav>

        <br>
        
        <div class="container wrap">
            <h1>Login
                <!-- Displays error msg if invalid entries -->
                <c:if test="${userInvalid}">
                    <span class='invalid-entry-msg'>&nbsp;- Invalid Input!</span>
                </c:if>
            </h1>
            
            <form method="POST" action="/neighborhoodpet/Login">
                <div class="form-row">
                    <!-- Email -->
                    <div class="form-group col-md-6">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" name="inputEmail">
                    </div>
                    <!-- Password -->
                    <div class="form-group col-md-6">
                        <label for="inputPassword">Password</label>
                        <input type="password" class="form-control" name="inputPassword">
                    </div>
                </div>    
                <!-- Submit Button -->
                <input type="submit" class="btn btn-primary"/>
            </form>
            
        </div>
    </body>
</html>
