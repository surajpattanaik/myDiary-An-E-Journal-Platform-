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

public class UserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("pass");
		
		UserDetails user=new UserDetails();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDAO udao=new UserDAO(DBConnecter.getConn());
		boolean f=udao.addUser(user);
		
		PrintWriter out=res.getWriter();
		HttpSession session;
		if(f==true) {
			session=req.getSession();
			session.setAttribute("success", "success");
			res.sendRedirect("register.jsp");
		} else {
			session=req.getSession();
			session.setAttribute("failed", "failed");
			res.sendRedirect("register.jsp");
		}
	}
	
	
}
