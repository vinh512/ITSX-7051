package edu.acc.vinh.coingame;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CoinGameServlet")
public class CoinGameServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        // this will initially be null
        CoinGame currentGame = (CoinGame)request.getSession().getAttribute("coingame");
        
        if (currentGame == null) {
            // our CoinGame model is instantiated and set it to the session object
            currentGame = new CoinGame();            
            request.getSession().setAttribute("coingame", currentGame);
        }            
        
        getServletContext().getRequestDispatcher("/WEB-INF/coinguess.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // extract the player value from the input button
        String playerChoice = request.getParameter("coinChoice");
         
        // I need to pass in this playerChoice into getResult
        request.getSession().setAttribute("playerChoice", playerChoice);
        
        // means the player clicked on a
        request.getSession().setAttribute("gameStart", true);
        
        response.sendRedirect("/coingame/CoinGameServlet");
    }

}
