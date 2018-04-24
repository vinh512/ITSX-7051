<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details - ${movie.title}</title>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class='header display-width'>
            <div><h1>${movie.title} <span class='fade'>(${movie.releaseYear})</span></h1></div>
            <h1 >${movie.rating} <span class='fade'>/ 10</span></h1>     
        </div>

        <div class='display-width'>
            <hr>                
            <img class='detail-view' src="${movie.movieCover}" alt="${movie.title} cover">
            <div>
                <span>${movie.runTime}</span>
                <span>${movie.genre}</span>
                <span>${movie.releaseDate}</span>
            </div>
            <br>
            <h3>Synopsis:</h3>
            <p>A mermaid princess makes a Faustian bargain with an unscrupulous sea-witch in order to meet a human prince on land.</p>
        </div>

        <a class='back' href='/moviesdb/'>Back</a>
    </body>
</html>
