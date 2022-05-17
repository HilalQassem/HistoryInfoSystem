package com.health.HistoryInfoSystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "delete-doctor", value = "/delete-doctor")
public class DeleteDoctorServlet extends HttpServlet {
    private LoggingController controller;
    public void init(){
        controller=new LoggingController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(controller.deleteDoctor(request)!=0){
            request.setAttribute("message","Doctor Deleted successfully");
        }
        else {
            request.setAttribute("message","Error!");
        }
        HttpSession session=request.getSession();
        DeptAdmin deptAdmin=(DeptAdmin) session.getAttribute("deptAdmin");
        request.setAttribute("deptAdmin",deptAdmin);
        Doctor[] doctors =controller.getDeptDoctors(request);
        request.setAttribute("doctors",doctors);
        request.getRequestDispatcher("/deptadminzone.jsp").forward(request,response);
    }
}