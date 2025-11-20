package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BOs.QueryTopicBO;
import model.BOs.UserBO;
import model.beans.GeneratedPicture;
import model.beans.User;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			User user=(User)request.getSession().getAttribute("user");
			int uid = user.getUid();
			ArrayList<GeneratedPicture> files = UserBO.getProcessedFile(uid);
			request.setAttribute("Files", files);
			request.setAttribute("queryTopics", QueryTopicBO.getAllQueryTopics(uid));

			RequestDispatcher rd = request.getRequestDispatcher("user_profile.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
