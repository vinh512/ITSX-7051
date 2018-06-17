<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
                
            h2 {
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
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <a class="navbar-brand" href="#">Logo - Nextdoor Pets</a>
            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">${userPet.firstName}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 2</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 3</a>
                </li>
            </ul>
        </nav>
        <br>


        <div class="container">
            <h1>My name is ${userPetDetails.petName}!</h1>
<!--            <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">-->

            <div id="carouselExampleIndicators" class="carousel slide bk" data-ride="carousel" data-interval="false">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-75" src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-75" src="${pageContext.request.contextPath}/images/SleepyChihuahua.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-75" src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" alt="Third slide">
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
            <h2>About Me</h2>
            <span class="detail-info">${userPetDetails.bio}</span>
            <hr>

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

        </div>

        <footer>
            <span>Footer Info Here</span>
        </footer>

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    </body>
</html>
