/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.stream.IntStream;

/**
 *
 * @author ACER
 */
public class UserDAO {
    
    public UserDAO(){
        connectDB();
    }
    
    Connection cnn; // ket noi db
    Statement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu
    public boolean checkLogin(String acc, String pass){
        // return "admin".equalsIgnoreCase(account) && "123".equals(password);
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String strSelect="select * from tblUser where account='"+acc+"' and pass='"+pass+"'";
            rs = stm.executeQuery(strSelect);
            while(rs.next()){
                return true;
            }
        }catch(Exception e){
            System.out.println("Login Error:"+e.getMessage());
        }
        return false;
    }
    
    private void connectDB() {
        try{
            cnn=(new DBContext().getConnection());
            System.out.println("Connect successfully!");
        } catch (Exception e){
            System.out.println("Connect error:"+e.getMessage());
        }
    }

    public String getNameByAccount(String acc) {
        String name="";
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String strSelect="select * from tblUser where account='"+acc+"'";
            rs = stm.executeQuery(strSelect);
            while(rs.next()){
                name = rs.getString(3);
            }
        }catch(Exception e){
            System.out.println("getNameByAccount Error:"+e.getMessage());
        }
        return name;
    }

    public boolean checkAccount(String acc) {
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String strSelect="select * from tblUser where account='"+acc+"'";
            rs = stm.executeQuery(strSelect);
            while(rs.next()){
                return true;
            }
        }catch(Exception e){
            System.out.println("checkAccount Error:"+e.getMessage());
        }
        return false;
    }
    
    public String generatePass(){
        int data[]=IntStream.concat(IntStream.rangeClosed('0', '9'), 
                IntStream.concat(IntStream.rangeClosed('A', 'Z'),
                        IntStream.rangeClosed('a', 'z'))).toArray();
        char index[] =new char[10];
        
        Random r = new Random();
        for(int i=0;i<10;i++){
            index[i]=(char)data[r.nextInt(data.length)];
        }
        return new String(index);
    }

    public boolean checkAccDOB(String acc, String dob) {
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String strSelect="select * from tblUser where account='"+acc+"' and dateofbirth='"+dob+"'";
            rs = stm.executeQuery(strSelect);
            while(rs.next()){
                return true;
            }
        }catch(Exception e){
            System.out.println("checkAccDOB Error:"+e.getMessage());
        }
        return false;
    }

    public void updatePass(String acc, String newPass) {
        try{
            stm= cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            String strUpdate="update tblUser set pass='"+newPass+"' where account='"+acc+"'";
            stm.execute(strUpdate);
        }catch(Exception e){
            System.out.println("updatePass Error:"+e.getMessage());
        }
    }
    
}
