package com.jiangqn.controller;

import com.jiangqn.model.BusCar;
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
public class SelectController {
    @Autowired
    private BusCarService busCarService;
    @RequestMapping("/selectbusinfo")
    @ResponseBody
    public Map selectbusinfo(HttpServletRequest request, Model model){
        BusCar getbuscar = new BusCar();
        Map map = new HashMap();
        String a1 ="%"+ request.getParameter("car_id")+"%";
        String a2 = "%"+request.getParameter("car_startstation")+"%";
        String a3 = "%"+request.getParameter("car_endstation")+"%";
        String a4 = "%"+request.getParameter("car_paymoney")+"%";
        String a5 = request.getParameter("car_starttime");//最早发车时间+request.getParameter("car_starttime")+
        String a6 = request.getParameter("car_endtime");//最晚发车时间"+request.getParameter("car_endtime")+"
        String a7 = "%"+request.getParameter("car_station")+"%";
        //当不输入最晚发车时间的时候给最晚发车时间一个最大值
        if(a6==""){
            a6 = "24:00";
        }
        ArrayList<BusCar> bussele = new ArrayList<BusCar>();
        ArrayList<String> num = busCarService.BusCar_selectcount(a1,a2,a3,a4,a5,a6,a7);
        bussele = busCarService.BusCar_select(a1,a2,a3,a4,a5,a6,a7);
        int numsize = num.size();
        int sum = numsize;
        numsize =(numsize/15)+1;
        request.getSession().setAttribute("carinfo",bussele);
        request.getSession().setAttribute("num",numsize);
        request.getSession().setAttribute("page",1);//第一次查询显示第一页
        request.getSession().setAttribute("sum",sum);
        //输入框保存数据
        request.getSession().setAttribute("car_id",request.getParameter("car_id"));
        request.getSession().setAttribute("car_startstation",request.getParameter("car_startstation"));
        request.getSession().setAttribute("car_endstation",request.getParameter("car_endstation"));
        request.getSession().setAttribute("car_paymoney",request.getParameter("car_paymoney"));
        request.getSession().setAttribute("car_starttime",request.getParameter("car_starttime"));
        request.getSession().setAttribute("car_endtime",request.getParameter("car_endtime"));
        request.getSession().setAttribute("car_station",request.getParameter("car_station"));
        map.put("sele",true);
        return map;
    }
    //查询存在值的下一页
    @RequestMapping("/selectbusinfonext")
    @ResponseBody
    public Map selectbusinfonext(HttpServletRequest request,Model model){
        Map map = new HashMap();
        int a = Integer.parseInt(request.getParameter("page"));
        String a1 ="%"+ request.getParameter("car_id")+"%";
        String a2 = "%"+request.getParameter("car_startstation")+"%";
        String a3 = "%"+request.getParameter("car_endstation")+"%";
        String a4 = "%"+request.getParameter("car_paymoney")+"%";
        String a5 = request.getParameter("car_starttime");
        String a6 = request.getParameter("car_endtime");
        String a7 = "%"+request.getParameter("car_station")+"%";
        //当不输入最晚发车时间的时候给最晚发车时间一个最大值
        if(a6==""){
            a6 = "24:00";
        }
        int page = a*15;
        int nowpage = a +1;//当前页码
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        selall = busCarService.BusCar_selpage(page,a1,a2,a3,a4,a5,a6,a7);
        ArrayList<String> num = busCarService.BusCar_selectcount(a1,a2,a3,a4,a5,a6,a7);
        int numsize = num.size();
        int sum = numsize;
        numsize =(numsize/15)+1;
        if(nowpage<=numsize) {
            request.getSession().setAttribute("carinfo", selall);
            request.getSession().setAttribute("num", numsize);//查询总数据的页数
            request.getSession().setAttribute("page", nowpage);
            request.getSession().setAttribute("sum", sum);
            map.put("nextpageinfo", true);
        }else {
            map.put("nextpageinfo", false);
        }
        return map;
    }
    @RequestMapping("/selectbusinfoback")
    @ResponseBody
    public Map selectbusinfoback(HttpServletRequest request,Model model){
        Map map = new HashMap();
        int a = Integer.parseInt(request.getParameter("page"));
        String a1 ="%"+ request.getParameter("car_id")+"%";
        String a2 = "%"+request.getParameter("car_startstation")+"%";
        String a3 = "%"+request.getParameter("car_endstation")+"%";
        String a4 = "%"+request.getParameter("car_paymoney")+"%";
        String a5 = request.getParameter("car_starttime");
        String a6 = request.getParameter("car_endtime");
        String a7 = "%"+request.getParameter("car_station")+"%";
        //当不输入最晚发车时间的时候给最晚发车时间一个最大值
        if(a6==""){
            a6 = "24:00";
        }
        if(a<2){
            map.put("nextpageinfo", false);
            return map;
        }
        int page = (a-2)*15;
        int nowpage = a -1;//当前页码
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        selall = busCarService.BusCar_selpage(page,a1,a2,a3,a4,a5,a6,a7);
        ArrayList<String> num = busCarService.BusCar_selectcount(a1,a2,a3,a4,a5,a6,a7);
        int numsize = num.size();
        int sum = numsize;
        numsize =(numsize/15)+1;
        request.getSession().setAttribute("carinfo", selall);
        request.getSession().setAttribute("num", numsize);//查询总数据的条数
        request.getSession().setAttribute("page", nowpage);
        request.getSession().setAttribute("sum", sum);
        map.put("nextpageinfo", true);
        return map;
    }
    //页面跳转
    @RequestMapping("/selectbusinfodrop")
    @ResponseBody
    public Map selectbusinfodrop(HttpServletRequest request,Model model){
        Map map = new HashMap();
        int a = Integer.parseInt(request.getParameter("page"));
        String a1 ="%"+ request.getParameter("car_id")+"%";
        String a2 = "%"+request.getParameter("car_startstation")+"%";
        String a3 = "%"+request.getParameter("car_endstation")+"%";
        String a4 = "%"+request.getParameter("car_paymoney")+"%";
        String a5 = request.getParameter("car_starttime");
        String a6 = request.getParameter("car_endtime");
        String a7 = "%"+request.getParameter("car_station")+"%";
        //当不输入最晚发车时间的时候给最晚发车时间一个最大值
        if(a6==""){
            a6 = "24:00";
        }
        int page = (a-1)*15;
        int nowpage = a ;//当前页码
        ArrayList<BusCar> selall = new ArrayList<BusCar>();
        selall = busCarService.BusCar_selpage(page,a1,a2,a3,a4,a5,a6,a7);
        ArrayList<String> num = busCarService.BusCar_selectcount(a1,a2,a3,a4,a5,a6,a7);
        int numsize = num.size();
        int sum = numsize;
        numsize =(numsize/15)+1;
        if(nowpage<=numsize) {
            request.getSession().setAttribute("carinfo", selall);
            request.getSession().setAttribute("num", numsize);//查询总数据的条数
            request.getSession().setAttribute("page", nowpage);
            request.getSession().setAttribute("sum", sum);
            map.put("droppagesel", true);
        }else {
            map.put("droppagesel", false);
        }
        return map;
    }
}
