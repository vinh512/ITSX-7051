<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="/neighborhoodpet/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>Register</title>
    </head>
    
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <div class="container wrap">
                <!-- Site Title -->
                <a class="navbar-brand" href="/neighborhoodpet/"><i class="fa fa-paw"></i>&nbsp;Nextdoor Pets</a>
            </div>
        </nav>

        <div class="container wrap">
            <br>
            <h1>Login Info
                <!-- Displays error msg if user exists -->
                <c:if test="${userExists}">
                - <span class='invalid-entry-msg'><i class="fa fa-exclamation-triangle"></i> Account Exists</span>
                </c:if>
            </h1>

            <form method="POST" action="/neighborhoodpet/RegisterServlet">
                <div class="form-row">
                    <!-- Email -->
                    <div class="form-group col-md-6">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" name="inputEmail">
                    </div>

                    <!-- Password -->
                    <div class="form-group col-md-6">
                        <label for="inputPassword">Password</label>
                        <input type="password" class="form-control" name="inputPassword">
                    </div>
                </div>

                <hr class="my-3">
                <h1>Personal Info</h1>

                <div class="form-row">
                    <!-- First Name -->
                    <div class="form-group col-md-6">
                        <label for="inputFirstName">First Name</label>
                        <input type="text" class="form-control" name="inputFirstName">
                    </div>

                    <!-- Last Name -->
                    <div class="form-group col-md-6">
                        <label for="inputLastName">Last Name</label>
                        <input type="text" class="form-control" name="inputLastName">
                    </div>
                </div>

                <div class="form-row">
                    <!-- Address -->
                    <div class="form-group col-md-12">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" name="inputAddress">
                    </div>
                </div>

                <div class="form-row">
                    <!-- City -->
                    <div class="form-group col-md-6">
                        <label for="inputCity">City</label>
                        <input type="text" class="form-control" name="inputCity">
                    </div>

                    <!-- State -->
                    <div class="form-group col-md-4">
                        <label for="inputState">State</label>
                        <input type="text" class="form-control" name="inputState">
                    </div>

                    <!-- Zip -->
                    <div class="form-group col-md-2">
                        <label for="inputZip">Zip</label>
                        <input type="text" class="form-control" name="inputZip">
                    </div>
                </div>

                <input type="submit" class="btn btn-lg btn-info"/>
            </form>
        </div>
        
        <!-- Footer-->
        <footer class="footer-fixed">
            <span>ACC Continuing Education 2018</span>
        </footer>
    </body>
</html>
