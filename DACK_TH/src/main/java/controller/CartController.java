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
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.SaleOrder;
import model.SaleOrderDetail;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
    
    @RequestMapping(value = "/cart")
    public String XemCart(ModelMap map, HttpServletRequest request){
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        logger.info("Xem gio hang");
        List<Cart> listCart = daoCart.LayDanhSachCartCuaUser(idUser);
        //tinh khuyen mai
        for(Cart c: listCart)
        {
            int tinhtien = daoPro.TinhTien(c.getIdProduct());
            c.getProduct().setPrice(tinhtien);
        }
        map.addAttribute("listCart", listCart);
        map.addAttribute("idUser", idUser);
        // hien thi so luong sp tren icon cart
        map.addAttribute("daoCart", daoCart);
//        session.setAttribute("cartNum", listCart.size());
        return "cart";
        
    }
    
    @RequestMapping(value = "/cart/addtocart", method = RequestMethod.POST)
    public String AddtoCart(ModelMap map, HttpServletRequest request, Cart cart){
        logger.info("Them vao gio hang");
        System.out.println("id pro: " + cart.getProduct());
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        cart.setIdUser(idUser);
        // them vao gio hang
        // kiem tra sp co trong gio hang chua, neu co --> neu sl > 0 thi update, sl =0 thi xoa sp khoi gio hang
        //                                     neu chua co thi add
        Cart c = daoCart.FindCart(idUser, cart.getIdProduct());
        if(c != null) // tim thay
        {
            if(cart.getQuantity() > 0)
            {
                int updateQuantity = daoCart.UpdateQuantity(cart.getQuantity(), c.getId());
            }
            else
            {
                int deleteCart = daoCart.XoaCart(c.getId());
            }
        }
        else
        {
            if(cart.getQuantity() > 0)
            {
                int insertCart = daoCart.AddCart(cart);
                // update lai icon sl sp trong gio hang
//                List<Cart> listCart = daoCart.LayDanhSachCartCuaUser(idUser);
//                session.setAttribute("cartNum", listCart.size());
            }
        }
        return "redirect:/index.html";
    }
    
    @RequestMapping(value = "/cart/delete")
    public String DeleteCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        logger.info("Xoa gio hang");
        int deleted = daoCart.XoaCartByIdUser(idUser);
        return String.format("redirect:/cart.html");
        
    }
    
    @RequestMapping(value = "/cart/update", method = RequestMethod.POST)
    public String UpdateCart(HttpServletRequest request, @RequestParam("quantity") int[] quantity){
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        logger.info("Update gio hang");
        List<Cart> listCart = daoCart.LayDanhSachCartCuaUser(idUser);
        for(int i=0; i<quantity.length; i++)
        {
            // neu sl = 0 thi xoa sp
            if(quantity[i] == 0)
            {
                int deleted = daoCart.XoaProductInCart(idUser, listCart.get(i).getIdProduct());
            }
            else
            {
                // neu sl != 0 va sl nhap != sl trong db thi cap nhat
                if(listCart.get(i).getQuantity() != quantity[i])
                {
                    int updated = daoCart.UpdateQuantity(quantity[i], listCart.get(i).getId());
                }
            }
            
        }
        
        return String.format("redirect:/cart.html");
        
    }
    
    @RequestMapping(value = "/cart/deleteProduct", method = RequestMethod.GET)
    public String DeleteProductInCart(HttpServletRequest request, @RequestParam("idPro") int idPro){
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        logger.info("Xoa sp trong gio hang");
        int deleted = daoCart.XoaProductInCart(idUser, idPro);
        return String.format("redirect:/cart.html");
        
    }
    
    @RequestMapping(value = "/cart/showcheckout", method = RequestMethod.GET)
    public String ShowCheckout(ModelMap map, HttpServletRequest request){
        logger.info("Thanh toan");
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        List<Cart> listCart = daoCart.LayDanhSachCartCuaUser(idUser);
        // tinh khuyen mai
        for(Cart c: listCart)
        {
            int tinhtien = daoPro.TinhTien(c.getIdProduct());
            c.getProduct().setPrice(tinhtien);
        }
        // hien thi so luong sp tren icon cart
        map.addAttribute("daoCart", daoCart);
        map.addAttribute("listCart", listCart);
        return "checkout";
    }
    

    @RequestMapping(value = "/cart/checkout", method = RequestMethod.POST)
    public String Checkout(ModelMap map, SaleOrder saleOrder, HttpServletRequest request){
        logger.info("Thanh toan");
        HttpSession session = request.getSession();
        int idUser = Integer.parseInt(session.getAttribute("userId").toString());
        List<SaleOrderDetail> listDetails = new ArrayList<>();
        List<Cart> listCart = daoCart.LayDanhSachCartCuaUser(idUser);
        int tongtien = 0;
        
        //set idUser
        saleOrder.setIdUser(idUser);
        
        // tinh khuyen mai
        for(Cart c: listCart)
        {
            int tinhtien = daoPro.TinhTien(c.getIdProduct());
            c.getProduct().setPrice(tinhtien);
            
            // tong tien
            tongtien += c.getProduct().getPrice() * c.getQuantity();
            // set total
            saleOrder.setTotal(tongtien);
            
            // khoi tao saleorderdetail
            SaleOrderDetail detail = new SaleOrderDetail();
            detail.setIdProduct(c.getIdProduct());
            detail.setPrice(c.getProduct().getPrice());
            detail.setQuantity(c.getQuantity());
            listDetails.add(detail);
        }
        
        // luu vao table saleorder
        SaleOrder insertSaleOrder = daoCart.AddSaleOrder(saleOrder);
        
        //luu vao table saleorderdetail
        for(SaleOrderDetail dt: listDetails)
        {
            //cap nhat id order
            dt.setIdOrder(insertSaleOrder.getId());
            daoCart.AddSaleOrderdetail(dt);
        }
        
        // update totalSold
        for(Cart c: listCart)
        {
            int update = daoPro.UpdateTotalSold(c.getIdProduct(), c.getQuantity());
        }
        
        // xoa gio hang
        daoCart.XoaCartByIdUser(idUser);
        
        map.addAttribute("msg", "Cảm ơn bạn đã lựa chọn sản phẩm của chúng tôi. Chúc bạn một ngày tốt lành !");
        return "message";
    }
}
