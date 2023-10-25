/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Book;
import Model.User;
import context.BookDAO;
import context.CartDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/* @author ACER */
public class BookController extends HttpServlet {

    // <editor-fold defaultstate="" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookid = Integer.parseInt(request.getParameter("id"));
        BookDAO bd = new BookDAO();
        Book book = bd.getBookById(bookid);
        ArrayList<Book> likes = bd.getSimilarBooks(bookid, book.getCategoryid());
        request.setAttribute("book", book);
        request.setAttribute("likes", likes);
        request.getRequestDispatcher("/views/book/book-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String bookID = request.getParameter("id");

        HttpSession session = request.getSession();
        java.util.Enumeration em = session.getAttributeNames();
        CartDAO cd = new CartDAO();

        Book book = (Book) session.getAttribute(bookID);
        if (book == null) {
            ResultSet rs = cd.getData("Select * from [Book] where [id]='" + bookID + "'");
            try {
                if (rs.next()) {
                    String title = rs.getString(2);
                    String author = rs.getString(3);
                    float price = rs.getFloat(6);
                    boolean issale = rs.getBoolean(7);
                    int discount = rs.getInt(8);
                    String image = rs.getString(9);
                    book = new Book(Integer.parseInt(bookID), title, author, quantity, price, issale, discount, image);
                }
            } catch (SQLException ex) {
                Logger.getLogger(BookController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            book.setQuantity(book.getQuantity() + quantity);
        }
        session.setAttribute(bookID, book);
        response.sendRedirect("Book?id=" + bookID);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.forward(request, response);
    }
}
