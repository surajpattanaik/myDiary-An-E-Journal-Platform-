<%@page import="com.user.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="index.jsp"><i class="fa fa-book"
		aria-hidden="true"></i>MyDiary</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home" aria-hidden="true"></i>Home <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="addNotes.jsp"
				style="color: white;"><i class="fa fa-pencil-square-o"
					aria-hidden="true"></i>Write</a></li>

			<li class="nav-item"><a class="nav-link" href="showPosts.jsp"
				style="color: white;">Read</a></li>
		</ul>

		<%
			UserDetails user = (UserDetails) session.getAttribute("userD");
		if (user != null) {
		%>


		<a href="" class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal"
			data-target="#exampleModal" type="submit" style="color: #C71585;"><i
			class="fa fa-user" aria-hidden="true"></i><%=user.getName().split(" ")[0]%></a> <a
			  href="LogoutServlet" class="btn btn-light my-2 my-sm-0 mr-2"
			type="submit" style="color: #C71585;"><i class="fa fa-user-plus"
			aria-hidden="true"></i>Logout</a>

		<%
			} else {
		%>

		<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			type="submit" style="color: #C71585;"><i class="fa fa-user"
			aria-hidden="true"></i>Login</a> <a href="register.jsp"
			class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
			style="color: #C71585;"><i class="fa fa-user-plus"
			aria-hidden="true"></i>Register</a>

		<%
			}
		%>






	</div>

	<%
		if (user != null) {
	%>

	<!-- Button trigger modal -->
	<!-- Modal -->
	<div
		style="background-image: linear-gradient(to right top, #e02991, #e33aa1, #e549b0, #e657c0, #e764cf, #e579dd, #e48ce9, #e39ef4, #e3b9fc, #e8d2ff, #f1e9ff, #ffffff);"
		class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div style="background-color: #FF69B4" class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"
					style="background: #ee9ca7; /* fallback for old browsers */ background: -webkit-linear-gradient(to right, #ffdde1, #ee9ca7); /* Chrome 10-25, Safari 5.1-6 */ background: linear-gradient(to right, #ffdde1, #ee9ca7);">
					<div class="container text-center">
						<i class="fa fa-user fa-3x"></i>
						<h5></h5>
						<table class="table">
							<tbody>

								<tr>
									<th>Full Name</th>
									<td><%=user.getName()%></td>
								</tr>

								<tr>
									<th>Email</th>
									<td><%=user.getEmail()%></td>
								</tr>

							</tbody>

						</table>
						<div>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal"
								style="color: white; background-color: #FF69B4; border-color: #C71585;">Close</button>
						</div>
					</div>



				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>




</nav>