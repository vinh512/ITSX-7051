package edu.acc.vinh.commenter;

import java.util.ArrayList;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CommentServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // I initialize the data here
        ArrayList<Comment> commentManager = new ArrayList<>();
        
        // this shouldn't be here and should be in the servlet used to populate the arraylist
        // add an instantiated Comment literal to the arraylist
        commentManager.add(new Comment("Vinh", "Howdy"));
        
        // make your data structure, an arraylist and add it to the servlet
        sce.getServletContext().setAttribute("commentManager", commentManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
