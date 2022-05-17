package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delete-department", value = "/delete-department")
public class DeleteDepartmentServlet extends HttpServlet {
    private LoggingController controller;
    public void init(){
        controller=new LoggingController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer status=controller.deleteDepartment(request);
        Department[] departments=controller.getDepartments(request);
        request.setAttribute("departments",departments);
        DeptAdmin[] deptAdmins=controller.getDeptAdmins(request);
        for (DeptAdmin deptAdmin:deptAdmins){
            for (Department department:departments){
                if(department.getDepartmentId()==deptAdmin.getDepartmentId()){
                    deptAdmin.setDepartmentName(department.getName());
                    break;
                }
            }
        }
        request.setAttribute("deptAdmins",deptAdmins);
        if(status==1){
            request.setAttribute("message","Department Deleted Successfully");
            request.getRequestDispatcher("/adminzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Department isn't Empty");
            request.getRequestDispatcher("/adminzone.jsp").forward(request,response);
        }
    }
}
