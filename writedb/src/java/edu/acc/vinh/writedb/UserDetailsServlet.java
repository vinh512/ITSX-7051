package edu.acc.vinh.writedb;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/UserDetailsServlet")
public class UserDetailsServlet extends HttpServlet {

    @Resource(lookup = "java:app/jdbc/userDB")
    DataSource dataSource;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get user manager from listener
        UserManager userManager = (UserManager)getServletContext().getAttribute("userManager");
        
        // sets the user list into request
        request.setAttribute("userList", userManager.getAllUsers());

        request.getRequestDispatcher("/WEB-INF/user_details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
        
        System.out.println("Entered doGet on Details Servlet!");

        String firstName = request.getParameter("first_name"); 
        String lastName  = request.getParameter("last_name");
        String email     = request.getParameter("email");
        String password  = request.getParameter("password");
        
        // ENSURE YOU CANNOT SUBMIT A BLANK EMPTY STRING INTO AN INPUT FIELD WHEN REGISTERING
        if (firstName.length() == 0 || lastName.length() == 0 || email.length() == 0 || password.length() == 0) {
            System.out.println("BLANKS!!");
            request.getSession().setAttribute("invalidRegister", true);            
            response.sendRedirect("/writedb/HomeServlet");
        } else {
        
        // create new user from form parameters
        User newUser = new User(firstName, lastName, email, password);

        // add user to database
        userManager.addUser(newUser);

        response.sendRedirect("/writedb/UserDetailsServlet");
        }
    }

}
