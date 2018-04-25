package edu.acc.vinh.moviesdb;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("")
public class MovieServlet extends HttpServlet {
   
    @Resource(lookup = "java:app/jdbc/movieDB")
    DataSource dataSource;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // retrieves DAO manager from servlet listener
        MovieManager manager = (MovieManager)request.getServletContext().getAttribute("movieManager");
        
        request.setAttribute("movies", manager.getMovies(dataSource));
        request.getRequestDispatcher("/WEB-INF/movies.jsp").forward(request, response);
    }
    
}
