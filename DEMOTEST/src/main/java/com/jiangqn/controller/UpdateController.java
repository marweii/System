package com.jiangqn.controller;

import com.jiangqn.model.BusCar;
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
public class UpdateController {
    @Autowired
    private BusCarService busCarService;

    @RequestMapping("/busupdate")
    public String businfoupdate(HttpServletRequest request, Model model){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        ArrayList<String> selall = new ArrayList<String>();
        selall = busCarService.BusCar_selAll();
        model.addAttribute("carid",selall);
        return "/busupdate";
    }
    @RequestMapping("/selbus")
    @ResponseBody
    public Map selbus(HttpServletRequest request, Model model){
        Map map = new HashMap();
        BusCar busCar = busCarService.BusCar_sel(request.getParameter("car_id"));
        map.put("car_startstation",busCar.getCar_startstation());
        map.put("car_endstation",busCar.getCar_endstation());
        map.put("car_paymoney",busCar.getCar_paymoney());
        map.put("car_starttime",busCar.getCar_starttime());
        map.put("car_endtime",busCar.getCar_endtime());
        map.put("car_station",busCar.getCar_station());
        return map;
    }
    @RequestMapping("/updatebus")
    @ResponseBody
    public Map updatebus(HttpServletRequest request){
        Map map =new HashMap();
        String a1 = request.getParameter("car_id");
        String a2 = request.getParameter("car_startstation");
        String a3 = request.getParameter("car_endstation");
        String a4 = request.getParameter("car_paymoney");
        String a5 = request.getParameter("car_starttime");
        String a6 = request.getParameter("car_endtime");
        String a7 = request.getParameter("car_station");
        busCarService.BusCar_update(a1,a2,a3,a4,a5,a6,a7);
        map.put("update",true);
        return map;
    }
}
