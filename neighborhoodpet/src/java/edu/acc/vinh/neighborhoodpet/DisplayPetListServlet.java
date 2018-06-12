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
        
        PetManager petManager = (PetManager)request.getServletContext().getAttribute("petManager");
        
//        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
        
        // WHY DOESN'T IT WORK HERE?!?!
        User user = (User)request.getAttribute("user");
        System.out.println("DID THIS WORK? " + user);
        request.setAttribute("user", user);
                
        request.setAttribute("petList", petManager.getPets());
        
        request.getRequestDispatcher("/WEB-INF/petprofilelist.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
