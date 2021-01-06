<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.user.UserDetails"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="com.db.DBConnecter"%>
<%@page import="com.user.Posts"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.user.AdminDetails"%>

<%
	AdminDetails admin2 = (AdminDetails) session.getAttribute("adminD");
if (admin2 == null) {
	response.sendRedirect("adminLogin.jsp");
	session.setAttribute("loginError", "please login to continue");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f6d6d9;">
	<%@include file="all_component/adminNavbar.jsp"%>
	<%
		String updatedMSG = (String) session.getAttribute("updatedMSG");
	String deletedMSG = (String) session.getAttribute("deletedMSG");
	if (updatedMSG != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updatedMSG%>
	</div>
	<%
		session.removeAttribute("updatedMSG");
	}
	if (deletedMSG != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deletedMSG%>
	</div>
	<%
		session.removeAttribute("deletedMSG");
	}
	%>
	<div class="container">
		<h2 class="text-center">All Posts</h2>
		<div class="row">
			<div class="col-md-12">

				<%
					if (admin2 != null) {
					PostDAO ob = new PostDAO(DBConnecter.getConn());
					List<Posts> list = ob.getAllPosts();
					for (Posts post : list) {
						String title = post.getTitle();
						String content = post.getContent();
						String uName = post.getuName();
						Date date = post.getPdate();
						String visibility = post.getVisibility();
				%>


				<div class="card mt-3" style="border-color: #C71585;">

					<svg width="5em" height="5em" viewBox="0 0 16 16"
						class="bi bi-book-half card-img-top mt-2 mx-auto"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd"
							d="M8.5 2.687v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
		</svg>

					<div class="card-body p-4">
						<h5 class="card-title"><%=title%></h5>
						<p><%=content%></p>
						<p>
							<b class="text-success">Published by: <%=uName%></b><br> <b
								class="text-primary"></b>
						</p>
						<p>

							<b class="text-success">Date: <%=date%></b><br> <b
								class="text-primary"></b>

						</p>
						<p>

							<b class="text-success">Visibility: <%=visibility%></b><br>
							<b class="text-primary"></b>

						</p>
						<div class="container text-center mt-2">
							<a href="AdminDeletePostServlet?post_id=<%=post.getPid()%>"
								class="btn btn-danger">Delete</a>

						</div>
					</div>


					<%
						}

					}
					%>

				</div>

			</div>
		</div>

	</div>

	<div class="container-fluid bg-dark">
		<p class="text-center text-white">Designed and Developed by Suraj
			Kr. Pattanaik</p>
		<p class="text-center text-white">&#169;SurajKr</p>
	</div>
</body>
</html>