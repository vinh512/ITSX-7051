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

            .headline {
                color: white;
            }

            .jumbotron {
                color: white;
                min-height: 500px;
                background-image: url("${pageContext.request.contextPath}/images/DogCatSleep.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
                border-radius: 0;
                margin-bottom: 80px;
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

            footer {
                color: white;
                text-align: center;
                background-color: lightblue;
                margin-top: 75px;
                padding: 15px;
            }

            footer span {
                font-size: 1.2rem;
            }

            button[type="submit"] {
                font-size: 2rem;
                background-color: #63bedb;
                border: none;
            }

            /*            --------------*/

            .img-card {
                margin: 15px 0;
                text-align: center;            
            }

            img {
                border-radius: 5px 5px 0 0;
                box-shadow: 0 1px 5px rgba(0,0,0,0.1);
            }

            .img-info {
                padding: 20px 0;
                border-radius: 0 0 5px 5px;
                background-color: #ffffff;
                box-shadow: 0 1px 5px rgba(0,0,0,0.1);
            }

            .pet-name {
                color: #3fa4c5;
                font-weight: 400;
                font-size: 1.5rem;
            }

            .zip-code {
                color: #777;
                font-size: 1.1rem;
            }

            /*            ---------*/

            .text-lg {
                font-size: 3rem;
            }

            .text-wrap {
                margin: 0 auto;
                width: 600px;
                font-size: 1.3rem;
            }

            .near {
                padding-top: 20px;
            }

            .gray-background {
                background-color: #dfe0e0;
                padding-bottom: 20px;
            }
            
            .map {
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
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
                            <form action="${pageContext.request.contextPath}/UserDetails" method="GET" class="inline">
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
            <h1 class="display-3 headline">Never Lose Your Pet Again</h1>
            <p class="my-5">Get to know your neighborhood companions</p>
            <!-- Displays button based on user login -->
            <c:choose>
                <c:when test="${user != null}">
                    <!-- Button View Pets -->
                    <form action="/neighborhoodpet/DisplayPetListServlet"  method="GET">
                        <button type="submit" class="btn btn-primary btn-lg">View Pets</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <!-- Button Sign Up -->
                    <form action="/neighborhoodpet/RegisterServlet"  method="GET">
                        <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Site Explanation -->
        <h2 class="text-center text-lg mt-5 mb-4">What is Nextdoor Pets?</h2>
        <div class="container">
            <p class="text-wrap text-justify"> Nextdoor Pets is the private social network
                for you and your neighborhood to get acquainted with your pet family. It's
                the easiest and most effective way for your community to keep an eye out 
                and help reunite your pets should they stray too far from home.</p>
            <br>
            <br>
        </div>

        <!-- Sample Pet List -->
        <div class="gray-background">
            <div class="container">
                <h2 class="text-center text-lg mt-5 mb-4 near">Meet Pets Near You</h2>
                <div class="row">
                    <div class="col-lg-4 col-md-4 img-card">                        
                        <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">
                        <div class="img-info">
                            <div class="pet-name">Daisy</div>
                            <div class="zip-code">Austin, 78751</div>
                        </div>
                    </div>  
                    <div class="col-lg-4 col-md-4 img-card">                        
                        <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">
                        <div class="img-info">
                            <div class="pet-name">Tuna</div>
                            <div class="zip-code">Austin, 78750</div>
                        </div>
                    </div>  
                    <div class="col-lg-4 col-md-4 img-card">                        
                        <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">
                        <div class="img-info">
                            <div class="pet-name">Oscar</div>
                            <div class="zip-code">Austin, 78752</div>
                        </div>
                    </div>  
                </div>
            </div>
        </div>

        <!-- Map -->
        <div class="text-center my-5">
            <img class="map" src="/neighborhoodpet/images/Map.jpg" alt="map">
        </div>
                        
        <!-- Footer-->
        <footer>
            <span>ACC Continuing Education 2018</span>
        </footer>

    </body>
</html>
