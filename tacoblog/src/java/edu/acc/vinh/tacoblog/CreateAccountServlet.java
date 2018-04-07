package edu.acc.vinh.tacoblog;

import java.io.IOException;
import java.util.ArrayList;
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

        String name     = request.getParameter("name");
        String password = request.getParameter("password");
        
        UserManager userManager = (UserManager) getServletContext().getAttribute("userManager");
        
        ArrayList<User> userList = userManager.getAllUsers();
        
        User userNew = new User(name, password);
        
        if ((name == null || name.length() == 0) || (password == null || password.length() == 0)) {
            request.setAttribute("errorMsg", true);
            request.getRequestDispatcher("/WEB-INF/createaccount.jsp").forward(request, response);
        } else {
        
        userList.add(userNew);
        
        request.getServletContext().setAttribute("user", userNew);
        
        System.out.println("The userList is now up to number: " + userList.size());
        
        response.sendRedirect("/tacoblog/TacoBlogServlet");
        }
        
        
    }


}
