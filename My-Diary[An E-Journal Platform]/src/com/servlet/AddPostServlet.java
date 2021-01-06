package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PostDAO;
import com.db.DBConnecter;
import com.user.Posts;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int vid=Integer.parseInt(request.getParameter("optradio"));
		java.util.Date date=new java.util.Date();
		java.sql.Date date1=new java.sql.Date(date.getTime());
		PostDAO dao=new PostDAO(DBConnecter.getConn());
		boolean f=dao.addPost(title,content,uid,date1,vid);

		if (f) {
			response.sendRedirect("showPosts.jsp");
		}
		else {
			System.out.println("problem");
		}
		
		
	}

}
