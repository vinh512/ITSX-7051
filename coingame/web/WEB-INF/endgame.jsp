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
        <br>
        <h2>Thank you for playing!</h2>
        <p>You played ${coingame.getGameCounter()} games</p>
        <p>Games Won: ${coingame.getScore()}</p>
        <p>Games Lost: ${coingame.getGamesLost()}</p>
        <p>Win Percentage: ${coingame.getWinPercentage()}%</p>
    </body>
</html>
