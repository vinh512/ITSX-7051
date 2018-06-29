package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ImageUpload")
@MultipartConfig
public class ImageUpload extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGET on /ImageUpload! ***");
        
        request.getRequestDispatcher("/WEB-INF/image_upload.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doPOST on /ImageUpload! ***");

//        // Gets input values from form
//        String petName    = request.getParameter("petName");
//        String petBreed   = request.getParameter("petBreed");
//        String petGender  = request.getParameter("petGender");
//        String petSize    = request.getParameter("petSize");
//        String petColor   = request.getParameter("petColor");
//        String petBio     = request.getParameter("petBio");
//        int petAge        = Integer.parseInt(request.getParameter("petAge"));
//        int petOwnerId    = Integer.parseInt(request.getParameter("petOwnerId"));
//        Boolean isMissing = Boolean.parseBoolean(request.getParameter("isMissing"));
        
        // Gets DAO from Listener
//        PetManager petManager = (PetManager) request.getServletContext().getAttribute("petManager");
        
        // Create and add new pet generated from the data gathered from the form 
//        petManager.addPet(new Pet(petName, petBreed, petGender, petAge, petSize, petColor, isMissing, petOwnerId, petBio));
       
        // Get user from session so we can get the User's Id and pass it into the saveImage method
        User user = (User)request.getSession().getAttribute("user");
        
        System.out.println("User Id is: " + user.getUserId());
        
        // Gets Part from file upload form
        Part part = request.getPart("image");
        
        // Proceed if an image file provided
        if (part != null) {
            ImageManager imageManager = (ImageManager) getServletContext().getAttribute("imageManager");

            InputStream imageStream = null;
            try {
                String fileName = part.getSubmittedFileName();
                String contentType = part.getContentType();

                imageStream = part.getInputStream();

                // Save image passing in data from form
                imageManager.saveImage(fileName, contentType, imageStream, user.getUserId());

            } finally {
                if (imageStream != null) {
                    try {
                        imageStream.close();
                    } catch (IOException ignored) {
                    }
                }
            }

        }
        response.sendRedirect("/neighborhoodpet/DisplayPetListServlet");
   
    }

}
