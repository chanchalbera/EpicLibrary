<%@page import="com.cb.librarymanagementsystem.UserDao"%>
<%@page import="com.cb.librarymanagementsystem.User"%>
<%@page import="com.mysql.cj.Query"%>
<%@page import="com.cb.librarymanagementsystem.DatabaseConnection"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>User Details Modification</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f4f4f4;
	padding: 20px;
}

h2 {
	color: #333;
}

form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	margin: 0 auto;
}
</style>
</head>
<body>

	<%
	Long id = Long.parseLong(request.getParameter("id"));
	UserDao userDao = new UserDao();
	User user = userDao.getUser(id);
	if (user != null) {
	%>


	<div class="container">
		<h2 class="mt-4 text-center">User Details</h2>

		<form action="UpdateUserServlet" method="post">
			<%-- Assuming you have a User object available with details --%>
			<input type="hidden" id="userId" name="userId"
				value="<%=user.getId()%>">
			<div class="form-group">
				<label for="userName">User Name:</label> <input type="text"
					class="form-control" id="userName" name="userName"
					value="<%=user.getName()%>" required>
			</div>
			<div class="form-group">
				<label for="userEmail">User Email:</label> <input type="email"
					class="form-control" id="userEmail" name="userEmail"
					value="<%=user.getEmail()%>" required>
			</div>
			<div class="form-group">
				<label for="userAge">User Age:</label> <input type="number"
					class="form-control" id="userAge" name="userAge"
					value="<%=user.getAge()%>" required>
			</div>
			<div class="form-group">
				<label for="userMobile">User Mobile No:</label> <input type="number"
					class="form-control" id="userMobile" name="userMobile"
					value="<%=user.getMobileNo()%>" required>
			</div>
			<button type="submit" class="btn btn-success mt-4">Update Details</button>
			<a href="AdminPanal.jsp" class="btn btn-secondary mt-4 ">Cancel</a>

		</form>
	</div>
	<%
	} else {
		request.setAttribute("updateMessage", "No user found with the provided ID.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPanal.jsp");
		dispatcher.forward(request, response);
	}
	%>



	<!-- Include Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
