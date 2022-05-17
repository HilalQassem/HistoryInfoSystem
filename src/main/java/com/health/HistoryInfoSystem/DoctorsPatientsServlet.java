package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "get-patients", value = "/get-patients")
public class DoctorsPatientsServlet extends HttpServlet {
    private LoggingController controller;
    public void init(){
        controller=new LoggingController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Patient[] patients=controller.getPatients(request);
        if(!Objects.isNull(patients)){
            request.setAttribute("patients",patients);
            request.getRequestDispatcher("/doctorspatients.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","No Patients Found");
            request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
        }
    }
}
