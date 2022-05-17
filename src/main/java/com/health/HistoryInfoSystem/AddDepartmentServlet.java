package com.health.HistoryInfoSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "add-department", value = "/add-department")
public class AddDepartmentServlet extends HttpServlet {
    private HistoryInfoController controller;
    public void init(){
        controller=new HistoryInfoController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer status=controller.addDepartment(request);
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
        if(status==1){
            request.setAttribute("message","Department Added Successfully");
            request.getRequestDispatcher("/adminzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Error!");
            request.getRequestDispatcher("/adminzone.jsp").forward(request,response);
        }
    }
}
