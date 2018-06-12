package edu.acc.vinh.neighborhoodpet;

import javax.annotation.Resource;
import javax.annotation.sql.DataSourceDefinition;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

@DataSourceDefinition(
        name = "java:app/jdbc/petsDB",
        className = "org.apache.derby.jdbc.ClientDataSource",
        url = "jdbc:derby://localhost:1527/",
        databaseName = "petsDB",
        user = "app",
        password = "app")

@WebListener
public class DBSetupListener implements ServletContextListener {

    @Resource(lookup = "java:app/jdbc/petsDB")
    DataSource dataSource;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("*** petsDB Connected! ***");

        sce.getServletContext().setAttribute("userManager", new UserManager(dataSource));
        sce.getServletContext().setAttribute("petManager", new PetManager(dataSource));
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Context Destroyed");
    }
}
