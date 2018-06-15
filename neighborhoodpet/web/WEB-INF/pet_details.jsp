<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>



        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


        <title>JSP Page</title>
        <style>
            img {
                width: 600px;
                border-radius: 15px;
            }

            .carousel-inner img {
                margin: auto;
                width: 300px;
            }

            .bk {
                background-color: lightblue;
            }
        </style>
    </head>
    <body>


        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <a class="navbar-brand" href="#">Logo - Nextdoor Pets</a>
            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 1</a>
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
    <!--        <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">-->


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
            <h1>My Info:</h1>
            <div class="row">
                <div class="col-lg-4">
                    <h2>Breed <span class="pet-info">${userPetDetails.breed}</span></h2>
                </div>
                <div class="col-lg-4">
                    <h2>Color <span class="pet-info">${userPetDetails.color}</span></h2>
                </div>
                <div class="col-lg-4">
                    <h2>Gender <span class="pet-info">${userPetDetails.gender}</span></h2>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <h2>Size <span class="pet-info">${userPetDetails.size}</span></h2>
                </div>
                <div class="col-lg-4">
                    <h2>Age <span class="pet-info">${userPetDetails.age}</span></h2>
                </div>
                <div class="col-lg-4">
                    <h2>Pet ID <span class="pet-info">${userPetDetails.petId}</span></h2>
                </div>
            </div>
                
<!--                <h1>My Bio</h1>
                <div class="row">
                    <h2>
                    ${userPetDetails.bio}
                    </h2>
                </div>-->
                
                
                <hr>
                
                
                <h1>Owner's Info:</h1>
                <div class="row">
                <div class="col-lg-4">
                    <h2><span class="pet-info">${userPetDetails.firstName} ${userPetDetails.lastName}</span></h2>
                </div>
                <div class="col-lg-12">
                    <h2><span class="pet-info">${userPetDetails.address}</span></h2>
                    <h2><span class="pet-info">${userPetDetails.city}, ${userPetDetails.state} ${userPetDetails.zipCode}</span></h2>
                    <h2><span class="pet-info"></span></h2>
                </div>
                
            </div>
                
        </div>





        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    </body>
</html>
