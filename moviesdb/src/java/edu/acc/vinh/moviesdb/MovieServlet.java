package edu.acc.vinh.moviesdb;

import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/movies")
public class MovieServlet extends HttpServlet {
   
    @Inject
    MovieManager manager;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("movies", manager.getMovies());
        
        request.getRequestDispatcher("/WEB-INF/movies.jsp").forward(request, response);
    }
    
}
