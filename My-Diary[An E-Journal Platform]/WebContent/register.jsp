<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid div-color" style="height: 85vh;">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4">
					<div class="card-header text-center text-white"
						style="background-color: #FF69B4;">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Register</h4>

						<%
							String succMsg = (String) session.getAttribute("success");
						String failedMsg = (String) session.getAttribute("failed");
						if (succMsg != null) {
						%>
						<div class="alert alert-success" role="alert">
							<p>You have successfully registered!</p>
							<p>
								<a href="login.jsp">Login </a>to start writing now!...
							</p>
							<hr>
						</div>
						<%
							session.removeAttribute("success");
						}
						%>

						<%
							if (failedMsg != null) {
						%>
						<div class="alert alert-danger" role="alert">Registration
							failed, try again...</div>
						<%
							session.removeAttribute("failed");
						}
						%>

						<div class="card-body">
							<form action="UserServlet" method="post">
								<label>Enter Your Name</label>
								<div class="form-group">
									<input type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Name" name="name">

								</div>
								<label>Enter E-mail</label>
								<div class="form-group">
									<input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="E-mail" name="email">

								</div>
								<label>Create Password</label>
								<div class="form-group">
									<label for="exampleInputPassword1"></label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password" name="pass">
								</div>

								<button type="submit"
									class="btn btn-primary badge-pill btn-block"
									style="background-color: #C71585; border-color: #C71585;">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid bg-dark">
<p class="text-center text-white">
Designed and Developed by Suraj Kr. Pattanaik
</p>
<p class="text-center text-white">
&#169;SurajKr
</p>
</div>
</body>
</html>