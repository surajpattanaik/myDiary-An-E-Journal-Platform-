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
 * Servlet implementation class EditPostServlet
 */
@WebServlet("/EditPostServlet")
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		Integer pid=Integer.parseInt(request.getParameter("pid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		try {
			PostDAO pd=new PostDAO(DBConnecter.getConn());
			boolean f=pd.updatePost(pid, title, content);
			if (f) {
				HttpSession session=request.getSession();
				session.setAttribute("updatedMSG", "Updated Successfully");
				response.sendRedirect("showPosts.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
