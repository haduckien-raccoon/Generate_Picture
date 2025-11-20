package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/error")
public class ErrorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code=Integer.parseInt((String) request.getParameter("code"));
		String src=switch (code) {
		case 404 -> "404.jsp";
		case 500 -> "500.jsp";
		default -> "500.jsp";	
		};
		RequestDispatcher rd = request.getRequestDispatcher(src);
		rd.forward(request, response);
	}


}