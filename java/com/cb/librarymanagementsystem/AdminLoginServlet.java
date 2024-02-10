package com.cb.librarymanagementsystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bytebuddy.asm.Advice.Return;

@WebServlet("/AdminLogIn")
public class AdminLoginServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("username");
		String password = req.getParameter("password");
		resp.setContentType("text/html");

		EntityManager manager = DatabaseConnection.getEntityManager();
		Query query = manager.createQuery("select a from Admin a where a.email = ?1 and a.password = ?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		List<Admin> admin = query.getResultList();
		if (admin.size()>0) {
			// Successful login
			String name = admin.get(0).getName();
			name = name.replace(' ', '_');
			System.out.println("Welcome " + name);

			// Store admin data in cookies
			Cookie emailCookie = new Cookie("adminEmail", email);
			Cookie nameCookie = new Cookie("adminName", name);

			// Set cookie expiration (for example, 1 day)
			emailCookie.setMaxAge(24 * 60 * 60);
			nameCookie.setMaxAge(24 * 60 * 60);

			resp.addCookie(emailCookie);
			resp.addCookie(nameCookie);

			// Redirect to AdminPanal.jsp
			resp.sendRedirect("AdminPanal.jsp");
		} else {
			// Invalid login
			req.setAttribute("loginMessage",
					"<p style='color:red; text-align:center'> Sorry, your password was incorrect. Please double-check your password..<p>");
			RequestDispatcher dispatcher = req.getRequestDispatcher("adminLogin.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
