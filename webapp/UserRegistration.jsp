<%@page import="com.cb.librarymanagementsystem.DatabaseConnection"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="com.cb.librarymanagementsystem.User"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">EpicLibrary</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.html">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>

				<!-- Login buttons as anchor tags -->
				<div class="d-flex">
					<a href="#" class="btn btn-outline-light me-2">Show Profile</a>
				</div>
			</div>
		</div>
	</nav>

	<%
	int id =Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String moblieNo = request.getParameter("mobileNo");
	System.out.print(moblieNo);

	EntityManager manager = DatabaseConnection.getEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	transaction.begin();

	User user = new User(id,name, age, email, password, moblieNo);
	try {

		manager.persist(user);
		transaction.commit();
		out.print("Welcome to EpicLibrary " + name);
	} catch (Exception e) {
		out.print("Already registerd");
	}
	%>


</body>
</html>