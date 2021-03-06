/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Discount;
import model.Product;
import model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
/**
 *
 * @author phuongkhanh
 */
public class ProductDAO {
    JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public int UpdateTotalSold(int idPro, int quantity)
    {
        String sql = String.format("update product set totalSold=totalSold+%d where id=%d", quantity, idPro);
        return template.update(sql);
    }
    
    public Product GetProduct(int idPro) {
        try{
        String sql = "select * from product where id=?";
        return template.queryForObject(sql, new Object[]{idPro}, new BeanPropertyRowMapper<Product>(Product.class));
        } catch(EmptyResultDataAccessException e)
        {
            return null;
        }
        
    }
    
    public Discount GetDiscount(int idPro) {
        try{
        String sql = "select * from discount where idProduct=?";
        return template.queryForObject(sql, new Object[]{idPro}, new BeanPropertyRowMapper<Discount>(Discount.class));
        } catch(EmptyResultDataAccessException e)
        {
            return null;
        }
        
    }
    
    public List<Product> LayDanhSachProductsMoiNhat() {
        return template.query("select * from Product where deleted=0 order by id desc limit 15", new RowMapper<Product>() {
            public Product mapRow(ResultSet rs, int row) throws SQLException {
                Product pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setIdCategory(rs.getInt(2));
                pro.setProductName(rs.getNString(3));
                pro.setPrice(rs.getInt(4));
                pro.setDescription(rs.getNString(5));
                pro.setTotalSold(rs.getInt(6));
                pro.setDateAdd(rs.getTimestamp(7));
                pro.setDeleted(rs.getBoolean(8));
                
                // l???y images 
                List<Image> listImg = LayImage(rs.getInt(1));
                pro.getImgs().setListImg(listImg);
                
                return pro;
            }
        });
    }
    
    public List<Product> LayDanhSachProductsBanChayNhat() {
        return template.query("select * from Product where deleted=0 order by totalSold desc limit 15", new RowMapper<Product>() {
            public Product mapRow(ResultSet rs, int row) throws SQLException {
                Product pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setIdCategory(rs.getInt(2));
                pro.setProductName(rs.getNString(3));
                pro.setPrice(rs.getInt(4));
                pro.setDescription(rs.getNString(5));
                pro.setTotalSold(rs.getInt(6));
                pro.setDateAdd(rs.getTimestamp(7));
                pro.setDeleted(rs.getBoolean(8));
                
                // l???y images 
                List<Image> listImg = LayImage(rs.getInt(1));
                pro.getImgs().setListImg(listImg);
                
                return pro;
            }
        });
    }
    
    public List<Product> LayDanhSachProducts() {
        return template.query("select * from Product where deleted=0", new RowMapper<Product>() {
            public Product mapRow(ResultSet rs, int row) throws SQLException {
                Product pro = new Product();
                pro.setId(rs.getInt(1));
                pro.setIdCategory(rs.getInt(2));
                pro.setProductName(rs.getNString(3));
                pro.setPrice(rs.getInt(4));
                pro.setDescription(rs.getNString(5));
                pro.setTotalSold(rs.getInt(6));
                pro.setDateAdd(rs.getTimestamp(7));
                pro.setDeleted(rs.getBoolean(8));
                
                // l???y images 
                List<Image> listImg = LayImage(rs.getInt(1));
                pro.getImgs().setListImg(listImg);
                
                return pro;
            }
        });
    }
    
    public List<Image> LayImage(int idProduct) {
        return template.query(String.format("select * from image where idProduct=%d", idProduct), new RowMapper<Image>() {
            public Image mapRow(ResultSet rs, int row) throws SQLException {
                Image img = new Image();
                img.setId(rs.getInt(1));
                img.setIdProduct(rs.getInt(2));
                img.setLink(rs.getString(3));
                return img;
            }
        });
    }
    
    public int TinhTien(int idPro)
    {
        Product product = GetProduct(idPro);
        Discount discount = GetDiscount(idPro);
        long millis=System.currentTimeMillis();   
        java.sql.Date dateNow =new java.sql.Date(millis);  //ngay hien tai
        int _price = 1;
        if(discount == null)
        {
            return product.getPrice();
        }
        else
        {
            // neu con han khuyen mai
            if(discount.getDateBegin().compareTo(dateNow)<=0 && discount.getDateEnd().compareTo(dateNow)>=0)
            {
                _price = product.getPrice() - (product.getPrice()*discount.getDiscountValue()/100);
            }
            else
            {
                _price = product.getPrice();
            }
        }
        return _price;
    }
}
