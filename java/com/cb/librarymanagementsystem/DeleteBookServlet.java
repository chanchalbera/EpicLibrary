package com.cb.librarymanagementsystem;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the book ID from the request parameter
        Long bookId = Long.parseLong(request.getParameter("id"));

        // Instantiate BookDao
        BookDao bookDao = new BookDao();

        try {
            Book book = bookDao.getBookById(bookId);

            if (book != null) {
            	
                bookDao.deleteBook(book);;

                request.getSession().setAttribute("Message", "Book deleted successfully");
                response.sendRedirect("AdminPanal.jsp");

            } else {
            	request.getSession().setAttribute("Message", "Book not found");
                response.sendRedirect("AdminPanal.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("Message", "Error deleting book");
            response.sendRedirect("AdminPanal.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

