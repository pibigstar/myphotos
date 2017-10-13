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
html {
    overflow:hidden; 
    -ms-touch-action:none;
    -ms-content-zooming:none;
}
body {
    position:absolute;
    margin:0px;
    padding:0px;
    background:#fff;
    width:100%;
    height:100%;
}
#canvas {
    position:absolute;
    width:100%;
    height:100%;
    background:#fff;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/ge1doot.js"></script>
<script type="text/javascript">
    console.log('%c Pibigstar  ', 'text-shadow: 3px 1px 1px grey;background-image:-webkit-gradient( linear, left top, right top, color-stop(0, #f22), color-stop(0.15, #f2f), color-stop(0.3, #22f), color-stop(0.45, #2ff), color-stop(0.6, #2f2),color-stop(0.75, #2f2), color-stop(0.9, #ff2), color-stop(1, #f22) );color:transparent;-webkit-background-clip: text;font-size:5em;');
    console.log("%c 欢迎使用我的相册网站", "font-size:20pt");

(function () {
    /* ==== definitions ==== */
    var diapo = [], layers = [], ctx, pointer, scr, camera, light, fps = 0, quality = [1,2],
    // ---- poly constructor ----
    Poly = function (parent, face) {
        this.parent = parent;
        this.ctx    = ctx;
        this.color  = face.fill || false;
        this.points = [];
        if (!face.img) {
            // ---- create points ----
            for (var i = 0; i < 4; i++) {
                this.points[i] = new ge1doot.transform3D.Point(
                    parent.pc.x + (face.x[i] * parent.normalZ) + (face.z[i] * parent.normalX),
                    parent.pc.y +  face.y[i],
                    parent.pc.z + (face.x[i] * parent.normalX) + (-face.z[i] * parent.normalZ)
                );
            }
            this.points[3].next = false;
        }
    },
    // ---- diapo constructor ----
    Diapo = function (path, img, structure) {
        // ---- create image ----
        this.img = new ge1doot.transform3D.Image(
            this, path + img.img, 1, {
                isLoaded: function(img) {
                    img.parent.isLoaded = true;
                    img.parent.loaded(img);
                }
            }
        );
        this.visible  = false;
        this.normalX  = img.nx;
        this.normalZ  = img.nz;
        // ---- point center ----
        this.pc = new ge1doot.transform3D.Point(img.x, img.y, img.z);
        // ---- target positions ----
        this.tx = img.x + (img.nx * Math.sqrt(camera.focalLength) * 20);
        this.tz = img.z - (img.nz * Math.sqrt(camera.focalLength) * 20);
        // ---- create polygons ----
        this.poly = [];
        for (var i = -1, p; p = structure[++i];) {
            layers[i] = (p.img === true ? 1 : 2);
            this.poly.push(
                new Poly(this, p)
            );
        }
    },
    // ---- init section ----
    init = function (json) {
        // draw poly primitive
        Poly.prototype.drawPoly = ge1doot.transform3D.drawPoly;
        // ---- init screen ----
        scr = new ge1doot.Screen({
            container: "canvas"
        });
        ctx = scr.ctx;
        scr.resize();
        // ---- init pointer ----
        pointer = new ge1doot.Pointer({
            tap: function () {
                if (camera.over) {
                    if (camera.over === camera.target.elem) {
                        // ---- return to the center ----
                        camera.target.x = 0;
                        camera.target.z = 0;
                        camera.target.elem = false;
                    } else {
                        // ---- goto diapo ----
                        camera.target.elem = camera.over;
                        camera.target.x = camera.over.tx;
                        camera.target.z = camera.over.tz;
                        // ---- adapt tesselation level to distance ----
                        for (var i = 0, d; d = diapo[i++];) {
                            var dx = camera.target.x - d.pc.x;
                            var dz = camera.target.z - d.pc.z;
                            var dist = Math.sqrt(dx * dx + dz * dz);
                            var lev = (dist > 1500) ? quality[0] : quality[1];
                            d.img.setLevel(lev);
                        }
                    }
                }
            }
        });
        // ---- init camera ----
        camera = new ge1doot.transform3D.Camera({
            focalLength: Math.sqrt(scr.width) * 10,
            easeTranslation: 0.025,
            easeRotation: 0.06,
            disableRz: true
        }, {
            move: function () {
                this.over = false;
                // ---- rotation ----
                if (pointer.isDraging) {
                    this.target.elem = false;
                    this.target.ry = -pointer.Xi * 0.01;
                    this.target.rx = (pointer.Y - scr.height * 0.5) / (scr.height * 0.5);
                } else {
                    if (this.target.elem) {
                        this.target.ry = Math.atan2(
                            this.target.elem.pc.x - this.x,
                            this.target.elem.pc.z - this.z
                        );
                    }
                }
                this.target.rx *= 0.9;
            }
        });
        camera.z  = -10000;
        camera.py = 0;
        // ---- create images ----
        for (var i = 0, img; img = json.imgdata[i++];) {
            diapo.push(
                new Diapo(
                    json.options.imagesPath, 
                    img, 
                    json.structure
                )
            );
        }   
        // ---- start engine ---- >>>
        setInterval(function() {
            quality = (fps > 50) ? [2,3] : [1,2];
            fps = 0;
        }, 1000);
        run();
    },
    // ---- main loop ----
    run = function () {
        // ---- clear screen ----
        ctx.clearRect(0, 0, scr.width, scr.height);
        // ---- camera ----
        camera.move();
        // ---- draw layers ----
        for (var k = -1, l; l = layers[++k];) {
            light = false;
            for (var i = 0, d; d = diapo[i++];) {
                (l === 1 && d.draw()) || 
                (d.visible && d.poly[k].draw());
            }
        }
        // ---- cursor ----
        if (camera.over && !pointer.isDraging) {
            scr.setCursor("pointer");
        } else {
            scr.setCursor("move");
        }
        // ---- loop ----
        fps++;
        requestAnimFrame(run);
    };
    /* ==== prototypes ==== */
    Poly.prototype.draw = function () {
        // ---- color light ----
        var c = this.color;
        if (c.light || !light) {
            var s = c.light ? this.parent.light : 1;
            // ---- rgba color ----
            light = "rgba(" + 
                Math.round(c.r * s) + "," +
                Math.round(c.g * s) + "," + 
                Math.round(c.b * s) + "," + (c.a || 1) + ")";
            ctx.fillStyle = light;
        }
        // ---- paint poly ----
        if (!c.light || this.parent.light < 1) {
            // ---- projection ----
            for (
                var i = 0; 
                this.points[i++].projection();
            );
            this.drawPoly();
            ctx.fill();
        }
    }
    /* ==== image onload ==== */
    Diapo.prototype.loaded = function (img) {
        // ---- create points ----
        var d = [-1,1,1,-1,1,1,-1,-1];
        var w = img.texture.width  * 0.5;
        var h = img.texture.height * 0.5;
        for (var i = 0; i < 4; i++) {
            img.points[i] = new ge1doot.transform3D.Point(
                this.pc.x + (w * this.normalZ * d[i]),
                this.pc.y + (h * d[i + 4]),
                this.pc.z + (w * this.normalX * d[i])
            );
        }
    }
    /* ==== images draw ==== */
    Diapo.prototype.draw = function () {
        // ---- visibility ----
        this.pc.projection();
        if (this.pc.Z > -(camera.focalLength >> 1) && this.img.transform3D(true)) {
            // ---- light ----
            this.light = 0.5 + Math.abs(this.normalZ * camera.cosY - this.normalX * camera.sinY) * 0.6;
            // ---- draw image ----
            this.visible = true;
            this.img.draw();
            // ---- test pointer inside ----
            if (pointer.hasMoved || pointer.isDown) {
                if (
                    this.img.isPointerInside(
                        pointer.X,
                        pointer.Y
                    )
                ) camera.over = this;
            }
        } else this.visible = false;
        return true;
    }
    return {
        // --- load data ----
        load : function (data) {
            window.addEventListener('load', function () {
                ge1doot.loadJS(
                    "${myJs}/imageTransform3D.js",
                    init, data
                );
            }, false);
        }
    }
})().load({
    imgdata:[
        // north
        {img:'${qiniu}/resources/${name}/imgs/1.jpg', x:-1000, y:0, z:1500, nx:0, nz:1},
        {img:'${qiniu}/resources/${name}/imgs/2.jpg', x:0,     y:0, z:1500, nx:0, nz:1},
        {img:'${qiniu}/resources/${name}/imgs/3.jpg', x:1000,  y:0, z:1500, nx:0, nz:1},
        // east
        {img:'${qiniu}/resources/${name}/imgs/4.jpg', x:1500,  y:0, z:1000, nx:-1, nz:0},
        {img:'${qiniu}/resources/${name}/imgs/5.jpg', x:1500,  y:0, z:0, nx:-1, nz:0},
        {img:'${qiniu}/resources/${name}/imgs/6.jpg', x:1500,  y:0, z:-1000, nx:-1, nz:0},
        // south
        {img:'${qiniu}/resources/${name}/imgs/7.jpg', x:1000,  y:0, z:-1500, nx:0, nz:-1},
        {img:'${qiniu}/resources/${name}/imgs/8.jpg', x:0,     y:0, z:-1500, nx:0, nz:-1},
        {img:'${qiniu}/resources/${name}/imgs/9.jpg', x:-1000, y:0, z:-1500, nx:0, nz:-1},
        // west
        {img:'${qiniu}/resources/${name}/imgs/10.jpg', x:-1500, y:0, z:-1000, nx:1, nz:0},
        {img:'${qiniu}/resources/${name}/imgs/11.jpg', x:-1500, y:0, z:0, nx:1, nz:0},
        {img:'${qiniu}/resources/${name}/imgs/12.jpg', x:-1500, y:0, z:1000, nx:1, nz:0}
    ],
    structure:[
        {
            // wall
            fill: {r:255, g:255, b:255, light:1},
            x: [-1001,-490,-490,-1001],
            z: [-500,-500,-500,-500],
            y: [500,500,-500,-500]
        },{
            // wall
            fill: {r:255, g:255, b:255, light:1},
            x: [-501,2,2,-500],
            z: [-500,-500,-500,-500],
            y: [500,500,-500,-500]
        },{
            // wall
            fill: {r:255, g:255, b:255, light:1},
            x: [0,502,502,0],
            z: [-500,-500,-500,-500],
            y: [500,500,-500,-500]
        },{
            // wall
            fill: {r:255, g:255, b:255, light:1},
            x: [490,1002,1002,490],
            z: [-500,-500,-500,-500],
            y: [500,500,-500,-500]
        },{
            // shadow
            fill: {r:0, g:0, b:0, a:0.2},
            x: [-420,420,420,-420],
            z: [-500,-500,-500,-500],
            y: [150, 150,-320,-320]
        },{
            // shadow
            fill: {r:0, g:0, b:0, a:0.2},
            x: [-20,20,20,-20],
            z: [-500,-500,-500,-500],
            y: [250, 250,150,150]
        },{
            // shadow
            fill: {r:0, g:0, b:0, a:0.2},
            x: [-20,20,20,-20],
            z: [-500,-500,-500,-500],
            y: [-320, -320,-500,-500]
        },{
            // shadow
            fill: {r:0, g:0, b:0, a:0.2},
            x: [-20,20,10,-10],
            z: [-500,-500,-100,-100],
            y: [-500, -500,-500,-500]
        },{
            // base
            fill: {r:32, g:32, b:32},
            x: [-50,50,50,-50],
            z: [-150,-150,-50,-50],
            y: [-500,-500,-500,-500]
        },{
            // support
            fill: {r:16, g:16, b:16},
            x: [-10,10,10,-10],
            z: [-100,-100,-100,-100],
            y: [300,300,-500,-500]
        },{
            // frame
            fill: {r:255, g:255, b:255},
            x: [-320,-320,-320,-320],
            z: [0,-20,-20,0],
            y: [-190,-190,190,190]
        },{
            // frame
            fill: {r:255, g:255, b:255},
            x: [320,320,320,320],
            z: [0,-20,-20,0],
            y: [-190,-190,190,190]
        },
        {img:true},
        {
            // ceilingLight
            fill: {r:255, g:128, b:0},
            x: [-50,50,50,-50],
            z: [450,450,550,550],
            y: [500,500,500,500]
        },{
            // groundLight
            fill: {r:255, g:128, b:0},
            x: [-50,50,50,-50],
            z: [450,450,550,550],
            y: [-500,-500,-500,-500]
        }
    ],
    options:{
        imagesPath: ""
    }
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
                        <span>派大星</span>
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
                                    <span class="media-heading text-semibold">派大星</span>
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
                                        <li><a href="${prc }/${name}/show.do" id="layout1">童真</a></li>                          
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="icon-droplet2"></i> <span>轮播图相册</span></a>
                                        <ul>
                                        <li><a href="${prc }/${name}/show.do" id="layout1">童真</a></li>                          
                                    </ul>
                                </li>

                                <!-- 系统功能 -->
                                <li class="navigation-header"><span>系统功能</span> <i class="icon-menu" title="Forms"></i></li>
                                
                                <li>
                                    <a href="${prc }/fankui.jsp"><i class="icon-spell-check"></i> <span>反馈</span></a>
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

                    <div style="text-align:center;clear:both;"></div>
                    <canvas id="canvas">你的浏览器不支持HTML5画布技术，请使用谷歌浏览器。</canvas>
                    <audio src="${qiniu}/resources/${name }/mp3/love.mp3"  id="music"  autoplay="autoplay"></audio>


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
