<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
    <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="assets/css/core.css" rel="stylesheet" type="text/css">
    <link href="assets/css/components.css" rel="stylesheet" type="text/css">
    <link href="assets/css/colors.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
    <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
    <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
    <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>

    <script type="text/javascript" src="assets/js/core/app.js"></script>
    <script type="text/javascript" src="assets/js/pages/dashboard.js"></script>
    <!-- /theme JS files -->

</head>

<body>
<c:if test="${user==null }">
    <script>
    alert("请先登录");
    window.location.href="login.jsp";
    </script>
</c:if>
    <!-- Main navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo_light.png" alt=""></a>

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
                        <img src="assets/images/flags/gb.png" class="position-left" alt="">
                        简体中文
                        <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="english"><img src="assets/images/flags/gb.png" alt=""> English</a></li>
                        <li><a class="english"><img src="assets/images/flags/gb.png" alt=""> 简体中文</a></li>
                        <li><a class="espana"><img src="assets/images/flags/es.png" alt=""> España</a></li>
                        
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
                        <div class="dropdown-content-heading">
                            消息列表
                            <ul class="icons-list">
                                <li><a href="#"><i class="icon-compose"></i></a></li>
                            </ul>
                        </div>

                        <ul class="media-list dropdown-content-body">
                        
                            <li class="media">
                                <div class="media-left">
                                    <img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt="">
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
                                    <img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt="">
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
                        <img src="assets/images/placeholder.jpg" alt="">
                        <span>${user.username }</span>
                        <i class="caret"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#"><i class="icon-user-plus"></i> 个人中心</a></li>
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
                                <a href="#" class="media-left"><img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt=""></a>
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
                                <li class="active"><a href="index.jsp"><i class="icon-home4"></i> <span>首页</span></a></li>
                                
                                <li>
                                    <a href="#"><i class="icon-copy"></i> <span>3D画廊相册</span></a>
                                    <ul>
                                        <li><a href="${user.username}/show.do"  id="layout1">童真</a></li>                         
                                    </ul>
                                </li>
                                
                                <li>
                                    <a href="#"><i class="icon-droplet2"></i> <span>轮播图相册</span></a>
                                        <ul>
                                        <li><a href="${user.username}/show.do" id="layout1">童真</a></li>                         
                                    </ul>
                                    
                                </li>
                    

                                <!-- 系统功能 -->
                                <li class="navigation-header"><span>系统功能</span> <i class="icon-menu" title="系统设置"></i></li>
                                
                                
                                <li>
                                    <a href="fankui.jsp"><i class="icon-spell-check"></i> <span>反馈</span></a>               
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
                            <h4><i class="icon-arrow-left52 position-left"></i> <span class="text-semibold">首页</span> - 首页</h4>
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
                            <li><a href="index.jsp"><i class="icon-home2 position-left"></i> 首页</a></li>
                            <li class="active">Dashboard</li>
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