package edu.acc.vinh.neighborhoodpet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

public class PetManager extends DBManager {

    // gets all the pets from the database and returns them as an array
    public ArrayList<Pet> getPets(DataSource dataSource) {
        ArrayList<Pet> petsList = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM pets");
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                petsList.add(petFromDB(resultSet));
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

    // constructs a pet with data from the DB's result set
    private Pet petFromDB(ResultSet resultSet) throws SQLException {
        Pet newPet = new Pet();
        
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
