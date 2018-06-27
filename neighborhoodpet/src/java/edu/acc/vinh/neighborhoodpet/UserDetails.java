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
        
        // Get DAOs from Listener
        ImageManager imageManager = (ImageManager)request.getServletContext().getAttribute("imageManager");
        UserPetManager userPetManager = (UserPetManager)request.getServletContext().getAttribute("userPetManager");

        // Get User from session
        User user = (User)request.getSession().getAttribute("user");

        // Get User's Id
        int userSessionId = user.getUserId();

        // Get Image Id based on User's Id
        int imageId = imageManager.imageInfoByUserId(userSessionId).getId();
        
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
