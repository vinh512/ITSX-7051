package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditUser")
public class EditUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on /EditUser! ***");
        
        request.getRequestDispatcher("/WEB-INF/edit_user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doPost on /EditUser! ***");
        
        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
  
        String firstName = request.getParameter("inputFirstName");
        String lastName  = request.getParameter("inputLastName");
        String address   = request.getParameter("inputAddress");
        String city      = request.getParameter("inputCity");
        String state     = request.getParameter("inputState");
        int zipcode      = Integer.parseInt(request.getParameter("inputZip"));
        int userId       = Integer.parseInt(request.getParameter("inputUserId"));
        
        User user = new User(firstName, lastName, address, city, state, zipcode, userId);

        // Updates the User's data with the new values 
        userManager.updateUser(user);
        
        // Sets the new User into session
        request.getSession().setAttribute("user", user);

        response.sendRedirect(request.getContextPath() + "/UserDetails");
    }

}
