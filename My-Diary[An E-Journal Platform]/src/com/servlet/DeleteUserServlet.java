package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.dao.UserDAO;
import com.db.DBConnecter;

/**
 * Servlet implementation class deleteServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer uid=Integer.parseInt(request.getParameter("uid"));
		
		try {
			UserDAO u=new UserDAO(DBConnecter.getConn());
			boolean f=u.deleteUser(uid);
			if (f) {

				HttpSession session=request.getSession();
				session.setAttribute("deletedMSG", "User Deleted");
				response.sendRedirect("allUsers.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
		
	}

