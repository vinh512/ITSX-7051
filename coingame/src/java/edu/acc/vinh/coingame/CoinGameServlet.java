package edu.acc.vinh.coingame;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CoinGameServlet")
public class CoinGameServlet extends HttpServlet {
            
    
    
//        1 - have servlet direct us to our view
//        2 - instantiate model within our servlet
//        3 - forward model to ourS jsp

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        
        String playerChoice = request.getParameter("coinChoice");
        
        CoinGame currentGame = (CoinGame)request.getSession().getAttribute("coingame");
        
        if (currentGame != null) {
            currentGame.getCoinFlip();
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/coinguess.jsp").forward(request, response);
//        response.sendRedirect("/CoinGameServlet/");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
