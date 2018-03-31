package edu.acc.vinh.commenter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SetupCommentManager implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        // instantiate a CommentManager object
        CommentManager commentManager = new CommentManager();

        // starting the app with some preloaded data
        commentManager.addComment(new Comment("Ninja Turtle", "I can sure go for a pepperoni & pineapple pizza right now."));
        commentManager.addComment(new Comment("Sue", "What time does the game start?"));
        commentManager.addComment(new Comment("Isaac Newton", "I can calculate the motion of heavenly bodies, but not the madness of people."));
        commentManager.addComment(new Comment("Elaine", "Top of the muffin to you."));
        commentManager.addComment(new Comment("Mario", "Its a me, Mario!"));

        // make your data structure, an arraylist and add it to the servlet
        sce.getServletContext().setAttribute("commentManager", commentManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
