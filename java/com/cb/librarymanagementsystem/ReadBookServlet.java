package com.cb.librarymanagementsystem;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/readbookServlet")
public class ReadBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookIdString = request.getParameter("id");

        if (bookIdString != null && !bookIdString.isEmpty()) {
            try {
                Long bookId = Long.parseLong(bookIdString);

                // Retrieve the book details from the database
                Book book = getBookDetails(bookId);

                if (book != null) {
                    // Display the PDF content
                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "inline; filename=" + book.getTitle() + ".pdf");

                    // Retrieve the PDF content from the book object
                    byte[] pdfContent = book.getPdf();

                    // Write the PDF content to the response output stream
                    try (OutputStream out = response.getOutputStream()) {
                        out.write(pdfContent);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Book not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID format");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Book ID parameter is missing");
        }
    }

    private Book getBookDetails(Long bookId) {
        try {
            EntityManager entityManager = DatabaseConnection.getEntityManager();
            Query query = entityManager.createQuery("SELECT b FROM Book b WHERE b.id = :bookId");
            query.setParameter("bookId", bookId);
            Book book = (Book) query.getSingleResult();
            return book;
        } catch (NoResultException e) {
            // Handle the case where no book is found
            System.out.println("No book found with ID: " + bookId);
            return null;
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            return null;
        }
    }

}
