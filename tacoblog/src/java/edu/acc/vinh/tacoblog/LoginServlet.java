package edu.acc.vinh.tacoblog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);   
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get data from login form
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        
        // get the User manager initialized from Setup Application
        UserManager userManager = (UserManager) request.getServletContext().getAttribute("userManager");

        // checks to see if there's an existing user with the same name & password
        User user = userManager.findUserIfValid(name, password);
        
        // if the user exists, set user into the session and redirect to main page
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/tacoblog/TacoBlogServlet");
        } else {
            request.setAttribute("userInvalid", true);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }        
    }

}
