<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>User Profile</title>
        <style>
            
            body {
                color: #666;
                background-color: #eee;
            }
            
            h1 {
                color: #63bedb;
            }
            
            h2 {
                color: #63bedb;
                margin-top: 20px;
            }

            hr {
                margin: 30px 0;
            }

            img {
                width: 600px;
                border-radius: 15px;
            }

            button {
                margin: 30px 0;
            }

            footer {
                text-align: center;
                background-color: lightblue;
                margin-top: 50px;
            }

            footer span {
                font-size: 2em;
            }

            .carousel-inner img {
                margin: auto;
            }

            .bk {
                background-color: lightblue;
            }

            .category {
                font-weight: bold;
                font-size: 1.5em;
            }

            .detail-info {
                font-size: 1.5em;
            }

            #carouselExampleIndicators {
                border-radius: 20px;   
            }
            
            /*            ---------*/

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
            
            .user-profile-icon {
                font-size: 7rem;
                border: 2px solid #c5c5c5;
                border-radius: 10px;
                padding: 20px;
            }
            
            .user-name {
                color: #63bedb;
                font-size: 2rem;
                padding-left: 15px;
            }
            
            input {
                display: block;
            }
        </style>
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
        
<!--        USER INFO IS COMING FROM SESSION "USER"-->
        
            <div class="row">
                <div class="col-lg-2">
                    <i class="fa fa-user user-profile-icon"></i>
                </div>
                <div class="col-lg-10">
                    <div class="user-name">${user.firstName} ${user.lastName}</div>
                    <div class="col-lg-12">
                        <span class="detail-info">${user.address}</span>
                    </div>
                    <div class="col-lg-12">
                        <span class="detail-info">${user.city}, ${user.state} ${user.zipCode}</span>
                    </div>
                </div>
            </div>
        
            <hr>
            <h2>Pets</h2>
<!--        <a href="/neighborhoodpet/upload">Add Pet!</a>-->
        
            <br>
        
<!--This is the form to add more pets-->
<!--We then extract the value and put it into the pets table
We get the user's id value because its already in session and we attach it via a hidden input field
Then we use that id value to assign to that pet, thereby knowing that pet is also associated with the user-->




        <form action="/neighborhoodpet/upload" method="POST" enctype="multipart/form-data">
            <span style="inline">Image file:</span>    <input type="file" name="image" style="display: inline;" />
            <br>
            <br>

            Pet Name:      <input type="text" name="petName">
            Pet Breed:     <input type="text" name="petBreed">
            Pet Gender:    <input type="text" name="petGender">
            Pet Age:       <input type="text" name="petAge">
            Pet Size:      <input type="text" name="petSize">
            Pet Color:     <input type="text" name="petColor">
            Pet isMissing: <input type="text" name="isMissing">
            pet Bio:       <input type="text" name="petBio">
            Pet OwnerId    <input type="text" name="petOwnerId">

            <br />
            <input type="submit" value="Upload">
        </form>

        </div>
    </body>
</html>
