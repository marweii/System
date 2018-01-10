package com.jiangqn.controller;

import com.jiangqn.model.BusCar;
import com.jiangqn.model.User;
import com.jiangqn.service.BusCarService;
import com.jiangqn.service.impl.UploadServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UploadController {
    @Autowired
    private BusCarService busCarService;

    File tempPathFile;
    private String uploadPath = "D:\\WORKSPACE\\testdemo\\write";
    //批量导入
    @RequestMapping("/upload")
    public String uploada(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "batchload";
    }

    @RequestMapping("/getupload")
    @ResponseBody
    public Map getupload(HttpServletRequest request) throws Exception {
        SimpleDateFormat ft = new SimpleDateFormat("HH:mm:ss");
        Map m = new HashMap();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(4096);
        factory.setRepository(tempPathFile);
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(4194304);
        List<FileItem> items = upload.parseRequest(request);
        Iterator<FileItem> i = items.iterator();
        while (i.hasNext()) {
            FileItem fi = (FileItem) i.next();
            String fileName = fi.getName();
            if (fileName != null) {
                File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题
                File savedFile = new File(uploadPath, fullFile.getName());
                fi.write(savedFile);
                String filepath = uploadPath + "\\" + fullFile.getName();
                UploadServiceImpl upimpl = new UploadServiceImpl();
                upimpl.ReadExcelUtils(filepath);
                Map<Integer, Map<Integer, Object>> map = upimpl.ReadExcelUtils(filepath).readExcelContent();
                for (int xi = 1; xi <= map.size(); xi++) {
                    String car_id = (String) map.get(xi).get(0);
                    String car_startstation = (String) map.get(xi).get(1);
                    String car_endstation = (String) map.get(xi).get(2);
                    String car_paymoney = (String) map.get(xi).get(3);
                    java.util.Date stime = (Date) map.get(xi).get(4);
                    java.util.Date etime = (Date) map.get(xi).get(5);
                    String car_starttime = ft.format(stime);
                    String car_endtime = ft.format(etime);
                    String car_station = (String) map.get(xi).get(6);
                    //将导入信息进行数据库查询，查看是否有存在的id
                    BusCar selid = busCarService.BusCar_sel(car_id);
                    if(selid!=null){
                        m.put("suc",false);
                        m.put("loadmsg",car_id);
                        return m;
                    }else {
                        //没有相同的Id进行数据的导入
                        busCarService.BusCar_ins(car_id, car_startstation, car_endstation, car_paymoney, car_starttime, car_endtime, car_station);

                    }
                }
            }
        }
        m.put("suc",true);
        return m;
    }
    //单条导入
    @RequestMapping("/singleload")
    public String singleload(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "singleload";
    }
    @RequestMapping("/singleloadins")
    @ResponseBody
    public Map singeloadins(HttpServletRequest request){
        Map map =new HashMap();
        String a1 = request.getParameter("car_id");
        String a2 = request.getParameter("car_startstation");
        String a3 = request.getParameter("car_endstation");
        String a4 = request.getParameter("car_paymoney");
        String a5 = request.getParameter("car_starttime");
        String a6 = request.getParameter("car_endtime");
        String a7 = request.getParameter("car_station");
        BusCar busCar = busCarService.BusCar_sel(a1);
        if(busCar ==null){
        busCarService.BusCar_ins(a1,a2,a3,a4,a5,a6,a7);
        map.put("isload",true);
        }
        else {
            map.put("isload",false);
        }
        return map;
    }


}

