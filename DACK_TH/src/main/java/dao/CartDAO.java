/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Cart;
import model.Discount;
import model.Image;
import model.Product;
import model.SaleOrder;
import model.SaleOrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

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
               c.setQuantity(rs.getInt(4));
               
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
    
    public int AddCart(Cart c)
    {
        String sql = String.format("insert into cart (idUser, idProduct, quantity) values (%d,%d,%d)", c.getIdUser(), c.getIdProduct(), c.getQuantity());
        return template.update(sql);
    }
    
    public Cart FindCart(int idUser,int idPro) {
        try{
        String sql = "select * from cart where idUser=? and idProduct=?";
        return template.queryForObject(sql, new Object[]{idUser,idPro}, new BeanPropertyRowMapper<Cart>(Cart.class));
        } catch(EmptyResultDataAccessException e)
        {
            return null;
        }
        
    }
    
    public int UpdateQuantity(int quantity, int idCart)
    {
        String sql = String.format("update cart set quantity=%d where id=%d", quantity, idCart);
        return template.update(sql);
    }
    
    public int XoaCart(int id)
    {
        String sql = String.format("delete from cart where id=%d", id);
        return template.update(sql);
    }
    
    public int XoaCartByIdUser(int idUser)
    {
        String sql = String.format("delete from cart where idUser=%d", idUser);
        return template.update(sql);
    }
    
    public int AddSaleOrderdetail(SaleOrderDetail detail)
    {
        String sql = String.format("insert into saleorderdetail(idOrder, idProduct, quantity, price) values (%d,%d,%d,%d)", 
                detail.getIdOrder(), detail.getIdProduct(), detail.getQuantity(), detail.getPrice());
        return template.update(sql);
    }
    
    public SaleOrder AddSaleOrder(final SaleOrder saleOrder)
    {
        KeyHolder holder = new GeneratedKeyHolder();
        template.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement pre = connection.prepareStatement("insert into saleorder(idUser, fullName, phone, address, total) values (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
                pre.setInt(1, saleOrder.getIdUser());
                pre.setNString(2, saleOrder.getFullName());
                pre.setString(3, saleOrder.getPhone());
                pre.setNString(4, saleOrder.getAddress());
                pre.setInt(5, saleOrder.getTotal());
                return pre;
            }
        }, holder);
        
        int newSaleOrderId = holder.getKey().intValue();
        saleOrder.setId(newSaleOrderId);
        return saleOrder;
    }
}
