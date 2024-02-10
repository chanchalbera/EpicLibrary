package com.cb.librarymanagementsystem;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve cookies from the request
		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			// Iterate over cookies and delete them
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0); // Set the cookie's max age to 0 to delete it
				resp.addCookie(cookie); // Add the modified cookie to the response
			}
		}

		// Set a message attribute for adminLogin.jsp
		req.setAttribute("logoutMessage", "You have been successfully logged out.");

		resp.setHeader("Pragma","no-cache");

		resp.setHeader("Cache-Control","no-store");

		resp.setHeader("Expires","0");

		resp.setDateHeader("Expires",-1);

		// Redirect to the login page
		RequestDispatcher dispatcher = req.getRequestDispatcher("adminLogin.jsp");
		dispatcher.forward(req, resp);
	}
}
