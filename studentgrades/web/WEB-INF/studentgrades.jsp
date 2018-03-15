<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hawking School</h1>
        <ul>
            <li>1. Create Student Entry</li>
            <li>2. View Students</li>
        </ul>
        <form action='StudentGrade' method='POST'>
            <input type='text' name='choice' placeholder='selection'>
            <input type='submit' value='Submit'>
        </form>
        <%= request.getAttribute("grade") %>
        <%= request.getAttribute("message") %>
    </body>
</html>
