package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "deptAdmin-zone", value = "/deptAdmin-zone")
public class DeptAdminZoneServlet extends HttpServlet {
    private LoggingController controller;
    public void init(){
        controller=new LoggingController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DeptAdmin deptAdmin=controller.deptAdminLogin(request);
        if(!Objects.isNull(deptAdmin)){
            request.setAttribute("deptAdmin",deptAdmin);
            Doctor[] doctors =controller.getDeptDoctors(request);
            HttpSession session=request.getSession();
            session.setAttribute("deptAdmin",deptAdmin);
            request.setAttribute("doctors",doctors);
            request.setAttribute("message","");
            request.getRequestDispatcher("/deptadminzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Username or Password is incorrect");
            request.getRequestDispatcher("/adminlogin.jsp").forward(request,response);
        }
    }
}
