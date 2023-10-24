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
import java.util.ArrayList;

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
        int bookid = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        CartDAO cd = new CartDAO();
        User user = (User) session.getAttribute("user");
        if(user!=null){
            cd.addToCart(user.getId(), bookid, quantity);
            response.sendRedirect("./Book?id="+bookid);
        }else{
            cd.addToCart(bookid, quantity);
            response.sendRedirect("./Book?id="+bookid);
        }
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
