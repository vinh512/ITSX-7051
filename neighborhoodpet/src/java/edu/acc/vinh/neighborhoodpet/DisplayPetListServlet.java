package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayPetListServlet")
public class DisplayPetListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on /DisplayPetListServlet! ***");
        
//        PetManager petManager = (PetManager)request.getServletContext().getAttribute('petManager');
        
        request.getRequestDispatcher("/WEB-INF/petprofilelist.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
