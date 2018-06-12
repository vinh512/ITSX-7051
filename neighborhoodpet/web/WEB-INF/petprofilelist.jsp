<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
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
            
            .img-info {
                padding: 20px 0;
                border-radius: 0 0 5px 5px;
                background-color: #ffffff;
                box-shadow: 0 1px 5px rgba(0,0,0,0.1);
            }
            
            a:hover {
                text-decoration: none;
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

            <div class="row">
                <c:forEach var="pet" items="${petList}">
                    
                    <div class="col-lg-4 col-md-4 img-card">
                        <a href="/neighborhoodpet/pet/info?id=${pet.petId}">
                            <img src="${pageContext.request.contextPath}/images/LabPuppy.jpeg" class="img-fluid">
                        
                        <div class="img-info">
                            
                            <h4>${pet.petName}</h4>
                            <h4>Name: ${user.firstName}</h4>
                            
                        </div>
                        </a>
                    </div>    
                        
                </c:forEach>
            </div>
        </div>


    </body>
</html>


