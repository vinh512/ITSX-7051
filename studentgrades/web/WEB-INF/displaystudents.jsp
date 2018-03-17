<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Students</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Hawking Academy - Students</h1>
        <hr>
        <table id="display" style="border-collapse: collapse;">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Grade</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td>${student.getCounter()}</td>
                        <td>${student.getName()}</td>
                        <td>${student.getGrade()}</td>
                    </tr>
                </c:forEach>
            </tbody> 
        </table>
    </body>
</html>
