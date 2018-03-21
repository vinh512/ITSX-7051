<%@page import="edu.acc.vinh.coingame.CoinGame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Guess Heads or Tails!</h1>
        
        
        
        <%
            out.println("<p> aaww" + session.getAttribute("playerChoice") + "</p>");
        %>
        <p>${sessionScope.playerChoice}</p>
        <p>${currentGame.getResult(sessionScope.playerChoice)}</p>
        
        <form action="/coingame/CoinGameServlet" method="POST">
            <input type="submit" name="coinChoice" value="Heads">
        </form>
    </body>
</html>
