<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/jquery.js" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" href="css/login.css">
<title>用户注册</title>
</head>
<body>
<c:if test="${message!=null }">
    <script>
       $("#err").css("display", "inline-block");
       $("#err").text("验证码错误");
    </script>
</c:if>
    <div id="sky"></div>
    <div id="head"></div>
    <div id="middle">
        <form action="user.do?regist" method="post">

            <ul style="text-align: center;">
                <li style="font-size: 48px">个人相册注册</li>
                <li><input class="name" name="username"  placeholder="请输入用户名"></li>
                <li><input type="password" name="password"  class="pwd" placeholder="请输入密码"></li>
                <li id="verifyCode" style="display: block;">
                <input id="valid" name="code" placeholder="请输入验证码" maxlength="4"> 
                <span id="validcode"> 
                <img id="verifyCodePic" onclick="this.src='createCode.do?d='+Math.random();" alt="验证码" src="createCode.do">  
                </span><span><a id="changeimg" href="javascript:changeCode()">换一张</a> </span></li>
                <li><button class="form_btn" id="regist">立即注册</button></li>
                <li><span id="err" style="display: inline-block;"></span></li>
            </ul>
        </form>
    </div>
    <div id="footer">

        <a>关于我@qq741047261 &nbsp &nbsp|&nbsp &nbsp</a> <a>Copyright © 2017
            派大星 保留所有权利 沪ICP备110号-1</a>
    </div>
    <div id="cloud"></div>

<script language='javascript' type='text/javascript'>
        $(document).ready(function() {
            init();

        });

        function init() {

            $(".name,.pwd,#valid").keyup(function(event) {
                if (event.keyCode == 13) {
                    $('#regist').click();
                }

            });
            
            $("form").submit(function(event) {
                var account = $(".name").val();
                var pwd = $(".pwd").val();
                if (!account || !pwd) {
                    $("#err").css("display", "inline-block");
                    $("#err").text("请输入用户名或密码");
                    return false;
                }
                var code = $("#valid").val().toLocaleLowerCase();
                code = $.trim(code);
                if (code.length < 4) {
                    $("#err").css("display", "inline-block");
                    $("#err").text("验证码错误");
                    return false;
                }
            });
        }
        
        function changeCode(){
            $("#verifyCodePic").attr({src:'createCode.do?d=' + Math.random()});
        }
    </script>


</body>
</html>