package edu.acc.vinh.neighborhoodpet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogOutServlet")
public class Logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("*** Entered doGet on LogOutServlet ***");
        request.getSession().invalidate();
        response.sendRedirect("/neighborhoodpet/");
    }

}
