/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.util.List;

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
    
    @RequestMapping(value = "/user/login")
    public String Login(ModelMap map){
        logger.info("Login");
        return "login";
    }
}
