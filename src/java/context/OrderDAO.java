/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import Model.Order;
import Model.OrderItem;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/* @author ACER */
public class OrderDAO {

    public OrderDAO() {
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

    public ResultSet getData(String sql) {
        rs = null;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("getData error:" + e.getMessage());
        }
        return rs;
    }

    public int addOrderGetId(int id, String sorderdate, String shipper) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "insert [Order] ([userid],[orderdate],[shipper],[status]) values"
                    + "(" + id + ", '" + sorderdate + "','" + (shipper.equals("fast") ? "Fast Delivery" : "Free Delivery") + "', 'Wait')";
            stm.executeUpdate(sql);
            rs = stm.executeQuery("select top 1 * from [Order] where userid =" + id + " order by [id] desc");
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("addOrder error:" + e.getMessage());
        }
        return -1;
    }

    public int addOrderItem(OrderItem item) {
        int n = 0;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "insert [OrderItem] ([orderid],[bookid],[quantity],[price]) values"
                    + "(" + item.getOrderid() + ", '" + item.getBookid() + "', " + item.getQuantity() + ", " + item.getPrice() + ")";
            n = stm.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("addOrderItem error:" + e.getMessage());
        }
        return n;
    }

    public ArrayList<Order> getUserOrders(int userid) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from [Order] where [userid] = " + userid;
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                int id = rs.getInt(1);
                String orderdate = f.format(rs.getDate(3));
                float subtotal = rs.getFloat(4);
                String shipper = rs.getString(5);
                float total = rs.getFloat(6);
                String status = rs.getString(7);
                list.add(new Order(id, userid, orderdate, subtotal, shipper, total, status));
            }
        } catch (Exception e) {
            System.out.println("getSimilar Error:" + e.getMessage());
        }
        return list;
    }

    public int addCustomer(int orderid, int userid, String name, String email, String phone, String address) {
        int n=0;
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "insert [Customer] ([orderid], [userid], [name], [email], [phone], [address]) "
                    + "values ("+orderid+", "+userid+", N'"+name+"', N'"+email+"', N'"+phone+"', N'"+address+"')";
            n=stm.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println("getSimilar Error:" + e.getMessage());
        }
        return n;
    }
}
