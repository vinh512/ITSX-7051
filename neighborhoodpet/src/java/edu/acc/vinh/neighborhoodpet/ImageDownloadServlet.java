package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/image")
public class ImageDownloadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("*** Entered doGET on /image servlet ***");
        
        // Get DAO from Listener
        ImageManager imageManager = (ImageManager) getServletContext().getAttribute("imageManager");
        
        Integer ownerId = Integer.parseInt(request.getParameter("id"));
        ImageInfo image = imageManager.imageInfoByUserId(ownerId);
        
        if (image != null) {
            response.setStatus(200);
	    response.setContentType(image.getContentType());
            imageManager.copyImageContent(image.getId(), response.getOutputStream());
        } else {
            response.sendError(404);
        }
        
    }

}