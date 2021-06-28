/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.User;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author phuongkhanh
 */
@Controller
public class UserController {
    private static final Logger logger = Logger.getLogger(UserController.class);
    
    @Autowired
    UserDAO daoUser;
    
    @RequestMapping(value = "/user/register")
    public String Register(ModelMap map){
        logger.info("Register");
        return "register";
    }
    
    @RequestMapping(value = "/user/register/xulyregister",method = RequestMethod.POST)
    public String XulyRegister(ModelMap map, User user){
        logger.info("Xu ly register");
        // mã hóa password
        String encodedPassword = new String(Base64.encodeBase64(user.getPassword().getBytes()));
        user.setPassword(encodedPassword);
        // kiểm tra username có tồn tại chưa, nếu chưa thì thêm
        User findUser = daoUser.FindUser(user.getUsername());
        if(findUser == null) // chưa có
        {
            int insertUser = daoUser.AddNewUser(user);
        }
        else
        {
            map.addAttribute("err", "Username đã tồn tại. Vui lòng chọn username khác !");
            return "error";
        }
        
        return "login";
    }
    
    @RequestMapping(value = "/user/login")
    public String Login(ModelMap map){
        logger.info("Login");
        return "login";
    }
    
    @RequestMapping(value = "/user/login/xulylogin",method = RequestMethod.POST)
    public String XulyLogin(ModelMap map, User user, HttpServletRequest request){
        logger.info("Xu ly login");
        String str = "";
        // kiểm tra username nhập vào có tồn tại hay chưa
        User findUser = daoUser.FindUser(user.getUsername());
        if(findUser != null) // có tồn tại
        {
            // giải mã password
            String decodedPassword = new String(Base64.decodeBase64(findUser.getPassword().getBytes()));
            System.out.println("decode: " + decodedPassword);
            System.out.println(user.getPassword());
            // so sánh mật khẩu nhập vào
            if(user.getPassword().equals(decodedPassword))
            {
                HttpSession session = request.getSession();
                session.setAttribute("userId", findUser.getId());
                str = "redirect:/product/list.html";
            }
            else
            {
                map.addAttribute("err", "Username hoặc Password không chính xác !");
                return "error";
            }
        }
        else
        {
            map.addAttribute("err", "Username hoặc Password không chính xác !");
            return "error";
        }
        
        return str;
    }
    
    @RequestMapping(value = "/user/logout")
    public String Logout(ModelMap map, HttpServletRequest request){
        logger.info("Logout");
        HttpSession session = request.getSession();
        session.setAttribute("userId", 0);
        return "redirect:/product/list.html";
    }
}
