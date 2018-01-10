package com.jiangqn.controller;

import com.jiangqn.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
    @RequestMapping("/home")
    public String home(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null) {
            return "/home";
        }else {
            return "/login";
        }
    }
}
