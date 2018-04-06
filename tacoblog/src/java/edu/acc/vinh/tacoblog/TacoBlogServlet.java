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
        
        BlogManager blogManager = (BlogManager) getServletContext().getAttribute("blogManager");

        // now that i have the blogmanger, i can use the method to get the array.
        // then pass the array into the request for the jsp to use
        ArrayList<Blog> blogList = blogManager.getAllBlogs();
        
        // pass in blog list into request object
        request.setAttribute("blogList", blogList);
        
        
        request.getRequestDispatcher("/WEB-INF/displayblog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
