package edu.acc.vinh.tacoblog;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SetupApplication implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // instantiate manager objects
        BlogManager blogManager = new BlogManager();
        UserManager userManager = new UserManager();
        
        // initialize app with blog data
        blogManager.addBlog(new Blog("Bob Simmons", "Torchy's Damn Good Tacos", "Every day is taco ipsum tuesday. It’s raining "
                + "tacos, from out of the sky, tacos, don’t even ask why. It’s taco time all the time. Can you put some "
                + "peppers and onions on that? I’ve been following that taco truck around all day. 50 cent tacos! "));
        
        blogManager.addBlog(new Blog("Sally Wrassler", "Taco Deli", "Handcrafted gourmet tacos. Eat Great. Live Great. I’ll take 30. "
                + "TACOS!! Fish tacos: lettuce or cabbage, pico de gallo, avocado and a sour cream or citrus/mayonnaise "
                + "sauce, all placed on top of a corn or flour tortilla. It’s raining tacos, from out of the sky, tacos,"
                + " don’t even ask why. Make it a double there pal."));
        
        blogManager.addBlog(new Blog("Rufus Kale", "Cool Beans", "This vegan Mexican spot is as good as anything fried in lard. "
                + "Tacos, tacos, tacos. Fish tacos: lettuce or cabbage, pico de gallo, avocado and a sour cream or "
                + "citrus/mayonnaise sauce, all placed on top of a corn or flour tortilla. It’s raining tacos, from out of "
                + "the sky, tacos, don’t even ask why."));
        
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
