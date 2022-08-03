package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "admin-zone", value = "/admin-zone")
public class AdminZoneServlet extends HttpServlet {
    private HistoryInfoController controller;
    public void init(){
        controller=new HistoryInfoController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin=controller.adminLogin(request);
        if(!Objects.isNull(admin)){
            Department[] departments=controller.getDepartments(request);
            DeptAdmin[] deptAdmins=controller.getDeptAdmins(request);
            for (DeptAdmin deptAdmin:deptAdmins){
                for (Department department:departments){
                    if(department.getDepartmentId()==deptAdmin.getDepartmentId()){
                        deptAdmin.setDepartmentName(department.getName());
                        break;
                    }
                }
            }
            HttpSession session=request.getSession();
            session.setAttribute("admin",admin);
            request.setAttribute("departments",departments);
            request.setAttribute("deptAdmins",deptAdmins);
            request.setAttribute("message","");
            request.getRequestDispatcher("/adminhome.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Username or Password is incorrect");
            request.getRequestDispatcher("/adminlogin.jsp").forward(request,response);
        }
    }
}
