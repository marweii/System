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
                <table class="marginsele" style="border-collapse:separate; border-spacing:3px;">
                    <tbody>
                    <tr>
                        <td>
                            线路：
                        </td>
                        <td>
                            <input type="text" name="car_id" id="car_id" value="${car_id}" class="margin02">
                        </td>
                        <td>
                            起始站：
                        </td>
                        <td>
                            <input type="text" name="car_startstation" id="car_startstation" value="${car_startstation}" class="margin02">
                        </td>
                        <td>
                            终点站：
                        </td>
                        <td>
                            <input type="text" name="car_endstation" id="car_endstation" value="${car_endstation}" class="margin02">
                        </td>
                        <td>
                            票价：
                        </td>
                        <td>
                            <input type="text" name="car_paymoney" id="car_paymoney" value="${car_paymoney}" class="margin02">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            最早发车时间：
                        </td>
                        <td>
                            <input type="text" name="car_starttime" id="car_starttime" value="${car_starttime}" class="margin02">
                        </td>
                        <td>
                            最晚发车时间：
                        </td>
                        <td>
                            <input type="text" name="car_endtime" id="car_endtime" value="${car_endtime}" class="margin02">
                        </td>
                        <td>
                            途经站点：
                        </td>
                        <td>
                            <input type="text" name="car_station" id="car_station" value="${car_station}" class="margin02">
                        </td>
                        <td>
                            查询时间格式：
                        </td>
                        <td>
                            （00:00:00）
                        </td>
                    </tr>
                    </tbody>
                </table>
                <tr>
                    <button id="sele" name="sele" class="margin01"  onclick="sele()">查询</button>
                    <button id="unload" name="unload" >取消</button>
                </tr>
                <table width="100%" class="margintable" >
                    <tbody>
                    <tr align="center" class="margintd">
                        <td>线路</td>
                        <td>起始站</td>
                        <td>终点站</th>
                        <td>票价</td>
                        <td>最早发车时间</td>
                        <td>最晚发车时间</td>
                        <td>途经站点</td>
                    </tr>
                    <c:forEach items="${carinfo}" var="buscar" varStatus="status">
                        <tr align="center"
                            <c:if test="${status.index % 2 !=0}">style="background-color: #EEEEE0"</c:if>
                            <c:if test="${status.index % 2 ==0}">style="background-color: #C1FFC1"</c:if>
                        >
                            <td>${buscar.car_id}</td>
                            <td>${buscar.car_startstation}</td>
                            <td>${buscar.car_endstation}</td>
                            <td>${buscar.car_paymoney}</td>
                            <td>${buscar.car_starttime}</td>
                            <td>${buscar.car_endtime}</td>
                            <td>${buscar.car_station}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="page pageclass">
                    <span><a onclick="fistpage()" >首页</a></span>
                    <span><a  onclick="backpage()">上一页</a></span>
                    <input type="text" class="textinput" value="${page}" id="pagedrop">
                    <input type="text" class="textinput" value="${page}" hidden="hidden" id="pagehidden">
                    <a onclick="droppage()">跳页</a>共${num}页${sum}条/每页显示15条
                    <span><a  onclick="nextpage()">下一页</a></span>
                </div>
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
            <li id="menu-comunicacao" ><a ><i class="fa fa-book nav_icon"></i><span>公交信息导入</span><span class="fa fa-angle-right" style="float: right"></span></a>
                <ul id="menu-comunicacao-sub" >
                    <li id="menu-mensagens" style="width: 120px" ><a href="singleload">单条信息导入</a>
                    </li>
                    <li id="menu-arquivos" ><a href="/upload">批量信息导入</a></li>
                </ul>
            </li>
            <li><a href="/busselete"><i class="fa fa-map-marker"></i><span>公交信息查询</span></a></li>
            <li id="menu-academico" ><a href="/map"><i class="fa fa-file-text"></i><span>公交地图查询</span></a>
            </li>

            <li><a ><i class="fa fa-bar-chart"></i><span>公交信息管理</span><span class="fa fa-angle-right" style="float: right"></span></a>
                <ul id="carinfo" >
                    <li id="carinfoupdate" style="width: 160px" ><a href="/busupdate">公交信息的修改</a>
                    </li>
                    <li id="carinfodelete" ><a href="/busdelete">公交信息的删除</a></li>
                </ul>
            </li>
            <li><a ><i class="fa fa-cog"></i><span>设置</span><span class="fa fa-angle-right" style="float: right"></span></a>
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
    function nextpage() {
        if($("#car_startstation").val() == "" && $("#car_id").val() == "" && $("#car_endstation").val() == "" && $("#car_paymoney").val() == "" && $("#car_starttime").val() == "" && $("#car_endtime").val() == "" && $("#car_station").val() == "") {
            $.ajax({
                type: "POST",
                url: "/busseldeal",
                async: false,
                data: {page: $("#pagehidden").val()},
                success: function (data) {
                    if (data["nextpage"]) {
                        window.location.href = "/bussel";
                    } else {
                        alert("这已经是最后一页了。")
                    }
                },
                error: function (s) {
                    alert("错误" + s.responseText);
                }
            });
        }else {
            $.ajax({
                type: "POST",
                url: "/selectbusinfonext",
                async: false,
                data: {page: $("#pagehidden").val(),car_id:$("#car_id").val(),car_startstation:$("#car_startstation").val(),car_endstation:$("#car_endstation").val(),car_paymoney:$("#car_paymoney").val(),car_starttime:$("#car_starttime").val(),car_endtime:$("#car_endtime").val(),car_station:$("#car_station").val()},
                success: function (data) {
                    if (data["nextpageinfo"]) {
                        window.location.href = "/bussel";
                    } else {
                        alert("这已经是最后一页了。")
                    }
                },
                error: function (s) {
                    alert("错误" + s.responseText);
                }
            });
        }
    }
    function backpage() {
        if ($("#car_startstation").val() == "" && $("#car_id").val() == "" && $("#car_endstation").val() == "" && $("#car_paymoney").val() == "" && $("#car_starttime").val() == "" && $("#car_endtime").val() == "" && $("#car_station").val() == "") {
            $.ajax({
                type: "POST",
                url: "/busselback",
                async: false,
                data: {page: $("#pagehidden").val()},
                success: function (data) {
                    if (data["selback"]) {
                        window.location.href = "/bussel";
                    } else {
                        alert("不存在上一页。")
                    }
                },
                error: function (s) {
                    alert("错误" + s.responseText);
                }
            });
        }else {
            $.ajax({
                type: "POST",
                url: "/selectbusinfoback",
                async: false,
                data: {page: $("#pagehidden").val(),car_id:$("#car_id").val(),car_startstation:$("#car_startstation").val(),car_endstation:$("#car_endstation").val(),car_paymoney:$("#car_paymoney").val(),car_starttime:$("#car_starttime").val(),car_endtime:$("#car_endtime").val(),car_station:$("#car_station").val()},
                success: function (data) {
                    if (data["nextpageinfo"]) {
                        window.location.href = "/bussel";
                    } else {
                        alert("不存在上一页。")
                    }
                },
                error: function (s) {
                    alert("错误" + s.responseText);
                }
            });
        }
    }
    function droppage() {
        if ($("#car_startstation").val() == "" && $("#car_id").val() == "" && $("#car_endstation").val() == "" && $("#car_paymoney").val() == "" && $("#car_starttime").val() == "" && $("#car_endtime").val() == "" && $("#car_station").val() == "") {
            $.ajax({
                type: "POST",
                url: "/busseldrop",
                async: false,
                data: {page: $("#pagedrop").val()},
                success: function (data) {
                    if (data["droppage"]) {
                        window.location.href = "/bussel";
                    } else {
                        alert("请输入正确的页码。")
                    }
                },
                error: function (s) {
                    alert("错误" + s.responseText);
                }
            });
        }else {
            $.ajax({
                type: "POST",
                url: "/selectbusinfodrop",
                async: false,
                data: {page: $("#pagedrop").val(),car_id:$("#car_id").val(),car_startstation:$("#car_startstation").val(),car_endstation:$("#car_endstation").val(),car_paymoney:$("#car_paymoney").val(),car_starttime:$("#car_starttime").val(),car_endtime:$("#car_endtime").val(),car_station:$("#car_station").val()},
                success: function (data) {
                    if (data["droppagesel"]) {
                        window.location.href = "/bussel";
                    } else {
                        alert("请输入正确的页码。")
                    }
                },
                error: function (s) {
                    alert("错误" + s.responseText);
                }
            });
        }
    }
    function sele() {
        $.ajax({
            type:"POST",
            url:"/selectbusinfo",
            async:false,
            data:{car_id:$("#car_id").val(),car_startstation:$("#car_startstation").val(),car_endstation:$("#car_endstation").val(),car_paymoney:$("#car_paymoney").val(),car_starttime:$("#car_starttime").val(),car_endtime:$("#car_endtime").val(),car_station:$("#car_station").val()},
            success:function (data) {
                if(data["sele"]){
                    window.location.href = "/bussel";
                }
            },
            error:function(s){
                alert("错误"+s.responseText);
            }
        });
    }
    function fistpage() {
        if ($("#car_startstation").val() == "" && $("#car_id").val() == "" && $("#car_endstation").val() == "" && $("#car_paymoney").val() == "" && $("#car_starttime").val() == "" && $("#car_endtime").val() == "" && $("#car_station").val() == "") {
            window.location.href = "/busselete";
        }else
        {
            sele();
        }
    }
</script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<script src="js/bootstrap.js"> </script>
</body>
</html>