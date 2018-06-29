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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        UserManager userManager = (UserManager)request.getServletContext().getAttribute("userManager");
//        PetManager petManager = (PetManager)request.getServletContext().getAttribute("petManager");
        
        
        User user = (User)request.getSession().getAttribute("user");
        
//        int userId = user.getUserId();
        
        petManager().deletePetById(user.getUserId());
        
        response.sendRedirect(request.getContextPath() + "/UserDetails");
    }
    
    private PetManager petManager() {
        return (PetManager)getServletContext().getAttribute("petManager");
    }

}
