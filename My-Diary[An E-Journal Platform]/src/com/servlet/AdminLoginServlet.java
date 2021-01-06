package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnecter;
import com.user.AdminDetails;
import com.user.UserDetails;

public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("adminemail");
		String password = request.getParameter("adminpass");

		AdminDetails admin = new AdminDetails();
		admin.setEmail(email);
		admin.setPassword(password);

		UserDAO dao = new UserDAO(DBConnecter.getConn());
		AdminDetails admin1 = dao.loginAdmin(admin);
		HttpSession session;
		if (admin1 != null) {
			session = request.getSession();
			session.setAttribute("adminD", admin1);
			response.sendRedirect("adminHome.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("failed", "failed");
			response.sendRedirect("adminLogin.jsp");
		}
		
		
		
		
		
	}

}
