<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Neighborhood Pet Finder (placeholder name)</h1>

        <div class="jumbotron" id="home">
            <h1 class="display-3">Hello, Pet Finder!</h1>
            <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
            <hr class="my-4">
            <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
            
            
            <form action="${pageContext.request.contextPath}/LoginServlet" method="GET" >
                            <input type="submit" value="Login">
                        </form>
            
            
            <form action="/neighborhoodpet/RegisterServlet"  method="GET">
            <p class="lead">
                <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
            </p>
            </form>
        </div>



        <!--        
                <div class="container">
                    <form action="/action_page.php">
                        <div class="form-group">
                            <label for="email">Email address:</label>
                            <input type="email" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd">
                        </div>
                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox"> Remember me
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
        -->

    </body>
</html>
