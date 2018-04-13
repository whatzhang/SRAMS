<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Login login = (Login) session.getAttribute("login");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'upPass.jsp' starting page</title>


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

<link href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/art-content.js"></script>
</head>

<body style="height: 42em;">
	<div class="main-page">
		<div class="panel-info" style="padding-top : 5em;">
			<form class="form-horizontal" name="upPass" action="${pageContext.request.contextPath}/login/upPass" method="post">
				<br>
				<br>
				<div class="form-group mb-n">
					<label for="largeinput"
						class="col-sm-2 control-label label-input-lg">输入新密码</label>
					<div class="col-md-8">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="fa fa-book nav_icon" style="width: 0em"></i>
							</span> <input type="password" name="pass" class="form-control1" placeholder="">
						</div>
					</div>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput"
						class="col-sm-2 control-label label-input-lg">确认新密码</label>
					<div class="col-md-8">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="fa fa-book nav_icon" style="width: 0em"></i>
							</span> <input type="password" name="repass" class="form-control1" placeholder="">
						</div>
					</div>
				</div>
				<div class="form-group mb-n">
					<label class="col-sm-7 " align="center"><button
							type="submit" class="btn btn-danger">确认修改</button></label>
					<div class="col-sm-2" align="left">
						<button type="reset" class="btn btn-info">取消修改</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
