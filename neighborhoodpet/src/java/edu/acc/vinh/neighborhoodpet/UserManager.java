package edu.acc.vinh.neighborhoodpet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    
    // Gets User based on email & password
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
    
    // Gets all the Users from the database and puts them into an Array
    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM users");
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                users.add(userFromResultSet(resultSet));
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

        return users;
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
    
    // Verify if the User exists
    public User findUserIfValid(ArrayList<User> userList, String email, String password) {
        if (email != null && password != null) {
            for (User user : userList) {
                if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                    return user;
                }
            }
        }
        return null;
    }

}
