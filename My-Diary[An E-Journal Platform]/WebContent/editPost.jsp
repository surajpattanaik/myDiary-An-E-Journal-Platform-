<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.user.UserDetails"%>
<%@page import="com.dao.PostDAO"%>
<%@page import="com.db.DBConnecter"%>
<%@page import="com.user.Posts"%>
<%
	UserDetails user2=(UserDetails)session.getAttribute("userD");
	if(user2==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("loginError", "please login to continue");
	}
	
	
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f6d6d9;">

	<%Integer pid=Integer.parseInt(request.getParameter("post_id")); 
	PostDAO ob = new PostDAO(DBConnecter.getConn());
	Posts post=ob.getPostByID(pid);
	%>

	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>
		<h1 class="text-center">Edit</h1>
		<div class="container" style="height: 80vh;">

			<div class="row">
				<div class="col-md-12">

					<form action="EditPostServlet" method="post">

						<input type="hidden" value="<%=pid%>" name="pid">
						<div class="form-group">

							<label for="exampleInputEmail1">Title</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" style="border-color: #C71585;"
								name="title" required="required" value="<%=post.getTitle() %>">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Content</label>
							<textarea rows="9" cols="" class="form-control"
								style="border-color: #C71585;" name="content"
								required="required"><%=post.getContent() %></textarea>
						</div>

						<button type="submit" class="btn btn-primary badge-pill btn-block"
							style="background-color: #C71585; border-color: #C71585;">Update</button>
					</form>



				</div>
			</div>

		</div>
	</div>


	<div class="container-fluid bg-dark mt-3">
		<p class="text-center text-white">Designed and Developed by Suraj
			Kr. Pattanaik</p>
		<p class="text-center text-white">&#169;SurajKr</p>
	</div>
</body>

</body>
</html>