package com.cb.librarymanagementsystem;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SaveUserServlet")
public class SaveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mobile = request.getParameter("mobile");

		// Create a new user
		try {

			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setAge(age);
			user.setEmail(email);
			user.setPassword(password);
			user.setMobileNo(mobile);
			UserDao dao = new UserDao();
			dao.saveUser(user);

			request.getSession().setAttribute("Message", "User " + name + " saved successfully");
			response.sendRedirect("AdminPanal.jsp");

		} catch (Exception e) {
			request.getSession().setAttribute("Message", "Some issue found. Please try once again.");
			response.sendRedirect("AdminPanal.jsp");
		}
	}

}
