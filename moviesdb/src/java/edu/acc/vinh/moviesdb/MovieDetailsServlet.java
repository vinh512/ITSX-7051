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
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Movie movie = manager.getMovieById(id);
        
        System.out.println(movie.getTitle());
        
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/WEB-INF/movie_details.jsp").forward(request, response);

    }

}
