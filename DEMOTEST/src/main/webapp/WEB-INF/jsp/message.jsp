<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: jiangqn
  Date: 2017/10/18
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="resource/js/jquery.js"></script>
    <title>登录</title>
</head>
<body>
<input id="message" type="text" name="message">
<button id="send"  onclick="send()">发送</button>
<p>机器人:<b id="b1">${sessionScope.message}</b></p>
<script type="text/javascript">
    function send(){
        $.ajax({
            type:"POST",
            url:"/messagea",
            async:false,
            data:{message:$("#message").val()},
            success:function (data) {
                if(data["msgkey"]){
                    document.getElementById("b1").innerHTML =data["msge"];
                    /*window.location.href = "/message";*/
                }
            },
            error:function(s){
                alert("错误"+s.responseText);
            }
        });
    }
</script>
</body>
</html>
