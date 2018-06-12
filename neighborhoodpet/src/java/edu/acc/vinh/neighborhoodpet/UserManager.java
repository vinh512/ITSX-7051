package edu.acc.vinh.neighborhoodpet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

public class UserManager extends DBManager {
    
    private final DataSource dataSource;
    
    public UserManager(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Adds User into database
    public void addUser(User user) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("INSERT INTO users"
                    + " (FirstName, LastName, Address, City, State, ZipCode,"
                    + " Email, Password) VALUES (?,?,?,?,?,?,?,?)");
            
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getAddress());
            statement.setString(4, user.getCity());
            statement.setString(5, user.getState());
            statement.setInt(6, user.getZipCode());
            statement.setString(7, user.getEmail());
            statement.setString(8, user.getPassword());
            
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
    
    // Gets user based on email & password
    public User getUser(DataSource dataSource, String email, String password) {
        User user = new User();
                
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM users"
                    + " WHERE Email = ? AND Password = ?");
            
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                user = (userFromResultSet(resultSet));
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
    
    // Extract values from ResultSet and instantiates a User from the data
    private User userFromResultSet(ResultSet resultSet) throws SQLException {
        User user = new User();
        
        user.setUserId(resultSet.getInt("UserId"));
        user.setFirstName(resultSet.getString("FirstName"));
        user.setLastName(resultSet.getString("LastName"));
        user.setAddress(resultSet.getString("Address"));
        user.setCity(resultSet.getString("City"));
        user.setState(resultSet.getString("State"));
        user.setZipCode(resultSet.getInt("Zipcode"));
        user.setEmail(resultSet.getString("Email"));
        user.setPassword(resultSet.getString("Password"));
        
        return user;
    }
    
}
