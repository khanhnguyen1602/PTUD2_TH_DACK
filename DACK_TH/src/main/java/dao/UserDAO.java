/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
/**
 *
 * @author phuongkhanh
 */
public class UserDAO {
    JdbcTemplate template;
    
     public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
     
     public User FindUser(String username) {
        try{
        String sql = "select * from user where username=?";
        return template.queryForObject(sql, new Object[]{username}, new BeanPropertyRowMapper<User>(User.class));
        } catch(EmptyResultDataAccessException e)
        {
            return null;
        }
        
    }
     
     public int AddNewUser(User user)
    {
        String sql = String.format("insert into user(username, password, email, phone) values ('%s','%s','%s','%s')", 
                user.getUsername(), user.getPassword(), user.getEmail(), user.getPhone());
        return template.update(sql);
    }
     
}
