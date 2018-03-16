package edu.acc.vinh.studentgrades;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "StudentGrade", urlPatterns = {"/StudentGrade"})
public class StudentGrade extends HttpServlet {

    ArrayList<Student> studentList = new ArrayList<>();
    String studentName;
    double grade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Boolean isValid = true;
        String value = "/WEB-INF/";
        String choice = request.getParameter("choice");

        try {
            studentName = request.getParameter("studentname");
            grade = Double.parseDouble(request.getParameter("gpa"));
                    
            studentList.add(new Student(studentName, grade));
        } catch (Exception e) {
            String errorMessage = "If you are seeing this, it would mean that studentName or grade is null";
            request.setAttribute("errorMessage", errorMessage);
        }

        if (choice != null) {
            switch (choice) {
                case "1":
                    value += "createstudent.jsp";
                    break;
                case "2":
                    value += "displaystudents.jsp";
                    break;
                default:
                    value += "studentgrades.jsp";
                    isValid = false;
                    break;
            }
        } else {
            value += "studentgrades.jsp";
        }

        request.setAttribute("isValid", isValid);
        
        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher(value).forward(request, response);
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
