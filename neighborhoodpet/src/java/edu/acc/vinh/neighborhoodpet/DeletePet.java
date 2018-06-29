package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePet")
public class DeletePet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on /DeletePet! ***");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doPost on /DeletePet! ***");
        
        User user = (User)request.getSession().getAttribute("user");

        petManager().deletePetById(user.getUserId());
        imageManager().deleteImageById(user.getUserId());
        
        response.sendRedirect(request.getContextPath() + "/UserDetails");
    }
    
    private PetManager petManager() {
        return (PetManager)getServletContext().getAttribute("petManager");
    }
    
    private ImageManager imageManager() {
        return (ImageManager)getServletContext().getAttribute("imageManager");
    }

}
