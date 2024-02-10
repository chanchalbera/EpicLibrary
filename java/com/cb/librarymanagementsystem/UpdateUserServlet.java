package com.cb.librarymanagementsystem;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDao dao = new UserDao();
		Long id =Long.parseLong(req.getParameter("userId"));
		String name = req.getParameter("userName");
		String email = req.getParameter("userEmail");
		String mobile = req.getParameter("userMobile");
		int age =Integer.parseInt(req.getParameter("userAge"));
		User user = dao.getUser(id);
		if(user!=null) {
			
			user.setAge(age);
			user.setEmail(email);
			user.setMobileNo(mobile);
			user.setName(name);
			dao.updateUser(user);
			
			req.setAttribute("updateMessage", "User updated Successfully");
		}
		else
			req.setAttribute("updateMessage", "User not updated");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("AdminPanal.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
	

}
