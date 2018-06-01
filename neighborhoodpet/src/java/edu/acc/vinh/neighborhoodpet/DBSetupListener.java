package edu.acc.vinh.neighborhoodpet;

import javax.annotation.sql.DataSourceDefinition;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@DataSourceDefinition(
        name = "java:app/jdbc/petsDB",
        className = "org.apache.derby.jdbc.ClientDataSource",
        url = "jdbc:derby://localhost:1527/",
        databaseName = "petsDB",
        user = "app",
        password = "app")

@WebListener
public class DBSetupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("*** petsDB Connected! ***");
//        sce.getServletContext().setAttribute("userManager", new userManager());
//        sce.getServletContext().setAttribute("petManager", new petManager());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Context Destroyed");
    }
}
