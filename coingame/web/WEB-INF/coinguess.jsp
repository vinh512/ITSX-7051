<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="edu.acc.vinh.coingame.CoinGame"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Game</title>
        <style>
            body {
                text-align: center;
                font-size: 1.5em;
                margin: 0;
            }

            input {
                font-size: 2em;
                cursor:pointer;
                padding-top: 50px;

            }

            h1 {
                padding: 30px;
                margin: 0px;
                color: white;
                background-color: #FFA07A;
            }

            .filler {
                height: 100px;
                margin: 0;
            }
        </style>
    </head>
    <body> 
        <h1>Guess Heads or Tails</h1>
        <c:choose>            
            <c:when test = "${sessionScope.gameStart}">
                <!-- checks if player wins & displays message -->
                <p class="filler">${coingame.getResult(sessionScope.playerChoice)}</p>                
                <!-- displays stats of gameplay -->
                <p>
                    Score: ${coingame.getScore()} games won. 
                    Games played: ${coingame.getGameCounter()} 
                    Win percentage: ${coingame.getWinPercentage()}%
                </p>                
            </c:when>
            <c:otherwise>
                <div class="filler"><br>Press a Button to Start</div> 
            </c:otherwise>
        </c:choose>

        <form action="/coingame/CoinGameServlet" method="POST" onsubmit="myFunction()">
            <input type="submit" name="coinChoice" value="Heads">
            <input type="submit" name="coinChoice" value="Tails">
        </form>

        <form action="/coingame/Reset" method="GET">
            <input type="submit" value="Reset">
        </form>

    </body>
</html>
