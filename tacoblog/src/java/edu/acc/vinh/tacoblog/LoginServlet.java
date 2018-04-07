package edu.acc.vinh.tacoblog;

import java.io.IOException;
import java.util.ArrayList;
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
        
        // get the user manager DAO we initialized in the Setup Application
        UserManager userManager = (UserManager) request.getServletContext().getAttribute("userManager");

        // checks to see if there's an existing user with the same name & password
        User user = userManager.findUserIfValid(name, password);
        
        System.out.println("This is the user: " + user);
        
        // if the user exists, set user into the session and redirect to blog page
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/tacoblog/TacoBlogServlet");
        } else {
            System.out.println("User does not exist");
            // add error msg saying user doesn't exist
            // redirects to login page
            
            request.setAttribute("userInvalid", true);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            
            
            
//            // get list of existing users
//            ArrayList<User> userList = userManager.getAllUsers();
//
//            // create User
//            User newUser = new User(name, password);
//
//            // add new user to the user list
//            userList.add(newUser);
//
//            request.getServletContext().setAttribute("user", newUser);
        
        }
        
        
        
        
        
    }

}
