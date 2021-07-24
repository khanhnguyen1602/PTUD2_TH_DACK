/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dao.ProductDAO;
import dao.UserDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    
    @Autowired
    CartDAO daoCart;
    
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
    
    @RequestMapping(value = "/product/details", method = RequestMethod.GET)
    public String ProductDetails(ModelMap map, @RequestParam("idPro") int idPro){
        Product p = daoPro.GetProduct(idPro);
        List<Image> listImg = daoPro.LayImage(idPro);
        p.getImgs().setListImg(listImg);
        int countImage = listImg.size();
        map.addAttribute("p", p);
        map.addAttribute("daoPro", daoPro);
        // hien thi so luong sp tren icon cart
        map.addAttribute("daoCart", daoCart);
        map.addAttribute("countImg", countImage);
        return "productDetails";
        
    }
    
    @RequestMapping(value = "/index")
    public String Home(ModelMap map, HttpServletRequest request){
        logger.info("Lay ds product");
        List<Product> lstTopSeller = daoPro.LayDanhSachProductsBanChayNhat();
        List<Product> lstNews = daoPro.LayDanhSachProductsMoiNhat();
        
        map.addAttribute("listTopSeller", lstTopSeller);
        map.addAttribute("listNews", lstNews);
//        map.addAttribute("daoKH", daoPro);
         map.addAttribute("daoCart", daoCart);
        for(Product p: lstTopSeller)
        {
            System.out.println("Name: " + p.getProductName());
            for(Image img: p.getImgs().getListImg())
            {
                System.out.println("Link: " + img.getLink());
            }
        }
        HttpSession session = request.getSession();
        return "home";
        
    }
}
