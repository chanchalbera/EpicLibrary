<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script>
	// Disable browser back button
	<script>
	history.forward();
</script>

</head>
<body class="bg-light">


	<div class="container">
		<div class="row justify-content-center align-items-center min-vh-100">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title text-center mb-4">Admin Login</h2>

						<%-- Display the logout/ login message if available --%>
						<%
						String logoutMessage = (String) request.getAttribute("logoutMessage");
						String logInMessage = (String) request.getAttribute("loginMessage");
						%>
						<%
						if (logoutMessage != null) {
						%>
						<div class="alert alert-success" role="alert">
							<%=logoutMessage%>
							Want to go <a href="index.html">HomePage</a>?
						</div>
						<%
						}
						%>

						<form action="AdminLogIn" method="post">
							<div class="mb-3">
								<label for="username" class="form-label">Username:</label> <input
									type="text" id="username" name="username" class="form-control"
									required>
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password:</label> <input
									type="password" id="password" name="password"
									class="form-control" required>
							</div>

							<div class="d-grid mb-3">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
						<%
						if (logInMessage != null) {
						%>
						<%=logInMessage%>
						<%
						}
						%>

						<div class="text-center">
							<p>
								Don't have an account? <a href="registration_admin.jsp">Register
									here</a>.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
