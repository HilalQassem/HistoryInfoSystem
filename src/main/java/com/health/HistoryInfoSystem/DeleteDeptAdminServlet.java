package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delete-departmentAdmin", value = "/delete-departmentAdmin")
public class DeleteDeptAdminServlet extends HttpServlet {
    private LoggingController controller;
    public void init(){
        controller=new LoggingController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer status=controller.deleteDeptAdmin(request);
        if(status==1){
            request.setAttribute("message","Department Admin Deleted Successfully");
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
            request.setAttribute("deptAdmins",deptAdmins);
            request.setAttribute("departments",departments);
            request.getRequestDispatcher("/adminzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Error!");
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
            request.getRequestDispatcher("/adminzone.jsp").forward(request,response);
        }
    }
}