<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            .container {
                width: 700px;
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

        <div class="container">

            <br>
            
                <h1>Login Info</h1>
                <form method="POST" action="/neighborhoodpet/RegisterServlet">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" name="inputEmail">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword">Password</label>
                            <input type="password" class="form-control" name="inputPassword">
                        </div>
                    </div>
                    
                    <hr class="my-5">
                    
                    <h1>Personal Info</h1>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFirstName">First Name</label>
                            <input type="text" class="form-control" name="inputFirstName">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputLastName">Last Name</label>
                            <input type="text" class="form-control" name="inputLastName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" name="inputAddress">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">City</label>
                            <input type="text" class="form-control" name="inputCity">
                        </div>

                        <div class="form-group col-md-4">
                            <label for="inputState">State</label>
                            <input type="text" class="form-control" name="inputState">
                        </div>

                        <div class="form-group col-md-2">
                            <label for="inputZip">Zip</label>
                            <input type="text" class="form-control" id="inputZip">
                        </div>
                    </div>

                    <input type="submit" class="btn btn-primary"/>
                </form>
            
        </div>
    </body>
</html>
