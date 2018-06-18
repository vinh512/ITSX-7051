<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>Home Page</title>
        <style>
            .jumbotron {
                color: white;
                min-height: 500px;
                background-image: url("${pageContext.request.contextPath}/images/DogCatSleep.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }
            
            .jumbotron h1 {
                font-weight: 500;
                font-size: 5.8rem;
            }
            
            .jumbotron p {
                font-weight: 200;
                font-size: 2.5rem;
            }
            
            .inline {
                display: inline;
            }
            
            .login {
                font-size: 1.25rem;
                text-decoration: none !important;
            }
            
            .logout {
                background: none;
                border: none;
                color: black;
                cursor: pointer;
                font-size: 1.25rem;
                padding-left: 0px;
                margin-right: 10px;
                display: inline;
            }
            
            .logout:hover {
                color: #007bff;
            }
            
            button[type="submit"] {
                padding: 14px 24px;
                width: 150px;
                font-size: 32px;
                line-height: normal;
                background-color: #63bedb;
                border: none;
                -webkit-border-radius: 8px;
                   -moz-border-radius: 8px;
                        border-radius: 8px;
            }
        </style>
    </head>
    <body>
        
        <!-- Navbar -->
        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <div class="container">

                <!-- Site Title -->
                <a class="navbar-brand" href="#"><i class="fa fa-paw"></i>&nbsp;Nextdoor Pets</a>

                <c:choose>
                    <c:when test="${user != null}">
                        <div class="login-forms">
                            <!-- User Name -->
                            <i class="fa fa-user"></i>
                            <form action="${pageContext.request.contextPath}/LogOutServlet" method="GET" class="inline">
                                <input type="submit" value="<c:out value='${user.firstName}'/>" class="logout">
                            </form>
                            
                            <!-- Log Out -->
                            <i class="fa fa-window-close"></i>
                            <form action="${pageContext.request.contextPath}/LogOutServlet" method="GET" class="inline">
                                <input type="submit" value="Log Out" class="logout">
                            </form> 
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Login -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="login" href="/neighborhoodpet/Login"><i class="fa fa-user"></i>&nbsp;Log In</a>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>

            </div>
        </nav>

        <!-- Jumbotron -->
        <div class="jumbotron" id="home">
            <h1 class="display-3">Never Lose Your Pet Again</h1>
            <p class="lead my-5">Get to know your neighborhood companions</p>

            <!-- Button Sign Up -->
            <form action="/neighborhoodpet/RegisterServlet"  method="GET">
                <p class="lead">
                    <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                </p>
            </form>
        </div>

    </body>
</html>
