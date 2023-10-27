/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import Model.Book;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/* @author ACER */
public class BookDAO {

    public BookDAO() {
        connectDB();
    }

    Connection cnn; // ket noi db
    Statement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext().getConnection());
            System.out.println("Connect successfully!");
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }
    
    public ArrayList<Book> getBooks(){
        ArrayList<Book> list = new ArrayList<>();
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String sql="select * from [Book]";
            rs = stm.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                int type =rs.getInt(4);
                int quantity = rs.getInt(5);
                float price = rs.getFloat(6);
                boolean issale = rs.getBoolean(7);
                int discount = rs.getInt(8);
                String image = rs.getString(9);
                String description= rs.getString(10);
                list.add(new Book(id, title, author, type, quantity, price, issale, discount, image, description));
            }
        }catch(Exception e){
            System.out.println("getlist Error:"+e.getMessage());
        }
        return list;
    }
    
    public void editBook(int id, String title, String author,int categoryid, int quantity,float price, boolean issale, int discount, String image, String description){}
    
    public void addBook(String title, String author,int categoryid, int quantity,float price, boolean issale, int discount, String image, String description){}
    
    public void searchBookByName(String name){} 

    public Book getBookById(int bookid) {
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String sql="select * from [Book] where [id] = "+bookid;
            rs = stm.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                int type =rs.getInt(4);
                int quantity = rs.getInt(5);
                float price = rs.getFloat(6);
                boolean issale = rs.getBoolean(7);
                int discount = rs.getInt(8);
                String image = rs.getString(9);
                String description= rs.getString(10);
                return new Book(id, title, author, type, quantity, price, issale, discount, image, description);
            }
        }catch(Exception e){
            System.out.println("getBookbyID Error:"+e.getMessage());
        }
        return null;
    }

    public ArrayList<Book> getSimilarBooks(int bookid, int categoryid) {
        ArrayList<Book> list = new ArrayList<>();
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String sql="select * from [Book] where [categoryid] = "+categoryid+" AND [id] != "+bookid;
            rs = stm.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                int type =rs.getInt(4);
                int quantity = rs.getInt(5);
                float price = rs.getFloat(6);
                boolean issale = rs.getBoolean(7);
                int discount = rs.getInt(8);
                String image = rs.getString(9);
                String description= rs.getString(10);
                list.add(new Book(id, title, author, type, quantity, price, issale, discount, image, description));
            }
        }catch(Exception e){
            System.out.println("getSimilar Error:"+e.getMessage());
        }
        return list;
    }

    public int getNumberBook() {
        try{
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select count([id]) from [Book]";
            rs = stm.executeQuery(sql);
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){
            System.out.println("getNumberBook Error");
        }
        return -1;
    }

    public ArrayList<Book> getFeaturedBooks() {
        ArrayList<Book> list = new ArrayList<>();
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String sql="select top 3 * from [Book] where [is_sale] = 1";
            rs = stm.executeQuery(sql);
            while(rs.next()){
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                int type =rs.getInt(4);
                int quantity = rs.getInt(5);
                float price = rs.getFloat(6);
                boolean issale = rs.getBoolean(7);
                int discount = rs.getInt(8);
                String image = rs.getString(9);
                String description= rs.getString(10);
                list.add(new Book(id, title, author, type, quantity, price, issale, discount, image, description));
            }
        }catch(Exception e){
            System.out.println("getlist Error:"+e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Book> getByPage(ArrayList<Book> list, int start, int end) {
        ArrayList<Book> listpage = new ArrayList<>();
        
        for(int i=start; i<end; i++){
            listpage.add(list.get(i));
            }
        return listpage;
    }
}
