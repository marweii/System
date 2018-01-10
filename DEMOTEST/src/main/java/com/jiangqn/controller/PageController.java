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
public class PageController {
    @Autowired
    private BusCarService busCarService;
    @RequestMapping("/busselete")
    public String busselete(HttpServletRequest request, Model model){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        ArrayList<String> num = new ArrayList<String>();
        selall = busCarService.BusCar_sel10(0);
        num = busCarService.BusCar_selAll();
        int sizenum = num.size();
        int sum = sizenum;
        sizenum =(sizenum/15)+1;
/*        model.addAttribute("carinfo",selall);*/
/*        model.addAttribute("num",sizenum);*/
        request.getSession().setAttribute("carinfo",selall);
        request.getSession().setAttribute("num",sizenum);
        request.getSession().setAttribute("page",1);
        request.getSession().setAttribute("sum",sum);
        return "/busselete";
    }
    @RequestMapping("/bussel")
    public String bussel(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "/busselete";
    }
    //下一页
    @RequestMapping("/busseldeal")
    @ResponseBody
    public Map busseldeal(HttpServletRequest request,Model model){
        Map map = new HashMap();
        int a = Integer.parseInt(request.getParameter("page"));
        int page = a*15;
        int nowpage = a +1;//当前页码
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        ArrayList<String> num = new ArrayList<String>();
        selall = busCarService.BusCar_sel10(page);
        num = busCarService.BusCar_selAll();
        int sizenum = num.size();
        int sum = sizenum;
        sizenum =(sizenum/15)+1;
        if(nowpage<=sizenum) {
            request.getSession().setAttribute("carinfo", selall);
            request.getSession().setAttribute("num", sizenum);//查询总数据的条数
            request.getSession().setAttribute("page", nowpage);
            request.getSession().setAttribute("sum",sum);
            map.put("nextpage", true);
        }else {
            map.put("nextpage", false);
        }
        return map;
    }
    //页面跳转
    @RequestMapping("/busseldrop")
    @ResponseBody
    public Map busseldrop(HttpServletRequest request,Model model){
        Map map = new HashMap();
        int a = Integer.parseInt(request.getParameter("page"));
        int page = (a-1)*15;
        int nowpage = a ;//当前页码
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        ArrayList<String> num = new ArrayList<String>();
        selall = busCarService.BusCar_sel10(page);
        num = busCarService.BusCar_selAll();
        int sizenum = num.size();
        int sum = sizenum;
        sizenum =(sizenum/15)+1;
        if(nowpage<=sizenum) {
            request.getSession().setAttribute("carinfo", selall);
            request.getSession().setAttribute("num", sizenum);//查询总数据的条数
            request.getSession().setAttribute("page", nowpage);
            request.getSession().setAttribute("sum", sum);
            map.put("droppage", true);
        }else {
            map.put("droppage", false);
        }
        return map;
    }
    //上一步
    @RequestMapping("/busselback")
    @ResponseBody
    public Map busselback(HttpServletRequest request,Model model){
        Map map = new HashMap();
        int a = Integer.parseInt(request.getParameter("page"));
        if(a<2){
            map.put("selback",false);
            return map;
        }
        int page = (a-2)*15;
        int nowpage = a -1;//当前页码
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        ArrayList<String> num = new ArrayList<String>();
        selall = busCarService.BusCar_sel10(page);
        num = busCarService.BusCar_selAll();
        int sizenum = num.size();
        int sum = sizenum;
        sizenum =(sizenum/15)+1;
        request.getSession().setAttribute("carinfo", selall);
        request.getSession().setAttribute("num", sizenum);//查询总数据的条数
        request.getSession().setAttribute("page", nowpage);
        request.getSession().setAttribute("sum", sum);
        map.put("selback", true);
        return map;
    }
}
