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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        counter++;

        // set counter to request scope
        request.setAttribute("request_counter", counter);

        // set counter to session scope
        HttpSession session = request.getSession();
        session.setAttribute("session_counter", counter);

        // set counter to application scope
        request.getServletContext().setAttribute("application_counter", counter);

        // send redirect to Counter servlet
        request.getRequestDispatcher("Counter").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
