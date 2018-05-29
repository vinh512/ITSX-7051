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
        <h1>Neighborhood Pet Finder (placeholder name)</h1>

        <div class="jumbotron" id="home">
            <h1 class="display-3">Hello, Pet Finder!</h1>
            <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
            <hr class="my-4">
            <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>

            <form action="/neighborhoodpet/RegisterServlet"  method="GET">
            <p class="lead">
                <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
            </p>
            </form>
        </div>

    </body>
</html>
