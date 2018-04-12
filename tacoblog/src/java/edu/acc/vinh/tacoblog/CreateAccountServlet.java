package edu.acc.vinh.tacoblog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/createaccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get values from 'create account' form
        String name     = request.getParameter("name");
        String password = request.getParameter("password");

        // create new User
        User userNew = new User(name, password);
        
        // get the User manager initialized from Setup Application
        UserManager userManager = (UserManager) getServletContext().getAttribute("userManager");
        
        // checks to see if user already exists in our data store
        if (userManager.findUserIfValid(name, password) != null) {
            request.setAttribute("userExists", true);
            request.getRequestDispatcher("/WEB-INF/createaccount.jsp").forward(request, response);
        }
        // if inputs are invalid, display error message 
        else if ((name == null || name.length() == 0) || (password == null || password.length() == 0)) {
            request.setAttribute("errorMsg", true);
            request.getRequestDispatcher("/WEB-INF/createaccount.jsp").forward(request, response);
        } 
        // add to list & session
        else {   
            // add new user to our 'data base' aka ArrayList
            userManager.addUser(userNew);

            // add new user to session object
            request.getSession().setAttribute("user", userNew);

            // go back to main page
            response.sendRedirect("/tacoblog/TacoBlogServlet");
        }
    }

}
