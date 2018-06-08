package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/pet/info")
public class PetDetailsServlet extends HttpServlet {
    
    @Resource(lookup = "java:app/jdbc/petsDB")
    DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("*** Entered doGet on /pet/info! ***");    
        
        // get id value from query string
        int id = getIdParameter(request);
        
        PetManager petManager = (PetManager)request.getServletContext().getAttribute("petManager");
        
        Pet pet = findPet(petManager, id);
        
        request.setAttribute("pet", pet);
        
        request.getRequestDispatcher("/WEB-INF/pet_details.jsp").forward(request, response);
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
    protected Pet findPet(PetManager petManager, int id) {
        try {
            return petManager.getPetById(dataSource, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    protected int getIdParameter(HttpServletRequest request) {
        return Integer.parseInt(request.getParameter("id"));
    }

}
