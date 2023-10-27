/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Book;
import Model.Category;
import context.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/* @author ACER */
public class BookManager extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        String bid = request.getParameter("bid");
        BookDAO dao = new BookDAO();
        if (service == null) {
            service = "control panel";
        }
        switch (service) {
            case "add":
                request.getRequestDispatcher("/admin/add.jsp").forward(request, response);
                break;
            case "edit":
                request.getRequestDispatcher("/admin/edit.jsp").forward(request, response);
                break;
            case "del":
                response.sendRedirect("Category");
                break;
            default:
                ArrayList<Book> books = dao.getBooks();
                String xpage = request.getParameter("xpage");
                int page;
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int size = books.size();
                int numPage = (size % 5 == 0) ? (size / 5) : (size / 5 + 1);
                int start = (page - 1) * 5;
                int end = Math.min(size, start + 5);
                ArrayList<Book> listpage = dao.getByPage(books, start, end);
                request.setAttribute("xpage",page);
                request.setAttribute("numPage", numPage);
                request.setAttribute("books", listpage);
                request.getRequestDispatcher("/admin/bookmanager.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
