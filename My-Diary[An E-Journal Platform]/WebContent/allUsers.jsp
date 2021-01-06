<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<%
	AdminDetails admin2 = (AdminDetails) session.getAttribute("adminD");
if (admin2 == null) {
	response.sendRedirect("adminLogin.jsp");
	session.setAttribute("loginError", "please login to continue");
}
%>



<body style="background-color: #f6d6d9;">
	<%@include file="all_component/adminNavbar.jsp"%>
	<%
		String deletedMSG = (String) session.getAttribute("deletedMSG");

	if (deletedMSG != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deletedMSG%>
	</div>
	<%
		session.removeAttribute("deletedMSG");
	}
	%>

<body>
	<%@page import="java.util.List"%>
	<%@page import="com.user.UserDetails"%>
	<%@page import="com.dao.UserDAO"%>
	<%@page import="com.db.DBConnecter"%>
	<table align="center" class="table table-striped table-dark">
		<thead>
			<tr>
				<th>User ID</th>
				<th>User Name</th>
				<th>E-mail</th>
				<th>Posts</th>
			</tr>
		</thead>
		<%
			UserDAO user1 = new UserDAO(DBConnecter.getConn());
		List<UserDetails> usersList = user1.getAllUsers();
		for (UserDetails u : usersList) {
		%>
		<tr>
			<td><%=u.getUid()%></td>
			<td><%=u.getName()%></td>
			<td><%=u.getEmail()%></td>
			<td><a class="btn btn-primary" style="width:200px" href="showPostsByID.jsp?uid=<%=u.getUid()%>&uname=<%=u.getName()%>">Posts by <%=u.getName().split(" ")[0]%>
			</a></td>
			<td><div class="container text-center mt-2">
					<a href="DeleteUserServlet?uid=<%=u.getUid()%>"
						class="btn btn-danger">Delete User</a>

				</div></td>
		</tr>

		<%
			}
		%>
	</table>

</body>
<%@include file="all_component/footer.jsp"%>
</html>