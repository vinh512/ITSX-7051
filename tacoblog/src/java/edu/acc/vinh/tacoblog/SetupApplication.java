package edu.acc.vinh.tacoblog;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SetupApplication implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("context Initialized!");
        
        // instantiate manager objects
        BlogManager blogManager = new BlogManager();
        UserManager userManager = new UserManager();
        
        // initialize app with blog data
        blogManager.addBlog(new Blog("Bob", "Torchy's", "Damn Good Tacos is their motto and its easy to see why."));
        blogManager.addBlog(new Blog("Sally", "Taco Deli", "Handcrafted gourmet tacos. Eat Great. Live Great."));
        blogManager.addBlog(new Blog("Rufus", "Cool Beans", "This vegan Mexican spot is as good as anything fried in lard."));
        
        // initialize app with user data
        userManager.addUser(new User("Bob", "password123"));
        userManager.addUser(new User("Sally", "applepie"));
        userManager.addUser(new User("Rufus", "monkey007"));
        
        // add manager objects to servlet context
        sce.getServletContext().setAttribute("userManager", userManager);
        sce.getServletContext().setAttribute("blogManager", blogManager);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {    
    }
}
