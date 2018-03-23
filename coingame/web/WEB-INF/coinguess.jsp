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

            }

            h1 {
                padding: 30px;
                margin: 0px;
                color: white;
                background-color: #FFA07A;
            }
        </style>
    </head>

    <body>
        <h1>Guess Heads or Tails!</h1>

        <p>Score: ${coingame.getScore()} games won. 
            Games played: ${coingame.getGameCounter()} 
            Win percentage: ${coingame.getWinPercentage()}%</p>
        
        <hr>

        <!--        if gameCounter not equal to zero, run the following:-->
    
    
    <c:out value="${sessionScope.playerChoice}"/>
    
    <c:if test = "${sessionScope.playerChoice != null}"> 
            <p>${coingame.getResult(sessionScope.playerChoice)}</p>
        </c:if>

        <form action="/coingame/CoinGameServlet" method="POST">
            <input type="submit" name="coinChoice" value="Heads">
            <input type="submit" name="coinChoice" value="Tails">
        </form>

        <form action="/coingame/Reset" method="GET">
            <input type="submit" value="Reset">
        </form>

    </body>
</html>
