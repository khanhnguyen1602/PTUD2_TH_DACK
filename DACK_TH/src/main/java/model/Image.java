/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phuongkhanh
 */
public class Image implements Serializable{
    private int id;
    private int idProduct;
    private String link;
    private List<Image> listImg = new ArrayList<>();

    public Image() {
    }

    public List<Image> getListImg() {
        return listImg;
    }

    public void setListImg(List<Image> listImg) {
        this.listImg = listImg;
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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    
}
