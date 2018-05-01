package edu.acc.vinh.writedb;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    
    @Resource(lookup = "java:app/jdbc/userDB")
    DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entered doGet!");
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Enter doPost!");
        
        String loginName     = request.getParameter("login_name");
        String loginPassword = request.getParameter("login_password");
        
        String firstName = request.getParameter("first_name"); 
        String lastName  = request.getParameter("last_name");
        String email     = request.getParameter("email");
        String password  = request.getParameter("password");
        
        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
        
        if (loginName != null && loginPassword != null) {
            System.out.println("Existing User Account Exists!");
        } else {
            // create new user from form parameters
            User newUser = new User(firstName, lastName, email, password);
            
            // add user to database
            userManager.addUser(newUser);
            
            request.setAttribute("user", userManager.getUser(dataSource, firstName));
        }
        // FIRST PASS IN THE FIRSTNAME PARAMETER INTO REQUEST SCOPE
        // THEN YOU CAN DO A REQUEST.GETATTRIBUTE ON THE FIRST NAME WITHIN THE DETAILS SERVLET
        // THAT WAY, YOU CAN DO A REDIRECT ON POST
        
        System.out.println("Test: " + userManager.getUser(dataSource, firstName));
//        response.sendRedirect("/writedb/UserDetailsServlet");
        request.getRequestDispatcher("/WEB-INF/user_details.jsp").forward(request, response);
    }

}
