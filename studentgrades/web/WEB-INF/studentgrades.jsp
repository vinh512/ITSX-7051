<%@ page import="edu.acc.vinh.studentgrades.Student"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selection Home</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Hawking Academy</h1>
        <hr>
        <ul>
            <li>1. Create Student Entry</li>
            <li>2. View Students</li>
        </ul>
        <form action='StudentGrade' method='GET'>
            <input type='text' name='choice' placeholder=' Choice' autofocus>
            <button type='submit' value='Submit'>Submit</button>
        </form>        
        <%
            if (!(Boolean) request.getAttribute("isValid")) {
                out.print("<p class='warning'>Please enter 1 or 2<p>");
            }
            
//            if ((Boolean) request.getAttribute("errorMessage")) {
//                out.print("<p class='warning'>Invalid entry - Please try again</p>");
//            }
        %>
    </body>
</html>
