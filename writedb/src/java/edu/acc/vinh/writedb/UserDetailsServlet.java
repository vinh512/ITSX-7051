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
        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
        
//        request.setAttribute("user", userManager.getUser(dataSource, firstName));
        request.getRequestDispatcher("/WEB-INF/user_details.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
