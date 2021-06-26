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
public class ProductController {
    private static final Logger logger = Logger.getLogger(ProductController.class);
    
    @Autowired
    ProductDAO daoPro;
    
    @RequestMapping(value = "/product/list")
    public String LayDanhSachProducts(ModelMap map){
        logger.info("Lay ds product");
        List<Product> lstPro = daoPro.LayDanhSachProducts();
        map.addAttribute("listPro", lstPro);
        map.addAttribute("daoKH", daoPro);
        for(Product p: lstPro)
        {
            System.out.println("Name: " + p.getProductName());
            for(Image img: p.getImgs().getListImg())
            {
                System.out.println("Link: " + img.getLink());
            }
        }
        return "listProduct";
        
    }
}