package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LogIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("*** Entered doGet on /Login! ***");
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<User> userList = new ArrayList<>();
        
        // Get data from login form
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
        
        // Get the User manager from listener
        UserManager userManager = (UserManager) request.getServletContext().getAttribute("userManager");

        // Gets all the users and puts them in an ArrayList
        userList = userManager.getAllUsers();
        
        // Checks to see if there's an existing user with the same email & password
        User user = userManager.findUserIfValid(userList, email, password);
        
        // If the user exists, set user into the session else display error msg
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/neighborhoodpet/DisplayPetListServlet");
        } else {
            request.setAttribute("userInvalid", true);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }        
    }

}
