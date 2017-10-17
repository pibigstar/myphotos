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
    
    <script type="text/javascript" src="${layoutJs}/pages/uploader_bootstrap.js"></script>
    <script type="text/javascript" src="${layoutJs}/plugins/uploaders/fileinput.min.js"></script>
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
            <a class="navbar-brand" href="index.jsp"><img src="${layoutImages}/logo_light.png" alt=""></a>

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
                        <div class="dropdown-content-heading"> 消息列表
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
                        <li><a href="${prc }/myphotos.jsp"><i class="icon-coins"></i> 我的作品</a></li>
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
                                <a href="${prc }/user.jsp" class="media-left"><img src="${layoutImages}/placeholder.jpg" class="img-circle img-sm" alt=""></a>
                                <div class="media-body">
                                    <span class="media-heading text-semibold">${user.username }</span>
                                    <div class="text-size-mini text-muted">
                                        <i class="icon-pin text-size-small"></i> &nbsp;郑州
                                    </div>
                                </div>

                                <div class="media-right media-middle">
                                    <ul class="icons-list">
                                        <li>
                                            <a href="${prc }/user.jsp"><i class="icon-cog3"></i></a>
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


            <!-- 中间 -->
            <div class="content-wrapper">
                <!-- 中间头部 -->
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
                            <li class="active">我的相册</li>
                        </ul>
                        <ul class="breadcrumb-elements">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-gear position-left"></i>设置
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="user.jsp"><i class="icon-user-lock"></i> 个人信息设置</a></li>
                                    <li><a href="#"><i class="icon-statistics"></i> 绑定手机</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /中间头部 -->


                <!-- 中间中部 -->
                <div class="content">

                    <div class="row">
                        <div class="col-md-12">
                            <form action="${prc }/createPhoto.do" method="post"  enctype="multipart/form-data">
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">
                                                <h5 class="panel-title">相册生成</h5>
                                                <div class="heading-elements">
                                                    <ul class="icons-list">
                                                        <li><a data-action="collapse"></a></li>
                                                        <li><a data-action="reload"></a></li>
                                                        <li><a data-action="close"></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <div class="row">
                                                <div class="col-md-10 col-md-offset-1">
                                            
                                                <div class="form-group">
                                                    <label>图片上传:</label>
                                                    <div class="col-lg-12">
                                                    <input type="file" name="imagesFile" class="file-input-ajax" multiple="multiple">
                                                    <span class="help-block">请选择你要上传的图片，一次最多只能上传12张</span>
                                                    </div>
                                                </div>
                                            
                                            
                                                <div class="form-group">
                                                    <label>相册名:</label>
                                                    <input type="text" name="name" class="form-control" placeholder="请输入相册名">
                                                    <input type="hidden" name="username" value="${user.username }" class="form-control" >
                                                </div>

                                                <div class="form-group">
                                                    <label>主题:</label>
                                                    <select name="theme" class="form-control">
                                                        <option value="1">3D画廊</option>
                                                        <option value="2">圆播图</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>背景音乐:</label>
                                                    <input name="mp3File" type="file" class="file-styled">
                                                    <span class="help-block">默认背景音乐为love.mp3,只能上传MP3文件</span>
                                                </div>

                                                <div class="form-group">
                                                    <label>相册描述:</label>
                                                    <textarea name="desc" rows="5" cols="5" class="form-control" placeholder="请输入你对此相册的描述"></textarea>
                                                </div>

                                                <div class="text-right">
                                                    <button type="submit" class="btn btn-primary">上传 <i class="icon-arrow-right14 position-right"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </form>
                 </div>


                    <!-- 中间中部的底部 -->
                    <div class="footer text-muted">
                        &copy; 2017. <a href="#">Limitless Web App Kit</a> by <a href="http://themeforest.net/user/Kopyov" target="_blank">Eugene Kopyov</a>
                    </div>
                    <!-- /中间中部的底部 -->

                </div>
                <!-- /中间中部 -->

            </div>
            <!-- /中间 -->
        </div>
    </div>
</body>
</html>
