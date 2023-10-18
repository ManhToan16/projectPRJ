/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import Model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.stream.IntStream;

/**
 *
 * @author ACER
 */
public class UserDAO {

    public UserDAO() {
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

    public boolean checkLogin(String username, String password) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from User where username='" + username + "' and password='" + password + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Login Error:" + e.getMessage());
        }
        return false;
    }

    public User getUser(String key, String pass) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "Select * from [User] where (username='" + key + "' OR email='" + key + "') AND password='" + pass + "'";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int userid = rs.getInt(1);
                String name = rs.getString(2);
                String gender = rs.getBoolean(3) ? "Male" : "Female";
                SimpleDateFormat f = new SimpleDateFormat("dd/mm/yyyy");
                String dob = f.format(rs.getDate(4));
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String address = rs.getString(7);
                String username = rs.getString(8);
                boolean is_super = rs.getBoolean(10);
                User u = new User(userid, name, gender, dob, email, phone, address, username, pass, is_super);
                return u;
            }
        } catch (Exception e) {
            System.out.println("getUser Error:" + e.getMessage());
        }
        return null;
    }

    public String getNameByAccount(String username) {
        String name = "";
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from User where username='" + username + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                name = rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println("getNameByAccount Error:" + e.getMessage());
        }
        return name;
    }

    public boolean checkAccount(String username) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from User where username='" + username + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkAccount Error:" + e.getMessage());
        }
        return false;
    }

    public String generatePass() {
        int data[] = IntStream.concat(IntStream.rangeClosed('0', '9'),
                IntStream.concat(IntStream.rangeClosed('A', 'Z'),
                        IntStream.rangeClosed('a', 'z'))).toArray();
        char index[] = new char[10];

        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            index[i] = (char) data[r.nextInt(data.length)];
        }
        return new String(index);
    }

    public boolean checkAccDOB(String username, String dob) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from User where username='" + username + "' and dateofbirth='" + dob + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkAccDOB Error:" + e.getMessage());
        }
        return false;
    }

    public void updatePass(String username, String newPass) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strUpdate = "update User set password='" + newPass + "' where username='" + username + "'";
            stm.execute(strUpdate);
        } catch (Exception e) {
            System.out.println("updatePass Error:" + e.getMessage());
        }
    }

    public boolean checkDupEmail(String email) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from [User] where email='" + email + "'";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("checkAccDOB Error:" + e.getMessage());
        }
        return true;
    }

    public boolean checkDupUsername(String key) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from [User] where username='" + key + "'";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("checkAccDOB Error:" + e.getMessage());
        }
        return true;
    }

    public void insertUser(User user) {
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "insert [User] ([fullname], [email],[username], [password])"
                    + "  values (N'"+user.getName()+"',"
                    + "N'"+user.getEmail()+"',"
                    + "N'"+user.getUsername()+"',"
                    + "N'"+user.getPassword()+"')";
            stm.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println("updatePass Error:" + e.getMessage());
        }
    }
}
