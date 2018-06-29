package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    @Resource(lookup = "java:app/jdbc/petsDB")
    DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on /RegisterServlet! ***");

        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);   
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doPost on /RegisterServlet! ***");

        ArrayList<User> userList = new ArrayList<>();
        
        // Gets Login and Personal Info from form
        String firstName = request.getParameter("inputFirstName");
        String lastName  = request.getParameter("inputLastName");
        String address   = request.getParameter("inputAddress");
        String city      = request.getParameter("inputCity");
        String state     = request.getParameter("inputState");
        int zip          = Integer.parseInt(request.getParameter("inputZip"));
        String email     = request.getParameter("inputEmail");
        String password  = request.getParameter("inputPassword");

        // Gets DAO from Listener
        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");

        // Gets all the users and puts them in an ArrayList
        userList = userManager.getAllUsers();
        
        // Checks to see if there's an existing user with the same name & password. If not, returns null
        User user = userManager.findUserIfValid(userList, email, password);
        
        // If the user does not exist, set user into the database and session
        if (user == null) {
            
            // Create new User from the data collected from the form
            User newUser = new User(firstName, lastName, address, city, state, zip, email, password);
            
            // Adds User into database
            userManager.addUser(newUser);
            
            // Puts the user into session
            request.getSession().setAttribute("user", newUser);
            
            response.sendRedirect("/neighborhoodpet/DisplayPetListServlet");
        } else {
            System.out.println("USER ALREADY EXISTS");
            request.setAttribute("userExists", true);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }        
    }

}
