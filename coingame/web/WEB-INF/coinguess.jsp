<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Guess Heads or Tails!</h1>
        
        
        
        <form action="/CoinGameServlet" method="POST">
            <input type="submit" name="coinChoice" value="Heads">
        </form>
    </body>
</html>
