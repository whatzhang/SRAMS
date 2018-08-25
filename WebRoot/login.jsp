<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>科研归档管理系统登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<link href="css/style.css" rel='stylesheet' type='text/css' />

<link href="css/font-awesome.css" rel="stylesheet">

<script src="js/jquery-1.11.1.min.js"></script>

<script src="js/bootstrap.js"></script>

<style type="text/css">
* {
	margin: 0px auto;
}

#world {
	position: absolute;
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: linear-gradient(#e4e0ba, #f7d9aa);
	input: -webkit-autofill{ box-shadow: 0 0 0px 1000px white inset
		!important;
}

}
body {
	background: url(${pageContext.request.contextPath}/img/hr_login.png);
	background-size : cover;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	margin: 9em 8em 5em 8em;
}

</style>
<script type="text/javascript">
	function checkAccount() {
		var sc = document.getElementById("account").value;
		if (sc == "") {
			alert("输入用户名");
			return false;
		} else {
			document.getElementById("acc").value = sc;
			return true;
		}
	}
</script>
</head>
<body>
	<div id="page-wrapper"
		style="position: absolute; float: right; z-index: 1000; right: 16em; top: 14em;">
		<div class="main-page general">
			<div class=" panel-grids" style="width: 25em;">
				<div class="panel panel-danger">
					<div class="panel-heading" style="padding: 1.5em 0em 1.5em 0em;font-family: SimHei; ">
						<p style="font-size: 1.9em;  text-align: center;">欢迎登录科研成果归档系统
						</p>
					</div>
					<div class="login-body" style="margin-bottom: 1em;">
						<span>${loginInfo}</span>
						<form action="${pageContext.request.contextPath}/login/index"
							name="login" method="post">
							<div class="form-group mb-n" style="margin-top: 0.5em;">
								<input type="text" class="form-control1 input-lg" name="account"
									id="account" style="width: 100%;" id="largeinput"
									placeholder="请输入您的账号" required="required">
							</div>
							<div class="form-group mb-n" style="margin-top: 1.5em;">
								<input type="password" class="form-control1 input-lg"
									name="password" id="password" style="width: 100%;"
									id="largeinput" required="required">
							</div>
							<div class="form-group mb-n" style="margin-top: 1em;">
								<label class="checkbox-inline" style=""> <input checked
									name="radio" type="radio" value="user"><span>普通用户</span>
								</label> <label class="checkbox-inline " style="text-align: center;">
									<input name="radio" type="radio" value="admin"><span>管理员</span>
								</label> <label class="checkbox-inline " style="text-align: center;">
									<input name="radio" type="radio" value="super"><span>超级管理员</span>
								</label>
							</div>
							<div class="form-group mb-n" style="margin-top: 1em;">
								<canvas id="canvas" width="100" height="40" style=""></canvas>
								<input type="text" class="form-control1 input-lg" name="pic"
									id="pic" style="width: 60%;float: right;" placeholder="输入验证码">
							</div>
							<div class="form-group mb-n"
								style="margin-top: 1.5em;margin-bottom: 1em;">
								<input class="form-control btn btn-danger" type="submit"
									style="height: 2.5em;" value="登录系统" onclick="return check()" />
							</div>
						</form>

						<form action="${pageContext.request.contextPath}/login/findPass"
							name="findPass" id="findPass" method="post">
							<div class="form-group mb-n ">
								<input type="hidden" name="acc" id="acc"> <a
									href="javascript:document.findPass.submit();"
									onclick="return checkAccount()" id="aa"> <span
									style="float: left; color: #a94442;">忘记密码</span></a> <a
									href="${pageContext.request.contextPath}/users/register.jsp">
									<span style="float: right; color: #a94442;">注册账号</span>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<p style="position:absolute; bottom: 2em;left:0em; text-align: center;width: 100%;">
		<a href="${pageContext.request.contextPath}/index.jsp" target="_blank"> 科研成果归档系统 </a> &nbsp;&copy;学生：张勇 &nbsp;&copy;指导老师：王长浩
	</p>
	<%
		if (request.getAttribute("pass") != null) {
	%>
	<script>
		window.onload = function() {
			alert("您的密码为：${pass} 请牢记！");
		}
	</script>
	<%
		}
	%>
	
	<script src="js/three.min.js"></script>
	<script>
		var show_num = [];
		draw(show_num);
		$("#canvas").on('click', function() {
			draw(show_num);
		})
		function check() {
			var val = $("#pic").val().toLowerCase();
			var num = show_num.join("");
			if (val == '') {
				alert('请输入验证码！');
				return false;
			} else if (val == num) {
				$("#pic").val('');
				draw(show_num);
				return true;
			} else {
				alert('验证码错误！请重新输入！');
				$("#pic").val('');
				draw(show_num);
				return false;
			}
		}
		function draw(show_num) {
			var canvas_width = $('#canvas').width();
			var canvas_height = $('#canvas').height();
			var canvas = document.getElementById("canvas"); //获取到canvas的对象，演员
			var context = canvas.getContext("2d"); //获取到canvas画图的环境，演员表演的舞台
			canvas.width = canvas_width;
			canvas.height = canvas_height;
			var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
			var aCode = sCode.split(",");
			var aLength = aCode.length; //获取到数组的长度
	
			for (var i = 0; i <= 3; i++) {
				var j = Math.floor(Math.random() * aLength); //获取到随机的索引值
				var deg = Math.random() * 30 * Math.PI / 180; //产生0~30之间的随机弧度
				var txt = aCode[j]; //得到随机的一个内容
				show_num[i] = txt.toLowerCase();
				var x = 10 + i * 20; //文字在canvas上的x坐标
				var y = 20 + Math.random() * 8; //文字在canvas上的y坐标
				context.font = "bold 23px 微软雅黑";
	
				context.translate(x, y);
				context.rotate(deg);
	
				context.fillStyle = randomColor();
				context.fillText(txt, 0, 0);
	
				context.rotate(-deg);
				context.translate(-x, -y);
			}
			for (var i = 0; i <= 5; i++) { //验证码上显示线条
				context.strokeStyle = randomColor();
				context.beginPath();
				context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
				context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
				context.stroke();
			}
			for (var i = 0; i <= 30; i++) { //验证码上显示小点
				context.strokeStyle = randomColor();
				context.beginPath();
				var x = Math.random() * canvas_width;
				var y = Math.random() * canvas_height;
				context.moveTo(x, y);
				context.lineTo(x + 1, y + 1);
				context.stroke();
			}
		}
	
		function randomColor() { //得到随机的颜色值
			var r = Math.floor(Math.random() * 256);
			var g = Math.floor(Math.random() * 256);
			var b = Math.floor(Math.random() * 256);
			return "rgb(" + r + "," + g + "," + b + ")";
		}
	
	</script>
</body>
</html>