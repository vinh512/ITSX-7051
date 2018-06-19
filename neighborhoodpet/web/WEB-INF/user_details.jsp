<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" crossorigin="anonymous">
        <title>User Profile</title>
        <style>
            i {
                font-size: 7rem;
                border: 2px solid black;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <h1>User Page</h1>
        
        <p><i class="fa fa-user"></i>${user.firstName}</p>
        
    </body>
</html>
