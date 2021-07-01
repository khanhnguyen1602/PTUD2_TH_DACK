/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dao.UserDAO;
import java.util.List;
import model.Image;
import model.Product;
import model.Cart;
import dao.CartDAO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author phuongkhanh
 */
@Controller
public class CartController {
    private static final Logger logger = Logger.getLogger(CartController.class);
    
    @Autowired
    ProductDAO daoPro;
    
    @Autowired
    CartDAO daoCart;
    
    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String XemCart(ModelMap map, @RequestParam("idUser") int idUser){
        logger.info("Xem gio hang");
        List<Cart> listCart = daoCart.LayDanhSachCartCuaUser(1);
        for(Cart c: listCart)
        {
            int tinhtien = daoPro.TinhTien(c.getIdProduct());
            c.getProduct().setPrice(tinhtien);
        }
        map.addAttribute("listCart", listCart);
        return "cart";
        
    }
    
//    @RequestMapping(value = "/cart")
//    public String XemCart(ModelMap map){
//        logger.info("Xem gio hang");
//        return "cart";
//        
//    }
}
