<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>Pet Profiles</title>
        <style>
            body {
                background-color: #eaeaea;
            }

            .img-card {
                margin: 15px 0;
                text-align: center;            
            }

            img {
                border-radius: 5px 5px 0 0;
                box-shadow: 0 1px 5px rgba(0,0,0,0.1);
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

            .img-info {
                padding: 20px 0;
                border-radius: 0 0 5px 5px;
                background-color: #ffffff;
                box-shadow: 0 1px 5px rgba(0,0,0,0.1);
            }
            
            .img-info:hover {
                background-color: #bddce6;
            }

            a:hover {
                text-decoration: none;
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
        </style>
    </head>
    <body>
        

        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <div class="container">
                <!-- Site Title -->
                <a class="navbar-brand" href="/neighborhoodpet/"><i class="fa fa-paw"></i>&nbsp;Nextdoor Pets</a>

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
            </div>
        </nav>
        <br>

        <div class="container">
            <div class="row">
                
                <!-- Use varStatus as the index to iterate over the userPetList array -->
                <c:forEach var="pet" items="${userPetImages}" varStatus="status">
                    <div class="col-lg-4 col-md-4 img-card">
                        <a href="/neighborhoodpet/pet/info?id=${userPetList[status.index].petId}">
                            <img src="/neighborhoodpet/image?id=${pet.ownerId}" class="img-fluid"/>
                            <div class="img-info">
                                <div class="pet-name">${userPetList[status.index].petName}</div>
                                <div class="zip-code">${userPetList[status.index].city}, ${userPetList[status.index].zipCode}</div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                
                
                
                <c:forEach var="profile" items="${userPetList}">
                    <div class="col-lg-4 col-md-4 img-card">
                        <a href="/neighborhoodpet/pet/info?id=${profile.petId}">                            
                            <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">
                            <div class="img-info">
                                <div class="pet-name">${profile.petName}</div>
                                <div class="zip-code">${profile.city}, ${profile.zipCode}</div>
                            </div>
                        </a>
                    </div>    
                </c:forEach>
                
            </div>
        </div>


    </body>
</html>


