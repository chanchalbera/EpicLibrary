package com.cb.librarymanagementsystem;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the book details from the form parameters
            Long id = Long.parseLong(request.getParameter("id"));
            String title = request.getParameter("title");
            String authorName = request.getParameter("authorName");
            String genre = request.getParameter("genre");
            double price = Double.parseDouble(request.getParameter("price"));
            int numberOfPages = Integer.parseInt(request.getParameter("numberOfPages"));

            // Additional fields for image and pdf if needed
            // Part imagePart = request.getPart("image");
            // InputStream imageInputStream = imagePart.getInputStream();
            // byte[] imageBytes = IOUtils.toByteArray(imageInputStream);

            // Part pdfPart = request.getPart("pdf");
            // InputStream pdfInputStream = pdfPart.getInputStream();
            // byte[] pdfBytes = IOUtils.toByteArray(pdfInputStream);

            // Create a new book
            Book book = new Book();
            book.setId(id);
            book.setTitle(title);
            book.setAuthorName(authorName);
            book.setGenre(genre);
            book.setPrice(price);
            book.setNumberOfPages(numberOfPages);

            // Set image and pdf if needed
            // book.setImage(imageBytes);
            // book.setPdf(pdfBytes);

            // Update the book in the database
            BookDao bookDao = new BookDao();
            bookDao.updateBook(book);

            // Set a success message and redirect to a confirmation page
            request.getSession().setAttribute("Message", "Book " + title + " updated successfully");
            response.sendRedirect("AdminPanal.jsp");
        } catch (Exception e) {
            // Set an error message and redirect back to the update form
            request.getSession().setAttribute("Message", "Some issue found. Please try once again.");
            response.sendRedirect("UpdateBook.jsp?id=" + request.getParameter("id"));
        }
    }
}
