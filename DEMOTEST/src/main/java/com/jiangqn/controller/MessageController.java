package com.jiangqn.controller;

import com.jiangqn.model.Message;
import com.jiangqn.model.User;
import com.jiangqn.service.MessageService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MessageController {
    @Autowired
    private MessageService messageService;
    @RequestMapping("/messagea")
    @ResponseBody
    public Map message(HttpServletRequest request){
        Map map = new HashMap();
        String text;
        //jsp传过来数据
        String  a =request.getParameter("message");
        if(a.indexOf("地图查询")>=0 || a.indexOf("查询地图")>=0 ||a.indexOf("查询公交地图")>=0){
            Message msg = messageService.Message_selques("地图查询");
            text = msg.getMessage_answer();
        }
        else if(a.indexOf("信息查询")>=0 || a.indexOf("查询信息")>=0 ||a.indexOf("查询公交信息")>=0) {
            Message msg = messageService.Message_selques("信息查询");
            text = msg.getMessage_answer();
        }
        else
        {
            text = "机器人还无法理解您输入的内容。";
        }
        map.put("msge",text);
        return map;
    }
    @RequestMapping("/message")
    public String messageview(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user == null) {
            return "/login";
        }
        return "/autotalk";
    }
}
