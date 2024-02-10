package com.cb.librarymanagementsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

@WebServlet("/VerifyAdmin")
public class VerifyAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check if cookies are present
        Cookie[] cookies = req.getCookies();
        boolean adminCookiesPresent = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("adminEmail") || cookie.getName().equals("adminName")) {
                    adminCookiesPresent = true;
                    break;
                }
            }
        }

        if (adminCookiesPresent) {
        	// Admin is not logged in, forward to AdminPanal.jsp
        	resp.sendRedirect("AdminPanal.jsp");
        } else {
            // Admin is not logged in, forward to adminLogin.jsp
        	resp.sendRedirect("adminLogin.jsp");
        }
    }
}
