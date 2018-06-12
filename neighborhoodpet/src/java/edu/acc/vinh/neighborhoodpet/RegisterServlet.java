package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
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

        // get Login Credentials from form
        String email    = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
        
        System.out.printf("*** This is the form Data: /n [%s, %s] ***", email, password);
        
        // get Personal Info from form

//        String firstName = request.getParameter("inputFirstName");
//        String lastName  = request.getParameter("inputLastName");
//        String address   = request.getParameter("inputAddress");
//        String city      = request.getParameter("inputCity");
//        String state     = request.getParameter("inputState");
//        int zip          = Integer.parseInt(request.getParameter("inputZip"));

        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
        request.setAttribute("user", userManager.getUser(dataSource, email, password));
        
        // SO IT WORKS HERE!
        System.out.println("TEST on RegisterServlet " + userManager.getUser(dataSource, email, password).getZipCode());
        
        
        
        // redirect to master list of pets
        response.sendRedirect("/neighborhoodpet/DisplayPetListServlet");
        
        
        
        
        
        
        
        
        
        
        // get the User manager initialized from Setup Application
//        UserManager userManager = (UserManager) request.getServletContext().getAttribute("userManager");

        // checks to see if there's an existing user with the same name & password
//        User user = userManager.findUserIfValid(name, password);
        
        // if the user exists, set user into the session and redirect to main page
//        if (user != null) {
//            request.getSession().setAttribute("user", user);
//            response.sendRedirect("/tacoblog/TacoBlogServlet");
//        } else {
//            request.setAttribute("userInvalid", true);
//            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
//        }        
    }

}
