package edu.acc.vinh.moviesdb;

import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Displays the movie based on the id from the query string
@WebServlet("/movies/info")
public class MovieDetailsServlet extends HttpServlet {

    @Inject
    MovieManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = idParameter(request);
        
        Movie movie = findMovie(id);

        if (movie == null) {
            response.sendError(404, "Not Found");
        } else {
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("/WEB-INF/movie_details.jsp").forward(request, response);
        }
    }

    protected Movie findMovie(int id) {
        try {
            return manager.getMovieById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    protected int idParameter(HttpServletRequest request) {
        return Integer.parseInt(request.getParameter("id"));
    }

}
