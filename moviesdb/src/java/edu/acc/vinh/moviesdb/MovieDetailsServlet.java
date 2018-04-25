package edu.acc.vinh.moviesdb;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/movies/info")
public class MovieDetailsServlet extends HttpServlet {

    @Resource(lookup = "java:app/jdbc/movieDB")
    DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // gets id from query string parameter
        int id = idParameter(request);
        
        // retrieves DAO manager from servlet listener
        MovieManager manager = (MovieManager)request.getServletContext().getAttribute("movieManager");
        
        // uses DAO's method to find movie based on its ID and returns the movie
        Movie movie = findMovie(manager, id);
        
        // if movie not found, redirect to error page
        if (movie == null) {
            response.sendError(404, "Not Found");            
        } else {
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("/WEB-INF/movie_details.jsp").forward(request, response);
        }
    }

    protected Movie findMovie(MovieManager manager, int id) {
        try {
            return manager.getMovieById(dataSource, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    protected int idParameter(HttpServletRequest request) {
        return Integer.parseInt(request.getParameter("id"));
    }

}
