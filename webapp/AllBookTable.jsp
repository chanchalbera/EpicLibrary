<%@ page import="java.util.List"%>
<%@ page import="com.cb.librarymanagementsystem.Book"%>
<%@ page import="javax.persistence.Query"%>
<%@ page import="javax.persistence.EntityManager"%>
<%@ page import="java.util.Base64"%>
<%@page import="com.cb.librarymanagementsystem.DatabaseConnection"%>

<%
EntityManager bookManager = DatabaseConnection.getEntityManager();
Query bookQuery = bookManager.createQuery("select b from Book b");
List<Book> bookList = bookQuery.getResultList();
%>

<div id="bookTable" class="hidden mt-2">
	<h2 class="text-center text-white bg-primary p-3">All Books</h2>

	<div class="table-container">
		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<thead class="table-dark">
					<tr>
						<th class="text-center">ID</th>
						<th class="text-center">Image</th>
						<th class="text-center">Title</th>
						<th class="text-center">Author</th>
						<th class="text-center">Genre</th>
						<th class="text-center">Price</th>
						<th class="text-center">Pages</th>
						<th class="text-center">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
				for (int i = 0; i < bookList.size(); i++) {
					Book bookItem = bookList.get(i);
					String rowClass = (i % 2 == 0) ? "table-info" : "table-secondary";
					String encodedImage = Base64.getEncoder().encodeToString(bookItem.getImage());
				%>
					<tr class="<%=rowClass%>">
						<td class="text-center"><%=bookItem.getId()%></td>
						<td class="text-center"><img
							src="data:image/jpeg;base64,<%=encodedImage%>" alt="Book Image"
							class="book-image img-thumbnail"
							style="height: 40px; width: 50px"></td>
						<td class="text-center"><%=bookItem.getTitle()%></td>
						<td class="text-center"><%=bookItem.getAuthorName()%></td>
						<td class="text-center"><%=bookItem.getGenre()%></td>
						<td class="text-center"><%=bookItem.getPrice()%></td>
						<td class="text-center"><%=bookItem.getNumberOfPages()%></td>
						<td class="text-center"><a
							href="<%=request.getContextPath()%>/readbookServlet?id=<%=bookItem.getId()%>"
							class="btn btn-primary">Read Book</a></td>
					</tr>
					<%
				}
				%>
				</tbody>
			</table>
		</div>
	</div>
</div>
