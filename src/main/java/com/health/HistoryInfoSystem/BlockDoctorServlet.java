package com.health.HistoryInfoSystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "block-doctor", value = "/block-doctor")
public class BlockDoctorServlet extends HttpServlet {
    private HistoryInfoController controller;
    public void init(){
        controller=new HistoryInfoController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(controller.blockDoctor(request)!=0){
            request.setAttribute("message","Done");
        }
        else {
            request.setAttribute("message","Error!");
        }
        HttpSession session=request.getSession();
        DeptAdmin deptAdmin=(DeptAdmin) session.getAttribute("deptAdmin");
        request.setAttribute("deptAdmin",deptAdmin);
        Doctor[] doctors =controller.getDeptDoctors(request);
        request.setAttribute("doctors",doctors);
        request.setAttribute("update", 1);
        request.getRequestDispatcher("/deptadminzone.jsp").forward(request,response);
    }
}
