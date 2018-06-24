package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/DisplayPetListServlet")
public class DisplayPetListServlet extends HttpServlet {
    
    @Resource(lookup = "java:app/jdbc/petsDB")
    DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on /DisplayPetListServlet! ***");

        UserPetManager userPetManager = (UserPetManager)request.getServletContext().getAttribute("userPetManager");
        request.setAttribute("userPetList", userPetManager.getUsersAndPets());
        
        ImageManager imageManager = (ImageManager)request.getServletContext().getAttribute("imageManager");
        request.setAttribute("userPetImages", imageManager.getAllImages());
        
        request.getRequestDispatcher("/WEB-INF/petprofilelist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
