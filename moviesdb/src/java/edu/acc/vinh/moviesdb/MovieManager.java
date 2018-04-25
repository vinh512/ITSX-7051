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

    private Movie movieFromDB(ResultSet resultSet) throws SQLException {
        Movie movie = new Movie();
        
        movie.setId(resultSet.getInt("id"));
        movie.setTitle(resultSet.getString("Title"));
        movie.setReleaseYear(resultSet.getInt("ReleaseYear"));
        movie.setRating(resultSet.getString("Rating"));
        movie.setRunTime(resultSet.getString("RunTime"));
        movie.setGenre(resultSet.getString("Genre"));
        movie.setReleaseDate(resultSet.getString("ReleaseDate"));
        movie.setDirector(resultSet.getString("Director"));
        movie.setCover(resultSet.getString("Cover"));
        movie.setSynopsis(resultSet.getString("Synopsis"));
        
        return movie;
    }
    
    public ArrayList<Movie> getMovies() {
        ArrayList<Movie> movies = new ArrayList<>();
        
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement("SELECT * FROM movies ORDER BY releaseYear ASC");
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                movies.add(movieFromDB(resultSet));
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
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
            } else {
                movie = null;
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
