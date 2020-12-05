<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
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
<title>Home</title>
</head>
<body>
	<%@include file="all_component/allcss.jsp"%>

	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>
		<div class="card py-5" style="background-color:#f6d6d9; height: 85vh;">
			<div class="card-body text-center">
				<img alt="" src="images/pen.png" class="img-fluid mx-auto"
					style="max-width: 300px;">
				<h1>Start Writing</h1>

				<a href="addNotes.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
					type="submit" style="color: #C71585;"><i
					class="fa fa-pencil-square-o" aria-hidden="true"></i></a>


			</div>

		</div>
	</div>




	<%@include file="all_component/footer.jsp"%>
</body>
</html>