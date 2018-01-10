package com.jiangqn.controller;

import com.jiangqn.model.User;
import com.jiangqn.service.BusCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class DeleteController {
    @Autowired
    private BusCarService busCarService;

    @RequestMapping("/busdelete")
    public String busdelete(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        ArrayList<String> selall = new ArrayList<String>();
        selall = busCarService.BusCar_selAll();
        model.addAttribute("carid",selall);
        return "/busdelete";
    }
    @RequestMapping("/deletebus")
    @ResponseBody
    public Map deletebus(HttpServletRequest request){
        Map map = new HashMap();
        String carid = request.getParameter("car_id");
        busCarService.BusCar_delete(carid);
        map.put("delete",true);
        return map;
    }

}
