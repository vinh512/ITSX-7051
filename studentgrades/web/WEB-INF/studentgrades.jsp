<%@page import="edu.acc.vinh.studentgrades.Student"%>
<%--<%@page import="java.util.*" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selection Home</title>
    </head>
    <body>
        <h1>Hawking Academy</h1>
        <hr>
        <ul>
            <li>1. Create Student Entry</li>
            <li>2. View Students</li>
        </ul>
        <form action='StudentGrade' method='POST'>
            <input type='text' name='choice' placeholder='selection'>
            <input type='submit' value='Submit'>
        </form>
        
        <% 
            if(!(Boolean)request.getAttribute("isValid")) {
                out.print("Please enter 1 or 2");
            }
        %>
        <br>
        <%= request.getAttribute("studentList").toString() %>
    </body>
</html>
