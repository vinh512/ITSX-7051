package edu.acc.vinh.writedb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class CharacterManager {
    
    private final DataSource dataSource;
    
    public CharacterManager(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    private Character characterFromDB(ResultSet resultSet) throws SQLException {
        Character character = new Character();
        
        character.setId(resultSet.getInt("Id"));
        character.setName(resultSet.getString("Name"));
        character.setEmail(resultSet.getString("Email"));
        character.setAge(resultSet.getInt("Age"));
        character.setBio(resultSet.getString("Bio"));
        character.setPortrait(resultSet.getString("Portrait"));
        
        return character;
    }
    
    
    public List<Character> getAllCharacters() {
        
        ArrayList<Character> characterList = new ArrayList();
                
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM characters");
            resultSet = statement.executeQuery();
            
            while(resultSet.next()) {
                characterList.add(characterFromDB(resultSet));
            }
         }
        
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return characterList;
        
        
    } 
}
