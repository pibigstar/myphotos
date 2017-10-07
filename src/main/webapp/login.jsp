<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="css/login.css">
<title>用户登录</title>
</head>
<body>
	<div id="sky"></div>
	<div id="head"></div>
	<div id="middle">
		<form action="login.do" method="post">

			<ul style="text-align: center;">
				<li style="font-size: 48px">个人相册登录</li>
				<li><input class="name" name="username" value="${user.username }" placeholder="请输入用户名"></li>
				<li><input type="password" name="password" value="${user.password }" class="pwd" placeholder="请输入密码"></li>
				<li id="verifyCode" style="display: block;">
				<input id="valid" name="code" placeholder="请输入验证码" maxlength="4"> 
				<span id="validcode"> 
				<img id="verifyCodePic" onclick="this.src='createCode.do?d='+Math.random();" alt="验证码" src="createCode.do">  
				</span><span><a id="changeimg" href="javascript:changeCode()">换一张</a> </span></li>
				<li><button id="login" class="form_btn">立即登录</button></li>
				<li><span id="err" style="display: inline-block;"></span></li>
			</ul>
		</form>
	</div>
	<div id="footer">

		<a>关于我@qq741047261 &nbsp &nbsp|&nbsp &nbsp</a> <a>Copyright © 2015
			派大星 保留所有权利 沪ICP备110号-1</a>
	</div>
	<div id="cloud"></div>

<script src="js/jquery.js" type="text/javascript" charset="UTF-8"></script>
	
<script language='javascript' type='text/javascript'>
		$(document).ready(function() {
			init();

		});

		function init() {

			$(".name,.pwd,#valid").keyup(function(event) {
				if (event.keyCode == 13) {
					$('#login').click();
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