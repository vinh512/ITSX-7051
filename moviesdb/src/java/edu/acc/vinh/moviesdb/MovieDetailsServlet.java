package edu.acc.vinh.moviesdb;

import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/movies/info")
public class MovieDetailsServlet extends HttpServlet {

    @Inject
    MovieManager manager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Movie movie = findMovie(request);
        
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/WEB-INF/movie_details.jsp").forward(request, response);
    }
       
    protected int IdParameter(HttpServletRequest request) {
        return Integer.parseInt(request.getParameter("id"));
    }

    protected Movie findMovie(HttpServletRequest request) {
        return manager.getMovieById(IdParameter(request));
    }

}
