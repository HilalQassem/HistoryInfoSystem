package com.health.HistoryInfoSystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;


@WebServlet(name = "get-patient-log", value = "/get-patient-log")
public class PatientHistoryServlet extends HttpServlet {
        private LoggingController controller;
        public void init(){
            controller=new LoggingController();
        }
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                Visit[] visits=controller.getVisitsLog(request);
                if(!Objects.isNull(visits)){
                        request.setAttribute("name",request.getParameter("name"));
                        request.setAttribute("visits",visits);
                        request.getRequestDispatcher("/patientslog.jsp").forward(request,response);
                }
                else {
                        request.setAttribute("message","No Logs Found");
                        request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
                }
        }
}
