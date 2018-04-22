<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies Page</title>
        <style>
            table {
                border: 1px solid #ddd;
            }
            td {
                border: 1px solid #ddd;
                padding-right: 50px;
            }
            th {
                text-align: left;
            }
        </style>
    </head>
    <body>
        <h1>Disney Movie Database:</h1>

        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="movie" items="${movies}">
                    <tr>
                        <td>${movie.title}</td>
                        <td>${movie.releaseYear}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
