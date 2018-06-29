package edu.acc.vinh.neighborhoodpet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

public class UserPetManager extends DBManager {
    
    private final DataSource dataSource;
    
    public UserPetManager(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Gets all the Users and Pets from the database and returns them as an array
    public ArrayList<UserPet> getUsersAndPets() {
        ArrayList<UserPet> usersPetsList = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("select * from pets, users where userid = pets.ownerId");
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                usersPetsList.add(usersPetsFromResultSet(resultSet));
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

        return usersPetsList;
    }
    
    // Gets user-pet details based on the id number
    public UserPet getDataById(DataSource dataSource, int id) {
        UserPet userPet = new UserPet();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM pets, users WHERE userid = pets.ownerId AND ownerId = ?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                userPet = usersPetsFromResultSet(resultSet);
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
        
        return userPet;
    }
    
    // Constructs a User-Pet object with data from the DB's result set
    private UserPet usersPetsFromResultSet(ResultSet resultSet) throws SQLException {
        UserPet newUserPet = new UserPet();
        
        // User data
        newUserPet.setUserId(resultSet.getInt("UserId"));
        newUserPet.setFirstName(resultSet.getString("FirstName"));
        newUserPet.setLastName(resultSet.getString("LastName"));
        newUserPet.setAddress(resultSet.getString("Address"));
        newUserPet.setCity(resultSet.getString("City"));
        newUserPet.setState(resultSet.getString("State"));
        newUserPet.setZipCode(resultSet.getInt("Zipcode"));
        newUserPet.setEmail(resultSet.getString("Email"));
        newUserPet.setPassword(resultSet.getString("Password"));
        
        // Pet data
        newUserPet.setPetId(resultSet.getInt("PetID"));
        newUserPet.setPetName(resultSet.getString("PetName"));
        newUserPet.setBreed(resultSet.getString("Breed"));
        newUserPet.setGender(resultSet.getString("Gender"));
        newUserPet.setAge(resultSet.getInt("Age"));
        newUserPet.setSize(resultSet.getString("Size"));
        newUserPet.setColor(resultSet.getString("Color"));
        newUserPet.setIsMissing(resultSet.getBoolean("IsMissing"));
        newUserPet.setOwnerID(resultSet.getInt("OwnerID"));
        newUserPet.setBio(resultSet.getString("Bio"));
        
        return newUserPet; 
    }
    
}
