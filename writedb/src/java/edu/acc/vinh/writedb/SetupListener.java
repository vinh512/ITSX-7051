package edu.acc.vinh.writedb;

import javax.annotation.Resource;
import javax.annotation.sql.DataSourceDefinition;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

@DataSourceDefinition(
        name = "java:app/jdbc/manaDB",
        className = "org.apache.derby.jdbc.ClientDataSource",
        url = "jdbc:derby://localhost:1527/",
        databaseName = "manaDB",
        user = "app",
        password = "app")

public class SetupListener implements ServletContextListener {

    @Resource(lookup = "java:app/jdbc/manaDB")
    DataSource dataSource;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
//        sce.getServletContext().setAttribute(name, sce);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
