package edu.acc.vinh.commenter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SetupCommentManager implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        // instantiate a CommentManager object
        CommentManager commentManager = new CommentManager();

        // starting the app with some default data
        commentManager.addComment(new Comment("Vinh", "Howdy"));

        // make your data structure, an arraylist and add it to the servlet
        sce.getServletContext().setAttribute("commentManager", commentManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
