package edu.acc.vinh.studentgrades;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "StudentGrade", urlPatterns = {"/"})
public class StudentGrade extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String value = "/WEB-INF/";
        
        String message = "Does this work?";
        request.setAttribute("message", message);

        if (request.getParameter("choice") != null) {

            switch (request.getParameter("choice")) {
                case "1":
                    value += "createstudent.jsp";
                    break;
                case "2":
                    value += "displaystudents.jsp";
                    break;
                default:
                    value += "studentgrades.jsp";
                    break;
            }

        } else {
            value += "studentgrades.jsp";
        }

        request.getRequestDispatcher(value).forward(request, response);
//        request.getRequestDispatcher("/WEB-INF/studentgrades.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
