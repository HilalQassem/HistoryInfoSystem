package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "patient-zone", value = "/patient-zone")
public class PatientZoneServlet extends HttpServlet {
    private LoggingController controller;
    public void init(){
        controller=new LoggingController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Patient patient=controller.patientLogin(request);
        if(!Objects.isNull(patient)){
            Visit[] visits=controller.getVisitsLog(request);
            request.setAttribute("patient",patient);
            request.setAttribute("visits",visits);
            request.getRequestDispatcher("/patientzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Name or SSN is incorrect");
            request.getRequestDispatcher("/patientlogin.jsp").forward(request,response);
        }
    }
}
