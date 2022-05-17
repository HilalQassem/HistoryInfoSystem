package com.health.HistoryInfoSystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "add-patient", value = "/add-patient")
public class AddPatientServlet extends HttpServlet {
    private HistoryInfoController controller;
    public void init(){
        controller=new HistoryInfoController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(controller.addPatient(request)!=0){
            request.setAttribute("message","Patient added successfully");
            request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Check the data you entered");
            request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
        }
    }
}
