/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Model;

/* @author ACER */
public class Cart {
    int id;
    int userid;
    int bookid;
    int quantity;

    public Cart(int id, int userid, int bookid, int quantity) {
        this.id = id;
        this.userid = userid;
        this.bookid = bookid;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public int getUserid() {
        return userid;
    }

    public int getBookid() {
        return bookid;
    }

    public int getQuantity() {
        return quantity;
    }
    
    
}
