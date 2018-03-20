package edu.acc.vinh.scopes;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Counter", urlPatterns = {"/Counter"})
public class Counter extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get request scoped attribute
        Integer reqCounter = (Integer)request.getAttribute("request_counter");

        // get application scoped attribute
        Integer appCounter = (Integer)request.getServletContext().getAttribute("application_counter");

        // get session scoped attribute
        HttpSession session = request.getSession();
        Integer sessCounter = (Integer)session.getAttribute("session_counter");
        
        getServletContext().getRequestDispatcher("/WEB-INF/displaycounter.jsp").forward(request, response);
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
