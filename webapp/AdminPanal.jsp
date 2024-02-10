<%@page import="com.cb.librarymanagementsystem.Admin"%>
<%@page import="com.cb.librarymanagementsystem.AdminDao"%>
<%@page import="com.cb.librarymanagementsystem.BookDao"%>
<%@page import="com.cb.librarymanagementsystem.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel - EpicLibrary</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/* Custom styles for an attractive admin panel */
* {
	margin: 0px;
}

body {
	background-color: #f8f9fa;
	font-family: 'Roboto', sans-serif;
	background-image:
		url('https://www.pixel-studios.com/blog/wp-content/uploads/2018/12/012.jpg');
	background-size: cover;
	height: 100vh;
	height: 100vh;
	padding: 0;
	opacity: 0.8;
	z-index: -1;
	position: relative;
}

#home-content {
	
}

.navbar {
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
	z-index: 1;
	opacity: 1;
}

.navbar-brand {
	color: #fff !important;
}

.container-fluid {
	padding-left: 0;
	padding-right: 0;
}

.nav-link {
	color: #fff !important;
}

.content {
	padding: 20px;
}

.dropdown:hover>.dropdown-menu {
	display: block;
	margin-top: 0.125em;
}

table {
	width: 50%;
	border-collapse: collapse;
	margin: 20px;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

.hidden {
	display: none;
}

.modal-content {
	background-color: #f8f9fa;
	border-radius: 10px;
}

.modal-header {
	background-color: #007bff;
	color: #fff;
	border-bottom: 0;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.modal-footer {
	border-top: 0;
}

.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: #333; /* Add background color for the footer */
	color: #fff; /* Set text color for the footer */
	text-align: center;
	padding: 10px;
}

@media ( min-width : 768px) {
	.dropdown:hover>.second {
		position: absolute;
		left: 100%;
		top: 50%;
	}
}
</style>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);
%>
</head>

<body>

	<%
	String userName = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("adminName")) {
		userName = cookie.getValue();
			}
		}
	}
	%>



	<%
	if (!userName.equals("")) {
	%>
	<!-- Navbar Start -->

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

					<!-- Add dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="deleteDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Add </a>
						<ul class="dropdown-menu bg-info" aria-labelledby="deleteDropdown">
							<li><a class="dropdown-item nav-link" href="addUser.jsp">Add
									User</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item nav-link" href="AddBook.jsp">Add
									Book</a></li>
						</ul></li>
					<!-- Update dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="deleteDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Update </a>
						<ul class="dropdown-menu bg-info" aria-labelledby="deleteDropdown">
							<li><a class="dropdown-item nav-link" href="#"
								data-bs-toggle="modal" data-bs-target="#myModal">Update User</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item nav-link" href="#"
								data-bs-toggle="modal" data-bs-target="#myModalforBookUpdate">Update
									Book</a></li>
						</ul></li>
					<!-- Delete dropdown with submenus -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="deleteDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Delete </a>
						<ul class="dropdown-menu bg-info" aria-labelledby="deleteDropdown">
							<li><a class="dropdown-item nav-link" href="#"
								data-bs-toggle="modal" data-bs-target="#myModalTwo">Delete
									User</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item nav-link" href="#"
								data-bs-toggle="modal" data-bs-target="#myModalForDeleteBook">Delete
									Book</a></li>
						</ul></li>
				</ul>

				<!-- Login buttons as anchor tags -->
				<!-- User Profile -->
				<div class="d-flex align-items-center" style="margin-right: 20px">
					<!-- Link to the profile page with circular user icon -->
					<a href="#" data-bs-toggle="modal"
						data-bs-target="#adminProfileModal"
						class="text-decoration-none text-light d-flex align-items-center me-3">
						<!-- Example user icon from FontAwesome --> <i
						class="fas fa-user-circle fa-lg me-2"></i> <%=userName%> <span
						class="d-none d-md-inline"> </span>
					</a>

					<!-- Modern "Log Out" link -->
					<a href="Logout" class="text-decoration-none text-light"> <i
						class="fas fa-sign-out-alt fa-lg me-1 "></i> Log Out
					</a>
				</div>
			</div>
		</div>
	</nav>

	<!-- Navbar End -->


	<!-- Modal start -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title bg-sucess" id="exampleModalLabel">Enter
						UserId For Update</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="inputValue">Enter Id:</label> <input type="text"
						class="form-control" id="inputValue">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="redirectToJSP()">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal End -->

	<!-- Modal for Update Book Start -->

	<div class="modal fade" id="myModalforBookUpdate" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title bg-sucess" id="exampleModalLabel">Enter
						BookId For Update</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="bookID">Enter Id:</label> <input type="text"
						class="form-control" id="bookID">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="redirectToBookJSP()">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Update Book End -->

	<!-- Modal for Delete User Start -->

	<div class="modal fade" id="myModalTwo" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title bg-sucess" id="exampleModalLabel">Enter
						UserId For Delete</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="userId">Enter Id:</label> <input type="number"
						class="form-control" id="userId">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="redirectToDeleteUserJSP()">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Delete User End -->
	
	<!-- Modal for Delete Book Start-->

	<div class="modal fade" id="myModalForDeleteBook" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title bg-sucess" id="exampleModalLabel">Enter
						BookId For Delete</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="bookId_delete">Enter Id:</label> <input type="number"
						class="form-control" id="bookId_delete">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="redirectToDeleteBookJSP()">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Delete Book End-->
	

	<!-- Modal for Show Profile Start -->

	<div class="modal fade" id="adminProfileModal" tabindex="-1"
		role="dialog" aria-labelledby="adminProfileModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="adminProfileModalLabel">Admin
						Profile</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<%
					String adminName = null;
					String adminEmail = null;

					// Retrieve adminName and adminEmail from cookies
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("adminName")) {
						adminName = cookie.getValue();
							} else if (cookie.getName().equals("adminEmail")) {
						adminEmail = cookie.getValue();
							}
						}
					}

					if (adminName != null && adminEmail != null) {
						// Retrieve admin details from the database using Hibernate JPA
						EntityManager entityManager = DatabaseConnection.getEntityManager();
						AdminDao adminDao = new AdminDao(entityManager);
						List<Admin> admins = adminDao.getAdminByEmail(adminEmail);

						if (!admins.isEmpty()) {
							Admin admin = admins.get(0);
					%>
					<div class="container">
						<div class="row">
							<div class="col">
								<p>
									<strong>ID:</strong>
									<%=admin.getId()%></p>
								<p>
									<strong>Name:</strong>
									<%=admin.getName()%></p>
								<p>
									<strong>Email:</strong>
									<%=admin.getEmail()%></p>
							</div>
						</div>
					</div>
					<%
					} else {
					%>
					<p>Error: Admin not found.</p>
					<%
					}
					} else {
					%>
					<p>Error: Admin information not available.</p>
					<%
					}
					%>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Show Profile End -->

	<!-- Home-content Start-->
	<section id="home-content">


		<div class="container text-center mt-4">
			<strong style="color: red; font-size: 2em;"> Welcome <span
				style="color: white; font-size: 2rem; font-style: italic;"> <%=userName%>
			</span>
			</strong>
		</div>

		<!-- Page Content to show no of books and users Start -->

		<div class="content">
			<div class="row mt-4">
				<div class="col-xl col-lg col-md mb-2">
					<div class="card bg-primary">
						<div class="card-body text-center">
							<div class="row">
								<div class="col-6">

									<h2 class="text-center text-white">Total Users</h2>
								</div>
								<div class="col-6 text-center text-white">
									<h3>
										<%
										UserDao userDao = new UserDao();
										out.print(userDao.getUserCount());
										%>
									</h3>
									<p>Users</p>
								</div>
							</div>
						</div>
						<div class="card-footer bg-light text-center">
							<button onclick="showAllUser()" class="btn btn-success">View
								Details</button>
						</div>
					</div>

				</div>

				<%-- Display the update message if available --%>
				<%
				String updateMessage = (String) request.getAttribute("updateMessage");
				%>
				<div class="col-xl">
					<%
					if (updateMessage != null) {
					%>
					<div id="successAlert" class="alert alert-success" role="alert">
						<%=updateMessage%>
					</div>
					<script>
						// JavaScript code to hide the alert after 3000 milliseconds (3 seconds)
						setTimeout(
								function() {
									document.getElementById("successAlert").style.display = "none";
								}, 3000);
					</script>

					<%
					}
					%>
					<%-- Display the message if available --%>
					<%
					String message = (String) request.getSession().getAttribute("Message");
					if (message != null) {
					%>
					<div class="alert alert-success" id="addMessage" role="alert">
						<%=message%>
					</div>
					<script>
						setTimeout(
								function() {
									document.getElementById("addMessage").style.display = "none";
								}, 3000);
					</script>
					<%
					request.getSession().removeAttribute("Message"); // Remove the attribute after displaying
					%>
					<%
					}
					%>

				</div>

				<!-- ----Anoter card--- -->


				<div class="col-xl col-lg col-md mb-2">
					<div class="card bg-secondary">
						<div class="card-body text-center">
							<div class="row">
								<div class="col-6">
									<h2 class="text-center text-white">Total Books</h2>
								</div>
								<div class="col-6 text-cente text-white">
									<h3>
										<%
										BookDao bookDao = new BookDao();
										out.print(bookDao.getBookCount());
										%>
									</h3>
									<p>Books</p>
								</div>
							</div>
						</div>
						<div class="card-footer bg-light text-center">
							<button onclick="showAllBooks()" class="btn btn-success">View
								Details</button>
						</div>
					</div>

				</div>

			</div>


		</div>

		<!-- Page Content to show no of books and users End -->

		<!-- Table to Dispay user/book Start-->

		<div class="container table-container">

			<%@ include file="allUserTable.jsp"%>

		</div>
		<div class="container table-container">

			<%@ include file="AllBookTable.jsp"%>

		</div>

		<!-- Table to Dispay user/book End-->


	</section>
	<!-- Home-content End-->

	<!-- Footer Start-->

	<footer id="site-footer"
		class="sticky-footer mt-4 py-3 bg-dark text-white">
		<div class="container text-center">
			<p>&copy; 2024 EpicLibrary. All rights reserved.</p>
		</div>
	</footer>

	<!-- Footer End-->





	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

	<script>
		function showAllUser() {
			// Toggle the visibility of the user table
			var userTable = document.getElementById("userTable");
			userTable.classList.toggle("hidden");
			toggleStickyFooter();
		}

		function showAllBooks() {
			// Toggle the visibility of the user table
			var bookTable = document.getElementById("bookTable");
			bookTable.classList.toggle("hidden");
			toggleStickyFooter();
		}
	</script>

	<script>
		function redirectToJSP() {
			// Get the input value
			var inputValue = document.getElementById("inputValue").value;

			// Redirect to the JSP page with the input value as a query parameter
			window.location.href = "UpdateUser.jsp?id="
					+ encodeURIComponent(inputValue);
		}

		function redirectToBookJSP() {
			// Get the input value
			var inputValue = document.getElementById("bookID").value;

			// Redirect to the JSP page with the input value as a query parameter
			window.location.href = "UpdateBook.jsp?id="
					+ encodeURIComponent(inputValue);
		}

		function redirectToDeleteUserJSP() {
			// Get the input value
			var userId = document.getElementById("userId").value;

			// Redirect to the JSP page with the input value as a query parameter
			window.location.href = "DeleteUserServlet?id="
					+ encodeURIComponent(userId);
		}
		
		function redirectToDeleteBookJSP() {
			// Get the input value
			var bookId = document.getElementById("bookId_delete").value;

			// Redirect to the JSP page with the input value as a query parameter
			window.location.href = "DeleteBookServlet?id="
					+ encodeURIComponent(bookId);
		}

		// Function to toggle sticky class on the footer
		function toggleStickyFooter() {
			var footer = document.getElementById("site-footer");
			footer.classList.toggle("sticky-footer");
		}
	</script>


	<%
	} else {
	out.print("<h2 class='text-center'> <a href='index.html'>GoTo HomePage</a><h2>");
	}
	%>

</body>

</html>
