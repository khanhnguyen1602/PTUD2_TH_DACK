/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phuongkhanh
 */
public class Discount implements Serializable{
    private int id;
    private int idProduct;
    private int discountValue;
    private Date dateBegin;
    private Date dateEnd;
    private List<Discount> listDiscount = new ArrayList<>();

    public List<Discount> getListDiscount() {
        return listDiscount;
    }

    public void setListDiscount(List<Discount> listDiscount) {
        this.listDiscount = listDiscount;
    }

    public Discount() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(int discountValue) {
        this.discountValue = discountValue;
    }

    public Date getDateBegin() {
        return dateBegin;
    }

    public void setDateBegin(Date dateBegin) {
        this.dateBegin = dateBegin;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }
    
    
}
