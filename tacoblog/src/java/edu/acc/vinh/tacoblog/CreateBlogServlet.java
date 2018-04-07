package edu.acc.vinh.tacoblog;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateBlogServlet")
public class CreateBlogServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/createblog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name  = request.getParameter("name");
        String title = request.getParameter("title");
        String blog  = request.getParameter("blog");
        
        // get the blog manager helper from servlet   
        BlogManager blogManager = (BlogManager) request.getServletContext().getAttribute("blogManager");
        
        blogManager.addBlog(new Blog(name, title, blog));
        
        ArrayList<Blog> blogList = blogManager.getAllBlogs();
        
        request.getServletContext().setAttribute("blogList", blogList);
        
        response.sendRedirect("/tacoblog/TacoBlogServlet");
        
        
    }

}
