<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("images/bg3.jpg");
	width: 100%;
	height: 86vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%@include file="all_component/allcss.jsp"%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="contaioner-fluid back-img">
		<div class="text-center">
			<h1 style="color: #C71585;">
				<i class="fa fa-book" aria-hidden="true"></i>MyDiary-Write anytime &
				anywhere
			</h1>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
				style="color: #C71585; border-color:#C71585; "><i class="fa fa-user" aria-hidden="true"></i>Login</a>
			<a href="register.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
				style="color: #C71585;border-color:#C71585;"><i class="fa fa-user-plus"
				aria-hidden="true"></i>Register</a>
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