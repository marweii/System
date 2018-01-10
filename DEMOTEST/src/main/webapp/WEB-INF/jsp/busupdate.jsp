<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<head>
    <title>公交信息服务系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <link href="/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- Custom Theme files -->
    <link href="/resource/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--js-->
    <script src="/resource/js/jquery/jquery-2.1.1.min.js"></script>
    <!--icons-css-->
    <link href="/resource/css/font-awesome.css" rel="stylesheet">
    <link href="/resource/css/singleload.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/resource/css/jscrollpane1.css" />
    <script src="/resource/js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
    <!-- the mousewheel plugin -->
    <script type="text/javascript" src="/resource/js/jquery/jquery.mousewheel.js"></script>
    <!-- the jScrollPane script -->
    <script type="text/javascript" src="/resource/js/jquery/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" src="/resource/js/jquery/scroll-startstop.events.jquery.js"></script>
    <!--讨论区滚动条end-->
    <script type="text/javascript" src="/resource/js/front/talk.js"></script>

</head>
<body>
<div class="page-container">
    <div class="left-content">
        <div class="mother-grid-inner">
            <!--header start here-->
            <div class="header-main">
                <div class="header-left">
                    <div class="logo-name">
                        </a>
                    </div>
                    <!--search-box-->

                    <div class="clearfix"> </div>
                </div>
                <!--notification menu end -->
                <div class="profile_details">
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">
                                    <span class="prfil-img"><img src="${user.pictureurl}" alt=""> </span>
                                    <div class="user-name">
                                        <p>${user.name}</p>
                                        <span>${user.power}</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </a>

                        </li>
                    </ul>
                </div>
                <div class="clearfix">
                    <h2 style="font-family:fantasy; font-weight:600; ">公交信息服务系统</h2></div>
            </div>
            <div class="clearfix">
                <table class="word margin" style="border-collapse:separate; border-spacing:10px;">
                    <tbody>
                    <tr>
                        <td>
                            线路：
                        </td>
                        <td>
                            <%--<input type="text" name="car_id" id="car_id" value="" class="margin02">--%>
                            <select name="car_id" class="margin03" onchange="getinfo()" id="car_id">
                                <optgroup>
                                    <option ></option>
                                    <c:forEach items="${carid}" var="item">
                                        <option >${item.car_id}</option>
                                    </c:forEach>
                                </optgroup>
                            </select>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            起始站：
                        </td>
                        <td >
                            <input type="text" name="car_startstation" id="car_startstation" value="" class="margin02" >
                        </td>
                    </tr>
                    <tr>
                        <td>
                            终点站：
                        </td>
                        <td>
                            <input type="text" name="car_endstation" id="car_endstation" value="" class="margin02">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            票价：
                        </td>
                        <td>
                            <input type="text" name="car_paymoney" id="car_paymoney" value="" class="margin02">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            最早发车时间：
                        </td>
                        <td>
                            <input type="text" name="car_starttime" id="car_starttime" value="" class="margin02">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            最晚发车时间：
                        </td>
                        <td>
                            <input type="text" name="car_endtime" id="car_endtime" value="" class="margin02">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            途经站点：
                        </td>
                        <td>
                            <input type="text" name="car_station" id="car_station" value="" class="margin02">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <tr>
                    <button id="upload" name="upload" class="margin01"  onclick="update()">修改</button>
                    <button id="unload" name="unload" >取消</button>
                </tr>
            </div>
        </div>

    </div>
    <div class="copyrights">
        <p>Bus information service system's HOME. </p>
    </div>
</div>
</div>
<div class="sidebar-menu">
    <div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span>
        <!--<img id="logo" src="" alt="Logo"/>-->
    </a> </div>
    <div class="menu">
        <ul id="menu" >
            <li id="menu-home" ><a href="/home"><i class="fa fa-tachometer"></i><span>公交信息服务</span></a></li>
            <li><a href="/message"><i class="fa fa-cogs"></i><span>公交智能语聊</span></a>
            </li>
            <li id="menu-comunicacao" ><a href="#"><i class="fa fa-book nav_icon"></i><span>公交信息导入</span><span class="fa fa-angle-right" style="float: right"></span></a>
                <ul id="menu-comunicacao-sub" >
                    <li id="menu-mensagens" style="width: 120px" ><a href="buttons.html">单条信息导入</a>
                    </li>
                    <li id="menu-arquivos" ><a href="/upload">批量信息导入</a></li>
                </ul>
            </li>
            <li><a href="/busselete"><i class="fa fa-map-marker"></i><span>公交信息查询</span></a></li>
            <li id="menu-academico" ><a href="/map"><i class="fa fa-file-text"></i><span>公交地图查询</span></a>
            </li>

            <li><a href="charts.html"><i class="fa fa-bar-chart"></i><span>公交信息管理</span><span class="fa fa-angle-right" style="float: right"></span></a>
                <ul id="carinfo" >
                    <li id="carinfoupdate" style="width: 160px" ><a href="/busupdate">公交信息的修改</a>
                    </li>
                    <li id="carinfodelete" ><a href="/busdelete">公交信息的删除</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-cog"></i><span>设置</span><span class="fa fa-angle-right" style="float: right"></span></a>
                <ul id="shezhi" >
                    <li id="userout" style="width: 160px" ><a href="/loginout">登出</a>
                    </li>
                    <li id="userpassrevise" ><a href="/revisepassword">修改密码</a></li>
                    <li id="userrevise" ><a href="/userinfochange">修改个人信息</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div class="clearfix"> </div>
</div>
<script type="text/javascript">
    function getinfo() {
        var car_startstation=document.getElementById("car_startstation");
        var car_endstation=document.getElementById("car_endstation");
        var car_paymoney=document.getElementById("car_paymoney");
        var car_starttime=document.getElementById("car_starttime");
        var car_endtime=document.getElementById("car_endtime");
        var car_station=document.getElementById("car_station");
        var car_id = $("#car_id").val();
        if(car_id==""){
            car_startstation.value = "";
            car_endstation.value = "";
            car_paymoney.value = "";
            car_starttime.value = "";
            car_endtime.value = "";
            car_station.value = "";
        }else {
            $.ajax({
                type: "POST",
                url: "/selbus",
                async: false,
                data: {car_id: car_id},
                success: function (data) {
                    car_startstation.value = data["car_startstation"];
                    car_endstation.value = data["car_endstation"];
                    car_paymoney.value = data["car_paymoney"];
                    car_starttime.value = data["car_starttime"];
                    car_endtime.value = data["car_endtime"];
                    car_station.value = data["car_station"];
                },

            });
        }
    }
    function update() {
        if($("#car_id").val()==""){
            alert("路线不能为空！");
            return document.getElementById("car_id").focus();
        }
        if($("#car_startstation").val()=="") {
            alert("起始站不能为空！");
            return document.getElementById("car_startstation").focus();
        }
        if($("#car_endstation").val()==""){
            alert("终点站不能为空！");
            return document.getElementById("car_endstation").focus();
        }
        if($("#car_paymoney").val()=="") {
            alert("票价不能为空！");
            return document.getElementById("car_paymoney").focus();
        }
        if($("#car_starttime").val()==""){
            alert("最早发车时间不能为空！");
            return document.getElementById("car_starttime").focus();
        }
        if($("#car_endtime").val()=="") {
            alert("最晚发车时间不能为空！");
            return document.getElementById("car_endtime").focus();
        }
        if($("#car_station").val()=="") {
            alert("途经站点不能为空！");
            return document.getElementById("car_station").focus();
        }
        $.ajax({
            type:"POST",
            url:"/updatebus",
            async:false,
            data:{car_id:$("#car_id").val(),car_startstation:$("#car_startstation").val(),car_endstation:$("#car_endstation").val(),car_paymoney:$("#car_paymoney").val(),car_starttime:$("#car_starttime").val(),car_endtime:$("#car_endtime").val(),car_station:$("#car_station").val()},
            success:function (data) {
                if(data["update"]){
                    alert("修改成功！")
                }else {

                }
            },
            error:function(s){
                alert("错误"+s.responseText);
            }
        });
    }
</script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<script src="js/bootstrap.js"> </script>
</body>
</html>