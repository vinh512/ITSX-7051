package edu.acc.vinh.commenter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddComment")
public class AddCommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getServletContext().getRequestDispatcher("/WEB-INF/addcomment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // this grabs the arraylist from the servlet listener        
        CommentManager commentManager = (CommentManager) getServletContext().getAttribute("commentManager");

        // extracts values from the form (name & comment)
        String name    = (String) request.getParameter("author");
        String comment = (String) request.getParameter("comment");

        // error handle if input field(s) are left empty
        if (name == null || name.length() == 0 || comment == null || comment.length() == 0) {
            request.setAttribute("errorMsg", true);
            request.getRequestDispatcher("/WEB-INF/addcomment.jsp").forward(request, response);
        } else {
            // adds the form entries to instantiate a new Comment object & adds to the ArrayList
            commentManager.addComment(new Comment(name, comment));

            // adds the ArrayList to the response object
            getServletContext().setAttribute("commentManager", commentManager);

            // redirects to the Comments servlet
            response.sendRedirect("/commenter/Comments");
        }
    }

}
