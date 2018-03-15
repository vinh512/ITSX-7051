package edu.acc.vinh.studentgrades;

import java.io.IOException;
import java.util.ArrayList;
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
        String studentName = "John Doe";
        double grade = 0.0;

        ArrayList<Student> studentList = new ArrayList<>();

        try {
            studentName = request.getParameter("studentname");
            grade = Double.parseDouble(request.getParameter("gpa"));
            studentList.add(new Student(studentName, grade));
        } catch (Exception e) {
            String errorMessage = "If you are seeing this, it would mean that studentName or grade is null";
            request.setAttribute("errorMessage", errorMessage);
        }

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

        request.setAttribute("studentlist", studentList);

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
