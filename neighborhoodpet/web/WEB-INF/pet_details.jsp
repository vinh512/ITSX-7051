<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>${userPetDetails.petName}'s Profile</title>
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
                color: white;
                text-align: center;
                background-color: lightblue;
                margin-top: 75px;
                padding: 15px;
            }

            footer span {
                font-size: 1.2rem;
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

            .back-arrow {
                font-size: 4rem;
            }

            .back {
                font-size: 1.5rem;
                text-decoration: none;
            }

            a:hover {
                text-decoration: none;
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
        <br>

        <div class="container">
            <h1>My name is ${userPetDetails.petName}!</h1>

            <!-- Beginning of Carousel -->    
            <div id="carouselExampleIndicators" class="carousel slide bk" data-ride="carousel" data-interval="false">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/neighborhoodpet/image?id=${imageData.ownerId}" class="img-fluid d-block"/>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div> <!-- End of Carousel -->
        </div>

        <br>
        <div class="container">
            <h2>My Info</h2>

            <!-- Pet Info -->
            <div class="row">
                <div class="col-lg-1">
                    <span class="category">Breed</span>
                </div>
                <div class="col-lg-3">
                    <span class="detail-info">${userPetDetails.breed}</span>
                </div>
                <div class="col-lg-1">
                    <span class="category">Color</span>
                </div>
                <div class="col-lg-3">
                    <span class="detail-info">${userPetDetails.color}</span>
                </div>
                <div class="col-lg-1">
                    <span class="category">Gender</span>
                </div>
                <div class="col-lg-3">
                    <span class="detail-info">${userPetDetails.gender}</span>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-1">
                    <span class="category">Size</span>
                </div>
                <div class="col-lg-3">
                    <span class="detail-info">${userPetDetails.size}</span>
                </div>
                <div class="col-lg-1">
                    <span class="category">Age</span>
                </div>
                <div class="col-lg-3">
                    <span class="detail-info">${userPetDetails.age}</span>
                </div>
                <div class="col-lg-1">
                    <span class="category">Pet&nbsp;ID</span>
                </div>
                <div class="col-lg-3">
                    <span class="detail-info">${userPetDetails.petId}</span>
                </div>
            </div>                                

            <hr>
            
            <!-- Pet Bio -->
            <h2>About ${userPetDetails.petName}</h2>
            <span class="detail-info">${userPetDetails.bio}</span>
            
            <hr>

            <!-- Owner Info -->
            <h2>Owner's Info:</h2>
            <div class="row">
                <div class="col-lg-4">
                    <span class="detail-info">${userPetDetails.firstName} ${userPetDetails.lastName}</span>
                </div>
                <div class="col-lg-12">
                    <span class="detail-info">${userPetDetails.address}</span>
                </div>
                <div class="col-lg-12">
                    <span class="detail-info">${userPetDetails.city}, ${userPetDetails.state} ${userPetDetails.zipCode}</span>
                </div>
            </div>
            <button class="btn btn-lg btn-info">Contact Me</button>

            <hr>

            <!-- Back Button -->
            <a href="/neighborhoodpet/DisplayPetListServlet">
                <i class="fa fa-chevron-circle-left back-arrow align-middle"></i><span class="align-middle back">&nbsp; Back</span>
            </a>
            
        </div>

        <!-- Footer -->
        <footer>
            <span>ACC Continuing Education 2018</span>
        </footer>

    </body>
</html>
