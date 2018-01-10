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
                <%--内容--%>
                    <table class="word margin" style="border-collapse:separate; border-spacing:10px;">
                        <tbody>
                        <tr >
                            <td>
                                文件的上传：
                            </td>
                            <td>
                                <form enctype="multipart/form-data" method="post" action="" id="choosefile" >
                                    <input type="file"  name="file" id="file" class="margin02"/>
                                    <input type="submit" value="上传文件" id="submitBtn" onclick="upload()" class="margin02" />
                                </form>
                                <script type="text/javascript">
                                    function upload() {
                                        var formData = new FormData($("#choosefile")[0]);
                                        if(formData.__proto__ == formData){
                                            alert("请选择文件！")
                                        }
                                        $.ajax({
                                            url: "/getupload",
                                            data: formData,
                                            type: "Post",
                                            async : false,
                                            cache: false,//上传文件无需缓存
                                            processData: false,//用于对data参数进行序列化处理 这里必须false
                                            contentType: false, //必须
                                            beforeSend:function(){
                                                console.log("正在进行，请稍候");
                                            },
                                            success: function (data) {
                                                if(data["suc"]) {
                                                    alert("上传成功");
                                                }else{
                                                    alert("路线:"+data["loadmsg"]+"已存在");
                                                }
                                            },
                                            error:function(s){
                                                alert("错误"+s.responseText);
                                            }
                                        })
                                    }
                                </script>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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
                    <li id="menu-mensagens" style="width: 160px" ><a href="/singleload">单条信息导入</a>
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
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<script src="js/bootstrap.js"> </script>
</body>
</html>