package com.cb.librarymanagementsystem;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

	UserDao dao = new UserDao();
	EntityManager entityManager = DatabaseConnection.getEntityManager();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			Long id = Long.parseLong(req.getParameter("id"));
			if (dao.deleteUser(id)) {
				req.getSession().setAttribute("Message", "User with ID " + id + " deleted successfully");
				resp.sendRedirect("AdminPanal.jsp");
			} else {
				req.getSession().setAttribute("Message", "No User Found");
				resp.sendRedirect("AdminPanal.jsp");
			}
		}

		finally {
			if (entityManager != null) {
				entityManager.close();
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
