<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            
            input {
                display: block;
            }
        </style>
    </head>
    <body>
        <h1>User Page</h1>
        
        <p><i class="fa fa-user"></i>${user.firstName} ${user.lastName}</p>
        <p>User's Id is ${user.userId}</p>
        
<!--        <a href="/neighborhoodpet/upload">Add Pet!</a>-->
        
        
<!--This is the form to add more pets-->
<!--We then extract the value and put it into the pets table
We get the user's id value because its already in session and we attach it via a hidden input field
Then we use that id value to assign to that pet, thereby knowing that pet is also associated with the user-->


        <form action="/neighborhoodpet/upload" method="POST" enctype="multipart/form-data">
            <span style="inline">Image file:</span>    <input type="file" name="image" style="display: inline;" />
            <br>
            <br>

            Pet Name:      <input type="text" name="petName">
            Pet Breed:     <input type="text" name="petBreed">
            Pet Gender:    <input type="text" name="petGender">
            Pet Age:       <input type="text" name="petAge">
            Pet Size:      <input type="text" name="petSize">
            Pet Color:     <input type="text" name="petColor">
            Pet isMissing: <input type="text" name="isMissing">
            pet Bio:       <input type="text" name="petBio">
            Pet OwnerId    <input type="text" name="petOwnerId">

            <br />
            <input type="submit" value="Upload">
        </form>


<!--        imagedownloadservlet does indeed grab the id value...its just where/what servlet does that value come from???-->
        <img src="/neighborhoodpet/image?id=${image.id}"/>
        
    </body>
</html>
