package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BOs.UserBO;
import model.beans.User;

@WebServlet("/login_process")
public class LoginProcessServlet extends HttpServlet {

	private static final long serialVersionUID = -2792070245146847299L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username.equals("") || password.equals("")) {
			request.getSession().setAttribute("message",
					"Username and password are invalid!");
			response.sendRedirect("login");
		} else {
			User user=UserBO.login(username, password);
			if (user!=null) {
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("message", "Logged in successfully!");
				response.sendRedirect("home");
				
			} else {
				request.getSession().setAttribute("message",
						"An error occurred, please check your account information again!");
				response.sendRedirect("login");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
