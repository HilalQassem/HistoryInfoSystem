package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "doctor-zone", value = "/doctor-zone")
public class DoctorZoneServlet extends HttpServlet {
    private HistoryInfoController controller;
    public void init(){
        controller=new HistoryInfoController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Doctor doctor=controller.doctorLogin(request);
        if(!Objects.isNull(doctor) && !doctor.isBlocked()){
            HttpSession session=request.getSession();
            session.setAttribute("doctor",doctor);
            request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
        }
        else if(!Objects.isNull(doctor) && doctor.isBlocked()){
            request.setAttribute("message","You're blocked. please contact your departments' admin.");
            request.getRequestDispatcher("/doctorlogin.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Username or Password is incorrect");
            request.getRequestDispatcher("/doctorlogin.jsp").forward(request,response);
        }
    }
}
