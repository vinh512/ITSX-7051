package edu.acc.vinh.writedb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class UserManager {
    
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
        user.setDateOfBirth(resultSet.getString("DateOfBirth"));
        user.setAddress(resultSet.getString("Address"));
        
        return user;
    }
    
    
    public List<User> getAllUsers() {
        ArrayList<User> userList = new ArrayList();
                
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
        
        return userList;
        
        
    } 
}
