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
        System.out.println("Entered doGet on /HomeServlet!");
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String loginEmail    = request.getParameter("login_email");
        String loginPassword = request.getParameter("login_password");

        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
        
        User user = userManager.getUser(dataSource, loginEmail, loginPassword);
        
        if (user != null) {
            System.out.println("Existing User Account Exists!");
            request.setAttribute("user", userManager.getUser(dataSource, loginEmail, loginPassword));
            response.sendRedirect("/writedb/UserDetailsServlet");
        } else {
            request.getSession().setAttribute("invalidLogin", true);
            response.sendRedirect("/writedb/HomeServlet");
            
//          request.setAttribute("invalidLogin", true);
//          request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }

    }

}
