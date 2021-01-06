package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.db.DBConnecter;

/**
 * Servlet implementation class deleteServlet
 */
public class AdminDeletePostServlet extends HttpServlet {   
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer pid=Integer.parseInt(request.getParameter("post_id"));
		
		try {
			PostDAO pd=new PostDAO(DBConnecter.getConn());
			boolean f=pd.DeletePost(pid);
			if (f) {

				HttpSession session=request.getSession();
				session.setAttribute("deletedMSG", "Deleted Successfully");
				response.sendRedirect("allPosts.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
		
	}

