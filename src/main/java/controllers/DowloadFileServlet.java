package controllers;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.User;

@WebServlet("/picture/download")
public class DowloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = "";
		
		try {
			fname = request.getParameter("file");
		} catch (Exception e) {
		}
		
		if(!fname.isBlank()) {
//			GeneratedPicture file = GeneratedPictureBO.downloadFile(fid);
			User user= (User) request.getSession().getAttribute("user");  
			String scrpath = GetFolderPath("user_"+user.getUid()).getAbsolutePath() + File.separator + fname;
			try {
				java.nio.file.Path path = Paths.get(scrpath);
				byte[] data = Files.readAllBytes(path);
				
				response.setContentType("application/octet-stream");
			    response.setHeader("Content-disposition", "attachment; filename=" + fname);
			    response.setContentLength(data.length);
			    InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));
			    
			    OutputStream outStream = response.getOutputStream();
			    byte[] buffer = new byte[4096];
			    int bytesRead = -1;
			    
			    while ((bytesRead = inputStream.read(buffer)) != -1) {
			      outStream.write(buffer, 0, bytesRead);
			    }
			    
			    inputStream.close();
			    outStream.close();
			} catch (Exception e) {
				request.getRequestDispatcher("404.jsp").forward(request, response);
			}
	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private File GetFolderPath(String folder) {
	    File folderUpload = new File(System.getProperty("user.home") + "/image_users/" + folder);
	    if (!folderUpload.exists()) {
	      folderUpload.mkdirs();
	    }
	    return folderUpload;
	  }

}
