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
                height: 136px;
            }
            
            span {
                font-weight: bold;
            }
            
            .win {
                color: green;
            }
            
            .lose {
                color: red;
            }
        </style>
    </head>
    <body> 
        <h1>Guess Heads or Tails</h1>
        <c:choose>            
            <c:when test = "${sessionScope.gameStart}">
                <!-- checks if player wins & displays message -->
                <p >${coingame.getResult(sessionScope.playerChoice)}</p>                
                
                <!-- displays stats of gameplay -->
<!--                <p> Score: ${coingame.getScore()} games won. 
                    Games played: ${coingame.getGameCounter()} 
                    Win percentage: ${coingame.getWinPercentage()}%</p>
                -->
                <div style="overflow:hidden; margin: 0 auto; width: 700px;text-align: center;">
                <p style="display:inline-block; margin-top: 0px"> Score: ${coingame.getScore()} games won. </p>
                <p style="display:inline-block; padding-left: 15px; border-left: 2px solid blue; margin: 0 15px;"> Games played: ${coingame.getGameCounter()} </p>
                <p style="display:inline-block; padding-left: 15px; border-left: 2px solid blue; margin-top: 0px"> Win percentage: ${coingame.getWinPercentage()}%</p>
                </div>
                
            </c:when>
            <c:otherwise>
                <p class="filler"><br><br>Press a Button to Start</p> 
            </c:otherwise>
        </c:choose>

        <form action="/coingame/CoinGameServlet" method="POST" onsubmit="myFunction()">
            <input type="submit" name="coinChoice" value="Heads">
            <input type="submit" name="coinChoice" value="Tails">
        </form>

        <form action="/coingame/Reset" method="GET">
            <input type="submit" value="Reset">
        </form>
                
        <form style="display:inline;" action="/coingame/Quit" method="GET">
            <input type="submit" value="Quit">
        </form>

    </body>
</html>
