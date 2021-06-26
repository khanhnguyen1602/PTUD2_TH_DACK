/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Product;
import model.Image;
import org.springframework.beans.factory.annotation.Autowired;
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
                
                // lấy images 
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
}
