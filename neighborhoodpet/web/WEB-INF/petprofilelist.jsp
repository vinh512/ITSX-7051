<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="/neighborhoodpet/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>Pet Profiles</title>
    </head>

    <body>
        <!-- Navbar -->
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
                        <a href="/neighborhoodpet/pet/info?id=${userPetList[status.index].userId}">
                            <img src="/neighborhoodpet/image?id=${pet.ownerId}" class="img-fluid"/>
                            <div class="img-info">
                                <div class="pet-name">${userPetList[status.index].petName}</div>
                                <c:choose>
                                    <c:when test="${userPetList[status.index].isMissing == true}">
                                        <div class="zip-code"><span class="missing">Missing</span> - ${userPetList[status.index].city}, ${userPetList[status.index].zipCode}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="zip-code">${userPetList[status.index].city}, ${userPetList[status.index].zipCode}</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                
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


