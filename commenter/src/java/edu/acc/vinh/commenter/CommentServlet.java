package edu.acc.vinh.commenter;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Comments")
public class CommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        // get the CommentManager object from the servlet context
        CommentManager commentManager = (CommentManager) getServletContext().getAttribute("commentManager");

        // extract the ArrayList using CommentManager method   
        ArrayList<Comment> commentList = commentManager.getAllComments();

        // pass in the ArrayList to the request object
        request.setAttribute("commentList", commentList);

        getServletContext().getRequestDispatcher("/WEB-INF/displaycomments.jsp").forward(request, response);
    }

}
