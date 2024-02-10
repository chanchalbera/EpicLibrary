<%@page import="com.cb.librarymanagementsystem.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cb.librarymanagementsystem.User"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.persistence.Query"%>
<%@ page import="javax.persistence.EntityManager"%>

<%
EntityManager manager = DatabaseConnection.getEntityManager();
Query query = manager.createQuery("select u from User u");
List<User> users = query.getResultList();
%>
<div id="userTable" class="hidden mt-2">
	<h2 class="text-center text-white bg-primary p-3">All Users</h2>

	<div class="table-container">
		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Age</th>
						<th>Mobile No</th>
					</tr>
				</thead>
				<tbody>
					<%
			for (int i = 0; i < users.size(); i++) {
				User user = users.get(i);
				String rowClass = (i % 2 == 0) ? "table-info" : "table-secondary";
			%>
					<tr class="<%=rowClass%>">
						<td><%=user.getId()%></td>
						<td><%=user.getName()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getAge()%></td>
						<td><%=user.getMobileNo()%></td>
					</tr>
					<%
			}
			%>
				</tbody>
			</table>
		</div>
	</div>
</div>
