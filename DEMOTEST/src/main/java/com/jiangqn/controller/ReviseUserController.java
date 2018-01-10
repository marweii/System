package com.jiangqn.controller;

import com.jiangqn.model.User;
import com.jiangqn.service.UserService;
import com.jiangqn.service.impl.UploadServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
public class ReviseUserController {
    @Autowired
    private UserService userService;
    File tempPathFile;
    private String uploadPath = "D:\\WORKSPACE\\DEMOTEST\\src\\main\\webapp\\resource\\images";
    private String rePath = "/resource/images/";
    @RequestMapping("/revisepassword")
    public String revisepassword(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "/revisepassword";
    }

    @RequestMapping("/reviseuser")
    @ResponseBody
    public Map reviseuser(HttpServletRequest request){
        Map map = new HashMap();
        userService.revisepass(request.getParameter("account"),request.getParameter("password"));
        map.put("reviseuser",true);
        return map;
    }
    @RequestMapping("/userinfochange")
    public String userinfochange(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "/reviseuserinfo";
    }
    //上传照片
    @RequestMapping("/uploadpic")
    @ResponseBody
    public Map uploadpic(HttpServletRequest request) throws Exception {
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
                String filepath = rePath + fullFile.getName();
                request.getSession().setAttribute("touxiang",filepath);
                }
            }
        m.put("suc",true);
        return m;
    }
    @RequestMapping("/changeuser")
    @ResponseBody
    public Map changeuser(HttpServletRequest request){
        Map map = new HashMap();
        User user = (User) request.getSession().getAttribute("user");
        userService.changeuser(user.getAccount(),request.getParameter("name"), (String) request.getSession().getAttribute("touxiang"));
        user.setPictureurl((String) request.getSession().getAttribute("touxiang"));
        user.setName(request.getParameter("name"));
        request.getSession().setAttribute("user",user);
        map.put("change",true);
        return map;
    }
}
