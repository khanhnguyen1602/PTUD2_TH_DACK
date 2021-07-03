/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Cart;
import model.Discount;
import model.Image;
import model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author phuongkhanh
 */
public class CartDAO {
     JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    @Autowired
    ProductDAO daoPro;
    
    public List<Cart> LayDanhSachCartCuaUser(int idUser) {
        try{
        return template.query(String.format("select * from cart where idUser=%d", idUser), new RowMapper<Cart>() {
            public Cart mapRow(ResultSet rs, int row) throws SQLException {
               Cart c = new Cart();
               c.setId(rs.getInt(1));
               c.setIdUser(rs.getInt(2));
               c.setIdProduct(rs.getInt(3));
               c.setQuantity(c.getQuantity() + 1);
               
               // ket voi bang product
               Product pro = daoPro.GetProduct(rs.getInt(3));
               c.setProduct(pro);
               
               // ket bang image
                List<Image> imgs = daoPro.LayImage(rs.getInt(3));
                c.getProduct().getImgs().setListImg(imgs);
               
               // ket voi bang discount
                Discount discount = daoPro.GetDiscount(rs.getInt(3));
               c.getProduct().setDiscount(discount);
               
                return c;
            }
        });
        } catch(EmptyResultDataAccessException e)
        {
            return null;
        }
    }
}
