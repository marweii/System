<%--
  Created by IntelliJ IDEA.
  User: jiangqn
  Date: 2017/10/18
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
    <title>公交信息服务系统</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Modern Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
    <link rel="stylesheet" href="resource/css/style.css" type="text/css" media="all" /> <!-- Style-CSS -->
    <link rel="stylesheet" href="resource/css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->

</head>
<body>
<div data-vide-bg="resource/images/keyboard">
    <div class="main-container">
        <!--header-->
        <div class="header-w3l">
            <h1>公交信息服务</h1>
        </div>
        <!--//header-->
        <!--main-->
        <div class="main-content-agile">
            <div class="w3ls-pro">
                <h2>Login</h2>
            </div>
            <div class="sub-main-w3ls">
                <input placeholder="Enter your Account" name="enter account" type="text" required="" id="account">
                <span class="icon4"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                <input  placeholder="Enter Password" name="Password" type="password" required="" id="password">
                <span class="icon5"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                <div class="checkbox-w3">
                    <a href="/register">REGISTER</a>
                    <div class="clear"></div>
                </div>
                <input type="submit" value="" onclick="login()">
            </div>
        </div>
        <!--//main-->
        <div class="footer">
            <p>Login for Bus information service system . </p>
        </div>

    </div>
</div>
<!-- js -->
<script type="text/javascript">
    function login(){

        if($("#account").val()==""){
            alert("账号不能为空！");
            return document.getElementById("account").focus();
        }
        if($("#password").val()==""){
            alert("密码不能为空！");
            return document.getElementById("password").focus();
        }
        $.ajax({
            type:"POST",
            url:"/login",
            async:false,
            data:{account:$("#account").val(),password:$("#password").val()},
            success:function (data) {
                if(data["islogin"]){
                    window.location.href = "/home";
                }else {
                    alert("错误");
                }
            },
            error:function(s){
                alert("错误"+s.responseText);
            }
        });
    }

</script>
<script type="text/javascript" src="resource/js/jquery/jquery-2.1.4.min.js"></script><!--common-js-->
<script src="resource/js/jquery/jquery.vide.min.js"></script><!--video-js-->
<!-- //js -->
</body>
</html>