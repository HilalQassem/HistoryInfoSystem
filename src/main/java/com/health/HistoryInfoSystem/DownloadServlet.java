package com.health.HistoryInfoSystem;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "download", value = "/download")
public class DownloadServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {
            String fileName = request.getParameter("filename");
            String path = "c:"+File.separator+"upload"+File.separator + fileName;
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            FileInputStream ins = new FileInputStream(path);
            int i;
            while ((i = ins.read()) != -1) {
                out.write(i);
            }
            ins.close();
        }
    }
}
