<%@ page import="com.cb.librarymanagementsystem.BookDao"%>
<%@ page import="com.cb.librarymanagementsystem.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Update Book Details</title>
<!-- Bootstrap CSS link -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Custom styles or overrides go here */
body {
	background-color: #f8f9fa; /* Light gray background color */
}

.container {
	margin-top: 50px;
}
</style>
</head>
<body>


	<%
	// Get the book ID from the request parameter
	Long bookId = Long.parseLong(request.getParameter("id"));
	System.out.print(bookId);

	// Retrieve the book details from the database using BookDao
	BookDao bookDao = new BookDao();
	Book book = bookDao.getBookById(bookId);
	if (book != null) {
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header bg-info text-white">
						<h2 class="text-center">Update Book Details</h2>
					</div>
					<div class="card-body">
						<form action="UpdateBookServlet" method="post">
							<input type="hidden" name="id" value="<%=book.getId()%>">

							<div class="form-group">
								<label for="title">Title:</label> <input type="text"
									class="form-control" id="title" name="title"
									value="<%=book.getTitle()%>" required>
							</div>

							<div class="form-group">
								<label for="authorName">Author Name:</label> <input type="text"
									class="form-control" id="authorName" name="authorName"
									value="<%=book.getAuthorName()%>" required>
							</div>

							<div class="form-group">
								<label for="genre">Genre:</label> <input type="text"
									class="form-control" id="genre" name="genre"
									value="<%=book.getGenre()%>">
							</div>

							<div class="form-group">
								<label for="price">Price:</label> <input type="number"
									class="form-control" id="price" name="price"
									value="<%=book.getPrice()%>" required>
							</div>

							<div class="form-group">
								<label for="numberOfPages">Number of Pages:</label> <input
									type="number" class="form-control" id="numberOfPages"
									name="numberOfPages" value="<%=book.getNumberOfPages()%>"
									required>
							</div>

							<!-- Additional fields for image and pdf if needed -->
							<!-- <div class="form-group">
                            <label for="image">Image:</label>
                            <input type="file" class="form-control-file" id="image" name="image">
                        </div>

                        <div class="form-group">
                            <label for="pdf">PDF:</label>
                            <input type="file" class="form-control-file" id="pdf" name="pdf">
                        </div> -->
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
											document
													.getElementById("addMessage").style.display = "none";
										}, 3000);
							</script>
							<%
							request.getSession().removeAttribute("Message"); // Remove the attribute after displaying
							%>
							<%
							}
							%>

							<div class="form-group text-center">
								<button type="submit" class="btn btn-success mt-4">Update
									Now</button>
								<a href="AdminPanal.jsp" class="btn btn-secondary mt-4 ">Cancel</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	request.getSession().setAttribute("Message", "No Book found with ID: " + bookId);
	response.sendRedirect("AdminPanal.jsp");
	}
	%>

	<!-- Bootstrap JS and Popper.js scripts -->
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
</body>
</html>
