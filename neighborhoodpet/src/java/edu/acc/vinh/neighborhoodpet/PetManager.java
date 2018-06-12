package edu.acc.vinh.neighborhoodpet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

public class PetManager extends DBManager {
    
    private final DataSource dataSource;
    
    public PetManager(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // gets all the pets from the database and returns them as an array
    public ArrayList<Pet> getPets() {
        ArrayList<Pet> petsList = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM pets");
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                petsList.add(petFromResultSet(resultSet));
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

        return petsList;
    }
    
    // gets a single pet based on the id number
    public Pet getPetById(DataSource dataSource, int id) {
        Pet pet = new Pet();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM pets WHERE petId = ?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                pet = petFromResultSet(resultSet);
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
        
        return pet;
    }
    

    // constructs a pet with data from the DB's result set
    private Pet petFromResultSet(ResultSet resultSet) throws SQLException {
        Pet newPet = new Pet();
        
        newPet.setPetId(resultSet.getInt("PetID"));
        newPet.setPetName(resultSet.getString("PetName"));
        newPet.setBreed(resultSet.getString("Breed"));
        newPet.setGender(resultSet.getString("Gender"));
        newPet.setAge(resultSet.getInt("Age"));
        newPet.setSize(resultSet.getString("Size"));
        newPet.setColor(resultSet.getString("Color"));
        newPet.setIsMissing(resultSet.getBoolean("IsMissing"));
        newPet.setOwnerID(resultSet.getInt("OwnerID"));
        newPet.setBio(resultSet.getString("Bio"));
        
        return newPet; 
    }
    
}
