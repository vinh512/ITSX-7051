package edu.acc.vinh.moviesdb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.sql.DataSource;

public class MovieManager extends DBManager {
    
    @Resource(lookup = "java:app/jdbc/movieDB")
    DataSource dataSource;
    
//    ArrayList<Movie> movies = new ArrayList<>();

    private Movie movieFromDB(ResultSet resultSet) throws SQLException {
        System.out.println("*** Isolating movie now ***");
        Movie movie = new Movie();
        
        movie.setId(resultSet.getInt("id"));
        movie.setTitle(resultSet.getString("Title"));
        movie.setReleaseYear(resultSet.getInt("ReleaseYear"));
        return movie;
    }
    
    public ArrayList<Movie> getMovies() {
        System.out.println("Get Movies done here!");
        
        ArrayList<Movie> movies = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            System.out.println("Did you at least try?!");
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM movies");
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                movies.add(movieFromDB(resultSet));
            }
                    
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("*** didn't work!!!!! ***");
            
        } 
        
        finally {
            close(resultSet);
            close(statement);
            close(connection);
        }
        
        return movies;
    }
    
    public Movie getMovieById(int id) {
        Movie movie = new Movie();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM movies where id = ?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                movie = (movieFromDB(resultSet));
            }
                    
        } catch (SQLException ex) {
            ex.printStackTrace();            
        } 
        
        finally {
            close(resultSet);
            close(statement);
            close(connection);
        }
        
        return movie;
    }
    
}
