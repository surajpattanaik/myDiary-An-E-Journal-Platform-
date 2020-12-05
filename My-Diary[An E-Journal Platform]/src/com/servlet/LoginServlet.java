package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnecter;
import com.user.UserDetails;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("pass");

		UserDetails user = new UserDetails();
		user.setEmail(email);
		user.setPassword(password);

		UserDAO dao = new UserDAO(DBConnecter.getConn());
		UserDetails user1 = dao.loginUser(user);
		HttpSession session;
		if (user1 != null) {
			session = request.getSession();
			session.setAttribute("userD", user1);
			response.sendRedirect("home.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("failed", "failed");
			response.sendRedirect("login.jsp");
		}
	}

}
