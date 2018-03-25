<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="edu.acc.vinh.coingame.CoinGame"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coin Game</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand:400,700" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body> 
        <h1>Guess Heads or Tails</h1>
        
        <c:choose>            
            <c:when test = "${sessionScope.gameStart}">
                <!-- checks if player wins & displays message -->
                <p >${coingame.getResult(sessionScope.playerChoice)}</p>                

                <!-- displays game play results -->
                <div id='results'>
                    <p>Score: <span class='stat'>${coingame.getScore()}</span> games won.</p>
                    <p>Games played: <span class='stat'>${coingame.getGameCounter()}</span></p>
                    <p>Win percentage: <span class='stat'>${coingame.getWinPercentage()}%</span></p>
                </div>
            </c:when>
            <c:otherwise>
                <p class='size-height'><br><br>Press a Button to Start</p> 
            </c:otherwise>
        </c:choose>

        <!-- Heads and Tails button -->
        <form action="/coingame/CoinGameServlet" method="POST">
            <input type="submit" name="coinChoice" value="Heads">
            <input type="submit" name="coinChoice" value="Tails">
        </form>

        <!-- Reset Button -->
        <form class='dark-btn' action="/coingame/Reset" method="GET">
            <input type="submit" value="Reset">
        </form>

        <!-- Quit Button -->
        <form class='dark-btn' action="/coingame/Quit" method="GET">
            <input type="submit" value="Quit">
        </form>
    </body>
</html>
