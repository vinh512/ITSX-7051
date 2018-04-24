<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies Page</title>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Disney Movie Database:</h1>
        <table>
            <tbody>

                <c:forEach var="movie" items="${movies}">
                    <tr>
                        <td>
                            <a href="/moviesdb/movies/info?id=${movie.id}">
                                <img src="${movie.movieCover}" alt="${movie.title} cover">
                            </a>
                        </td>
                        <td><a href="/moviesdb/movies/info?id=${movie.id}">${movie.title}</a></td>
                        <td>${movie.releaseYear}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </body>
</html>
