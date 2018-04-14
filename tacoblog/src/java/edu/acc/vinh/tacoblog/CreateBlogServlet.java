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
        // checks to see if user is logged in, in order to access create-blog page
        if (request.getSession().getAttribute("user") != null) {
            System.out.println("here: "  + request.getSession().getAttribute("user"));
            request.getRequestDispatcher("/WEB-INF/createblog.jsp").forward(request, response);
        } else {
            response.sendRedirect("/tacoblog/TacoBlogServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get form values
        String name  = request.getParameter("name");
        String title = request.getParameter("title");
        String blog  = request.getParameter("blog");
        
        if ((title == null || title.length() == 0) || (blog == null || blog.length() == 0)) {
            request.setAttribute("errorMsg", true);
            request.getRequestDispatcher("/WEB-INF/createblog.jsp").forward(request, response);
        } else {
            
        // get the blog manager helper from servlet   
        BlogManager blogManager = (BlogManager) request.getServletContext().getAttribute("blogManager");
        
        // add blog to our data store object
        blogManager.addBlog(new Blog(name, title, blog));
        
        // get the blog ArrayList
        ArrayList<Blog> blogList = blogManager.getAllBlogs();
        
        // add the blog ArrayList into the servlet
        request.getServletContext().setAttribute("blogList", blogList);
        
        response.sendRedirect("/tacoblog/TacoBlogServlet");
        }
    }

}
