package com.jiangqn.controller;

import com.jiangqn.model.User;
import com.jiangqn.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    @ResponseBody
    public Map login(HttpServletRequest request){
        Map m = new HashMap();
        User user = userService.login(request.getParameter("account"), request.getParameter("password"));
        if(user!= null){
            String x = " ";
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("touxiang",user.getPictureurl());
            m.put("islogin",true);
        }else {
            m.put("islogin",false);
        }
        return m;
    }
    @RequestMapping("/registerins")
    @ResponseBody
    public Map register(HttpServletRequest request){
        Map m = new HashMap();
        User user = userService.register_sel(request.getParameter("account_register"),request.getParameter("name_register"));
        if(user!= null){
            m.put("register",false);
        }else {
            userService.register_ins(request.getParameter("account_register"),request.getParameter("password_register"),request.getParameter("name_register"));
            m.put("register",true);
        }
        return m;
    }
    @RequestMapping("/register")
    public String registera(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "/register";
    }

    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        request.getSession().invalidate();//清空session数据
        return "/login";
    }
    @RequestMapping("/test")
    public String test(){
        return "/test";
    }

}

