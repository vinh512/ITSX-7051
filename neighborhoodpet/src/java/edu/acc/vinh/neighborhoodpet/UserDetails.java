package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {

    @Resource(lookup = "java:app/jdbc/petsDB")
    DataSource dataSource;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on /UserDetails! ***");
        int imageId = 0;
        
        // Get DAOs from Listener
        ImageManager imageManager = (ImageManager)request.getServletContext().getAttribute("imageManager");
        UserPetManager userPetManager = (UserPetManager)request.getServletContext().getAttribute("userPetManager");

        // Get User from session
        User user = (User)request.getSession().getAttribute("user");

        // Get User's Id
        int userSessionId = user.getUserId();

        // If there's an image, get the image's ID value so that it can be used to display the pet image
        if (imageManager.imageInfoByUserId(userSessionId) != null) {
           imageId = imageManager.imageInfoByUserId(userSessionId).getId();
        } 
        // Else assign it a value of 0 (null effectively) for JSTL checking within the JSP to display proper html
        else {
           imageId = 0;
        }
        
        UserPet userPetData = userPetManager.getDataById(dataSource, imageId);

        request.setAttribute("imageId", imageId);
        request.setAttribute("userPetData", userPetData);

        request.getRequestDispatcher("/WEB-INF/user_details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
        
}
