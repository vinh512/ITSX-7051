<%@page import="edu.acc.vinh.coingame.CoinGame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <%
//            out.println("<p> aaww" + session.getAttribute("playerChoice") + "</p>");
        %>
        
        <p>Score: ${currentGame.getScore()} games won. 
           Games played: ${currentGame.getGameCounter()} 
           Win percentage: ${currentGame.getWinPercentage()}%</p>
        
        <hr>
        
        <p>${currentGame.getResult(sessionScope.playerChoice)}</p>
        
        <form action="/coingame/CoinGameServlet" method="POST">
            <input type="submit" name="coinChoice" value="Heads">
            <input type="submit" name="coinChoice" value="Tails">
        </form>
        
        <form action="/coingame/Reset" method="GET">
            <input type="submit" value="Reset">
        </form>
        
    </body>
</html>
