<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Home Page</title>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-sm bg-light justify-content-between">
            <div class="container">
            <a class="navbar-brand" href="#">Nextdoor Pets</a>
            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Log In</a>
                </li>
            </ul>
            </div>
        </nav>

        <div class="jumbotron" id="home">
            <h1 class="display-3">Hello, Pet Neighbor!</h1>
            <p class="lead my-5">
                Has your furry companion wandered off again? Familiarize yourself 
                with your neighborhood companions and never lose a pet again!</p>
<!--            <hr class="my-5">-->

            <form action="/neighborhoodpet/RegisterServlet"  method="GET">
            <p class="lead">
                <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
            </p>
            </form>
        </div>

    </body>
</html>
