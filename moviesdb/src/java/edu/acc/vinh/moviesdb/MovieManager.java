package edu.acc.vinh.moviesdb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

public class MovieManager extends DBManager {

    // gets all the movies from the database and puts them in an array
    public ArrayList<Movie> getMovies(DataSource dataSource) {
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
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        } 
        finally {
            close(resultSet);
            close(statement);
            close(connection);
        }

        return movies;
    }
    
    // gets a single movie based on the ID value
    public Movie getMovieById(DataSource dataSource, int id) {
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
        } 
        catch (SQLException ex) {
            ex.printStackTrace();            
        } 
        finally {
            close(resultSet);
            close(statement);
            close(connection);
        }
        
        return movie;
    }
    
    // constructs a movie with data from the DB's result set
    private Movie movieFromDB(ResultSet resultSet) throws SQLException {
        Movie newMovie = new Movie();
        
        newMovie.setId(resultSet.getInt("id"));
        newMovie.setTitle(resultSet.getString("Title"));
        newMovie.setReleaseYear(resultSet.getInt("ReleaseYear"));
        newMovie.setRating(resultSet.getString("Rating"));
        newMovie.setRunTime(resultSet.getString("RunTime"));
        newMovie.setGenre(resultSet.getString("Genre"));
        newMovie.setReleaseDate(resultSet.getString("ReleaseDate"));
        newMovie.setDirector(resultSet.getString("Director"));
        newMovie.setCover(resultSet.getString("Cover"));
        newMovie.setSynopsis(resultSet.getString("Synopsis"));
        
        return newMovie;
    }
    
}
