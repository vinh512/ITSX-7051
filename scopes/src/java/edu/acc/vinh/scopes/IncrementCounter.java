package edu.acc.vinh.scopes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "IncrementCounter", urlPatterns = {"/IncrementCounter"})
public class IncrementCounter extends HttpServlet {

    int counter = 0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        counter++;
        
        request.setAttribute("request_counter", counter);
        
        HttpSession session = request.getSession();
        session.setAttribute("session_counter", counter);
        
        request.getServletContext().setAttribute("application_counter", counter);
        
        request.getRequestDispatcher("Counter").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
