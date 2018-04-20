package edu.acc.vinh.moviesdb;

import javax.annotation.sql.DataSourceDefinition;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@DataSourceDefinition(
        name = "java:app/jdbc/movieDB",
        className = "org.apache.derby.jdbc.ClientDataSource",
        url = "jdbc:derby://localhost:1527/",
        databaseName = "movies",
        user = "app",
        password = "app")

@WebListener
public class DBSetupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("DB Connected!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
