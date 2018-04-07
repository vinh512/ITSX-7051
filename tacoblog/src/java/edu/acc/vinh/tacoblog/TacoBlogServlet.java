package edu.acc.vinh.tacoblog;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TacoBlogServlet")
public class TacoBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // get the Blog manager initialized from Setup Application
        BlogManager blogManager = (BlogManager) getServletContext().getAttribute("blogManager");
        
        // get the User manager initialized from Setup Application
        UserManager userManager = (UserManager) getServletContext().getAttribute("userManager");

        // get ArrayList from the manager
        ArrayList<Blog> blogList = blogManager.getAllBlogs();
        
        // get the number of existing users
        int numberOfUsers = userManager.getNumberOfUsers();

        // pass in blog list & number of users into request object
        request.setAttribute("blogList", blogList);
        request.setAttribute("numberOfUsers", numberOfUsers);
        
        getServletContext().getRequestDispatcher("/WEB-INF/displayblog.jsp").forward(request, response);
    }

}
