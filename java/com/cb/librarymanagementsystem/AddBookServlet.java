package com.cb.librarymanagementsystem;

import java.io.IOException;
import java.io.InputStream;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/AddBookServlet")
@MultipartConfig
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            EntityManager em = DatabaseConnection.getEntityManager();

            // Get form data
            String title = request.getParameter("title");
            String authorName = request.getParameter("author");
            String genre = request.getParameter("genre");
            System.out.println(request.getParameter("page"));
            int numberOfPages = Integer.parseInt(request.getParameter("page"));
            System.out.println(numberOfPages);
            double price = Double.parseDouble(request.getParameter("price"));

            // Process image file
            Part imagePart = request.getPart("image");
            byte[] imageBytes = readBytesFromPart(imagePart);

            // Process PDF file
            Part pdfPart = request.getPart("pdf");
            byte[] pdfBytes = readBytesFromPart(pdfPart);

            // Create Book object
            Book book = new Book();
            book.setTitle(title);
            book.setAuthorName(authorName);
            book.setGenre(genre);
            book.setImage(imageBytes);
            book.setPdf(pdfBytes);
            book.setNumberOfPages(numberOfPages);
            book.setPrice(price);

            // Save the book to the database
            BookDao bookDao = new BookDao();
            bookDao.saveBook(book);

            // Close EntityManager and EntityManagerFactory
            em.close();

            request.getSession().setAttribute("Message", " Book "+title +" saved successfully");
			response.sendRedirect("AdminPanal.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            request.getSession().setAttribute("Message", "Book not saved");
			response.sendRedirect("AdminPanal.jsp");
        }
    }

    // Helper method to read bytes from a Part
    private byte[] readBytesFromPart(Part part) throws IOException {
        InputStream input = part.getInputStream();
        byte[] bytes = new byte[(int) part.getSize()];
        input.read(bytes);
        return bytes;
    }
}
