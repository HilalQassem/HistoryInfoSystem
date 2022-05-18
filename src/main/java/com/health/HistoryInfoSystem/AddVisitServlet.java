package com.health.HistoryInfoSystem;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.LocalDateTime;

import static com.health.HistoryInfoSystem.Constants.*;


@WebServlet(name = "add-visit", value = "/add-visit")
@MultipartConfig(fileSizeThreshold = MEMORY_THRESHOLD,
        maxFileSize = MAX_FILE_SIZE,
        maxRequestSize = MAX_REQUEST_SIZE)
public class AddVisitServlet extends HttpServlet {
    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename"))
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
        }
        return Constants.DEFAULT_FILENAME;
    }
    private HistoryInfoController controller;
    public void init(){
        controller=new HistoryInfoController();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = "c:"+ File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        try {
            String fileName = "";
            for (Part part : request.getParts()) {
                if(getFileName(part).indexOf('.')==-1)
                    continue;
                fileName = part.getName()+ LocalDateTime.now().hashCode()+getFileName(part).substring(getFileName(part).lastIndexOf('.'));
                part.write(uploadPath + File.separator + fileName);
                request.setAttribute(part.getName(), fileName);
            }
        } catch (FileNotFoundException fne) {
            request.setAttribute("message", "There was an error: " + fne.getMessage());
        }
        if(controller.addVisit(request)!=0){
            request.setAttribute("message","Visit added successfully");
            request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
        }
        else {
            request.setAttribute("message","Check the data you entered");
            request.getRequestDispatcher("/doctorzone.jsp").forward(request,response);
        }
    }
}
