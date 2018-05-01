package edu.acc.vinh.writedb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class UserManager extends DBManager {
    
    private final DataSource dataSource;
    
    public UserManager(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    private User userFromDB(ResultSet resultSet) throws SQLException {
        User user = new User();
        
        user.setId(resultSet.getInt("Id"));
        user.setFirstName(resultSet.getString("FirstName"));
        user.setLastName(resultSet.getString("LastName"));
        user.setEmail(resultSet.getString("Email"));
        
        return user;
    }
    
    public void addUser(User user) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("INSERT INTO users (FirstName, LastName, Email, Password) VALUES (?,?,?,?)");
            
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            
            statement.execute();
        } 
        
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        finally {
            close(statement);
            close(connection);
        }
    }
    
    public List<User> getAllUsers() {
        ArrayList<User> userList = new ArrayList<>();
                
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM users");
            resultSet = statement.executeQuery();
            
            while(resultSet.next()) {
                userList.add(userFromDB(resultSet));
            }
         }
        
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        finally {
            close(resultSet);
            close(statement);
            close(connection);
        }
        
        return userList;        
    }
    
    public User getUser(DataSource dataSource, String firstName) {
        User user = new User();
                
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM users WHERE FirstName = ?");
            statement.setString(1, firstName);
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                user = (userFromDB(resultSet));
            } else {
                user = null;
            }          
         }
        
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        finally {
            close(resultSet);
            close(statement);
            close(connection);
        }
        
        return user; 
    }
    
}
