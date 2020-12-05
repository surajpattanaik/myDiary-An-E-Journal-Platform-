<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.user.UserDetails"%>
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
<title>Write</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f6d6d9;">
	<div class="container-fluid" >
		<%@include file="all_component/navbar.jsp"%>
		<h1 class="text-center">Start Writing</h1>
		<div class="container" style="height: 80vh;">

			<div class="row">
				<div class="col-md-12">

					<form action="AddPostServlet" method="post">
						<div class="form-group">

							<% 
						UserDetails user1=(UserDetails)session.getAttribute("userD");
						if(user1!=null){%>
							<input type="hidden" value="<%= user1.getUid()%>" name="uid">
							<%}
						%>




							<label for="exampleInputEmail1">Title</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" style="border-color: #C71585;"
								name="title" required="required">

						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Content</label>
							<textarea rows="9" cols="" class="form-control"
								style="border-color: #C71585;" name="content"
								required="required"></textarea>
						</div>

						<button type="submit" class="btn btn-primary badge-pill btn-block"
							style="background-color: #C71585; border-color: #C71585;">Add</button>
					</form>



				</div>
			</div>

		</div>
	</div>


	<div class="container-fluid bg-dark mt-3">
<p class="text-center text-white">
Designed and Developed by Suraj Kr. Pattanaik
</p>
<p class="text-center text-white">
&#169;SurajKr
</p>
</div>
</body>
</html>