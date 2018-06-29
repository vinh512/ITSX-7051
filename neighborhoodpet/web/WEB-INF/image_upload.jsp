<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="/neighborhoodpet/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>User Profile</title>
    </head>
    
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <div class="container">

                <!-- Site Title -->
                <a class="navbar-brand" href="/neighborhoodpet/"><i class="fa fa-paw"></i>&nbsp;Nextdoor Pets</a>

                <c:choose>
                    <c:when test="${user != null}">
                        <div class="login-forms">

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
        <br>

        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <i class="fa fa-user user-profile-icon"></i>
                </div>
                <div class="col-lg-10">
                    <div class="user-name">${user.firstName} ${user.lastName}</div>
                    <div class="col-lg-12">
                        <span class="user-info">${user.address}</span>
                    </div>
                    <div class="col-lg-12">
                        <span class="user-info">${user.city}, ${user.state} ${user.zipCode}</span>
                    </div>
                </div>
            </div>

            <hr>
            <p>The user ID and thus image ID: ${user.userId}</p>

            <form action="/neighborhoodpet/ImageUpload" method="POST" enctype="multipart/form-data" class="wrap">            
                <h2>Upload Image&nbsp; </h2><input type="file" name="image"/>
                
                <input type="hidden" name="petOwnerId" value="${user.userId}">

                <br><br><br>

                <input type="submit" class="btn btn-lg btn-info"/>

            </form>

        </div>

        <footer class="footer-fixed">
            <span>ACC Continuing Education 2018</span>
        </footer>
    </body>
</html>
