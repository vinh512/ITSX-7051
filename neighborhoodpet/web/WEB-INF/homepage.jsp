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
            .user-logged-in {
                display: inline;
                
                padding: 0 20px 0 0px;
                font-size: 1.25rem;
            }
            
            .inline {
                display: inline;
            }
            
            .logout {
                background: none;
                border: none;
                color: black;
                cursor: pointer;
                font-size: 1.25rem;
                padding-left: 0px;
                display: inline;
            }
            
            input:hover {
                color: #007bff;
            }
            
            .user-logged-in:hover {
                color: #007bff;
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
                            <i class="fa fa-user"></i>&nbsp;<span class='user-logged-in nav-link'><c:out value="${user.firstName}"/></span>
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
                                <a class="nav-link" href="/neighborhoodpet/Login"><i class="fa fa-user"></i>&nbsp;Log In</a>
                            </li>
                        </ul>
                    </c:otherwise>
                </c:choose>

            </div>
        </nav>

        <!-- Jumbotron -->
        <div class="jumbotron" id="home">
            <h1 class="display-3">Hello, Pet Neighbor!</h1>
            <p class="lead my-5">Has your furry companion wandered off again? 
                Familiarize yourself with your neighborhood companions and never
                lose a pet again!</p>

            <!-- Button Sign Up -->
            <form action="/neighborhoodpet/RegisterServlet"  method="GET">
                <p class="lead">
                    <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                </p>
            </form>
        </div>

    </body>
</html>
