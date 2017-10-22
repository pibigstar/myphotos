<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="config/config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <!-- Global stylesheets -->
    <link href="${layoutCss}/fonts.css" rel="stylesheet" type="text/css">
    <link href="${layoutCss}/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
    <link href="${layoutCss}/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${layoutCss}/core.css" rel="stylesheet" type="text/css">
    <link href="${layoutCss}/components.css" rel="stylesheet" type="text/css">
    <link href="${layoutCss}/colors.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script type="text/javascript" src="${layoutJs}/plugins/loaders/pace.min.js"></script>
    <script type="text/javascript" src="${layoutJs}/core/libraries/jquery.min.js"></script>
    <script type="text/javascript" src="${layoutJs}/core/libraries/bootstrap.min.js"></script>
    <script type="text/javascript" src="${layoutJs}/plugins/loaders/blockui.min.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="${layoutJs}/plugins/forms/selects/select2.min.js"></script>
    <script type="text/javascript" src="${layoutJs}/plugins/forms/styling/uniform.min.js"></script>
    <script type="text/javascript" src="${layoutJs}/core/app.js"></script>
    <script type="text/javascript" src="${layoutJs}/pages/form_layouts.js"></script>
    <!-- /theme JS files -->
        
<style type="text/css">
            *{ margin:0; padding:0;}
            body{ background:#000; width:100%; height:100%; overflow:hidden}
            #wrap{ width:133px; height:200px; margin:25% auto 0;
                position:relative;
                top:-100px;
                transform-style:preserve-3d;
                transform:perspective(800px) rotateX(-10deg) rotateY(0deg);
                }
            #wrap ul li{
                list-style:none;
                width:120px;
                height:180px;
                position:absolute;
                top:0;left:0;
                border-radius:3px;
                box-shadow:0 0 10px #fff;
                background-size:100%;
                
                transform:rotateY(0deg) translateZ(0px);
                -webkit-box-reflect:below 10px -webkit-linear-gradient(top,rgba(0,0,0,0) 40%,rgba(0,0,0,.5) 100%);
            }
            #wrap p{ width:1200px; height:1200px; position:absolute; border-radius:100%;
                left:50%; top:100%; margin-left:-600px; margin-top:-600px;
                background:-webkit-radial-gradient(center center,600px 600px,rgba(50,50,50,1),rgba(0,0,0,0));
                transform:rotateX(90deg);}
        </style>

<script type="text/javascript">
    console.log('%c Pibigstar  ', 'text-shadow: 3px 1px 1px grey;background-image:-webkit-gradient( linear, left top, right top, color-stop(0, #f22), color-stop(0.15, #f2f), color-stop(0.3, #22f), color-stop(0.45, #2ff), color-stop(0.6, #2f2),color-stop(0.75, #2f2), color-stop(0.9, #ff2), color-stop(1, #f22) );color:transparent;-webkit-background-clip: text;font-size:5em;');
    console.log("%c 欢迎使用我的相册网站", "font-size:20pt");
    
    $(function(){
        var oL = $('#wrap ul li').size();
        var Deg = 360/oL;
        var xDeg = 0,yDeg = -10,xs,ys,p=null;

        for (var i=oL-1;i>=0;i--)
        {
            
            $('#wrap ul li').eq(i).css({
                transition:"1s "+(oL-i)*0.15+"s transform,.5s "+(1+oL*0.15)+"s opacity",
                'transform':'rotateY('+Deg*i+'deg) translateZ(350px)'
            });
        }
            
        
        $(document).mousedown(function(e){
            clearInterval(p);
            var x1 = e.clientX;
            var y1 = e.clientY;
            $(this).bind('mousemove',function(e){
                xs = e.clientX - x1;
                ys = e.clientY - y1;
                x1 = e.clientX;
                y1 = e.clientY;
                xDeg += xs*0.3;
                yDeg -= ys*0.1;
                $('#wrap').css('transform',"perspective(800px) rotateX("+yDeg+"deg) rotateY("+xDeg+"deg)");
            });
        }).mouseup(function(){
            $(this).unbind('mousemove');
            p = setInterval(function(){
                if(Math.abs(xs)<0.5&&Math.abs(ys)<0.5){clearInterval(p)};
                xs = xs*0.95;
                ys = ys*0.95
                xDeg += xs*0.3;
                yDeg -= ys*0.1;
                $('#wrap').css('transform',"perspective(800px) rotateX("+yDeg+"deg) rotateY("+xDeg+"deg)");
            },30);
        });
    
    });
</script>
    
</head>
<body>
    <!-- Main navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-header">
            <a class="navbar-brand" href="${prc}/index.jsp"><img src="${layoutImages}/logo_light.png" alt=""></a>

            <ul class="nav navbar-nav visible-xs-block">
                <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
                <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
            </ul>
        </div>

        <div class="navbar-collapse collapse" id="navbar-mobile">
            <ul class="nav navbar-nav">
                <li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
            </ul>

            
            <p class="navbar-text"><span class="label bg-success">在线</span></p>

            
            <!--更改语言 -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown language-switch">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${layoutImages}/flags/gb.png" class="position-left" alt="">简体中文
                        <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="english"><img src="${layoutImages}/flags/gb.png" alt=""> English</a></li>
                        <li><a class="english"><img src="${layoutImages}/flags/gb.png" alt=""> 简体中文</a></li>
                        <li><a class="espana"><img src="${layoutImages}/flags/es.png" alt=""> España</a></li>
                        
                    </ul>
                </li>

            
            <!--消息列表-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-bubbles4"></i>
                        <span class="visible-xs-inline-block position-right">Messages</span>
                        <span class="badge bg-warning-400">2</span>
                    </a>
                    
                    <div class="dropdown-menu dropdown-content width-350">
                        <div class="dropdown-content-heading">消息列表
                            <ul class="icons-list">
                                <li><a href="#"><i class="icon-compose"></i></a></li>
                            </ul>
                        </div>

                        <ul class="media-list dropdown-content-body">
                        
                            <li class="media">
                                <div class="media-left">
                                    <img src="${layoutImages}/placeholder.jpg" class="img-circle img-sm" alt="">
                                    <span class="badge bg-danger-400 media-badge">5</span>
                                </div>

                                <div class="media-body">
                                    <a href="#" class="media-heading">
                                        <span class="text-semibold">消息一</span>
                                        <span class="media-annotation pull-right">04:58</span>
                                    </a>

                                    <span class="text-muted">内容一</span>
                                </div>
                            </li>

                            <li class="media">
                                <div class="media-left">
                                    <img src="${layoutImages}/placeholder.jpg" class="img-circle img-sm" alt="">
                                    <span class="badge bg-danger-400 media-badge">4</span>
                                </div>

                                <div class="media-body">
                                    <a href="#" class="media-heading">
                                        <span class="text-semibold">消息二</span>
                                        <span class="media-annotation pull-right">12:16</span>
                                    </a>

                                    <span class="text-muted">内容二</span>
                                </div>
                            </li>

                        </ul>

                        <div class="dropdown-content-footer">
                            <a href="#" data-popup="tooltip" title="All messages"><i class="icon-menu display-block"></i></a>
                        </div>
                    </div>
                </li>

                <!--右边个人头像处菜单 -->
                <li class="dropdown dropdown-user">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${layoutImages}/placeholder.jpg" alt="">
                        <span>${user.username }</span>
                        <i class="caret"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="${prc }/user.jsp"><i class="icon-user-plus"></i> 个人中心</a></li>
                        <li><a href="#"><i class="icon-coins"></i> 我的作品</a></li>
                        <li><a href="#"><span class="badge bg-teal-400 pull-right">5</span> <i class="icon-comment-discussion"></i> 我的信息</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="icon-cog5"></i> 个人设置</a></li>
                        <li><a href="#"><i class="icon-switch2"></i> 注销</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>



    <!-- 菜单栏 -->
    <div class="page-container">


        <div class="page-content">

            <div class="sidebar sidebar-main">
                <div class="sidebar-content">

                    <!-- 左边头像处菜单 -->
                    <div class="sidebar-user">
                        <div class="category-content">
                            <div class="media">
                                <a href="#" class="media-left"><img src="${layoutImages}/placeholder.jpg" class="img-circle img-sm" alt=""></a>
                                <div class="media-body">
                                    <span class="media-heading text-semibold">${user.username }</span>
                                    <div class="text-size-mini text-muted">
                                        <i class="icon-pin text-size-small"></i> &nbsp;郑州
                                    </div>
                                </div>

                                <div class="media-right media-middle">
                                    <ul class="icons-list">
                                        <li>
                                            <a href="#"><i class="icon-cog3"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 左边菜单栏 -->
                    <div class="sidebar-category sidebar-category-visible">
                        <div class="category-content no-padding">
                            <ul class="navigation navigation-main navigation-accordion">

                                
                                <li class="navigation-header"><span>我的相册</span> <i class="icon-menu" title="我的菜单"></i></li>
                                <li class="active"><a href="${prc}/index.jsp"><i class="icon-home4"></i> <span>首页</span></a></li>
                                
                                <li>
                                    <a href="#"><i class="icon-copy"></i> <span>3D画廊相册</span></a>
                                    <ul>
                                    <c:forEach items="${photos }" var="photo">
                                    <c:if test="${photo.theme==1 }">
                                        <li><a href=""  id="layout1">${photo.name }</a></li>                         
                                    </c:if>
                                    </c:forEach>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="icon-droplet2"></i> <span>轮播图相册</span></a>
                                        <ul>
                                        <c:forEach items="${photos }" var="photo">
                                            <c:if test="${photo.theme==2 }">
                                                <li><a href=""  id="layout1">${photo.name }</a></li>                         
                                            </c:if>
                                        </c:forEach>                     
                                    </ul>
                                </li>
                                <!-- 系统功能end -->

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        <!-- 菜单栏 end-->


            <!-- 中间部分 -->
            <div class="content-wrapper">
                <!-- Page header -->
                <div class="page-header page-header-default">
                    <div class="page-header-content">
                        <div class="page-title">
                            <h4><i class="icon-arrow-left52 position-left"></i> <span class="text-semibold">首页</span> - 3D画廊</h4>
                        </div>

                        <div class="heading-elements">
                            <div class="heading-btn-group">
                                <a href="#" class="btn btn-link btn-float has-text"><i class="icon-bars-alt text-primary"></i><span>Statistics</span></a>
                                <a href="#" class="btn btn-link btn-float has-text"><i class="icon-calculator text-primary"></i> <span>Invoices</span></a>
                                <a href="#" class="btn btn-link btn-float has-text"><i class="icon-calendar5 text-primary"></i> <span>Schedule</span></a>
                            </div>
                        </div>
                    </div>

                    <div class="breadcrumb-line">
                        <ul class="breadcrumb">
                            <li><a href="${prc}/index.jsp"><i class="icon-home2 position-left"></i> 首页</a></li>
                            <li class="active">3D画廊</li>
                        </ul>

                        <ul class="breadcrumb-elements">
                            <li><a href="#"><i class="icon-comment-discussion position-left"></i> Support</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-gear position-left"></i>
                                    设置
                                    <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="#"><i class="icon-user-lock"></i> 个人信息设置</a></li>
                                    <li><a href="#"><i class="icon-statistics"></i> 绑定手机</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /中间头部 -->


                <!-- 中间区域 -->
                <div class="content">
                    <audio src="${qiniu}/${photo.mp3Path}"  id="music"  autoplay="autoplay"></audio>
                        <div id="wrap">
                            <ul>
                                <c:forTokens items="${photo.imgsPath}" delims="," var="imgPath">
                                    <li style="background-image:url(${qiniu}/${imgPath });"></li>
                                </c:forTokens>
                            </ul>
                            <p></p>
                        </div>

                    <!-- Footer -->
                    <div class="footer text-muted">
                        &copy; 2017. <a href="#">Limitless Web App Kit</a> by <a href="http://themeforest.net/user/Kopyov" target="_blank">Eugene Kopyov</a>
                    </div>
                    <!-- /footer -->

                </div>
                <!-- /content area -->

            </div>
            <!-- /main content -->

        </div>
        <!-- /page content -->

    </div>
    <!-- /page container -->

</body>
</html>
