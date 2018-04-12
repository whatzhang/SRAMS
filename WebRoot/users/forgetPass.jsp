<%@page import="com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>forgetPass</title>

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

<body>
	<%
		if (request.getAttribute("info") != null) {
	%>
	<script>
		window.onload = function() {
			alert("预留信息输入错误！");
		}
	</script>
	<%
		}
	%>
	<div class="panel panel-danger" style="margin: 5em 13em 5em 13em;">
		<div class="panel-heading" style="height: 3em;">
			<h2 class="panel-title" style="text-align: center;">找回密码</h2>
		</div>
		<div class="panel-body">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/login/forgetPass?kk1=${key1}&kk2=${key2}&id=${id}&qu1=${qu1}&qu2=${qu2}"
				name="forgetPass" method="post">
				<br>
				<div class="form-group mb-n">
					<label for="largeinput"
						class="col-sm-3 control-label label-input-lg">预留问题1</label> <label
						for="largeinput" class="col-sm-8 control-label label-input-lg"
						style="text-align: left;">${qu1}</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput"
						class="col-sm-3 control-label label-input-lg">预留密码1</label>
					<div class="col-md-8">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="fa fa-book nav_icon" style="width: 0em"></i>
							</span> <input type="text" class="form-control1" placeholder=""
								name="key1" id="key1" required="required">
						</div>
					</div>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput"
						class="col-sm-3 control-label label-input-lg">预留问题2</label> <label
						for="largeinput" class="col-sm-8 control-label label-input-lg"
						style="text-align: left;">${qu2}</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput"
						class="col-sm-3 control-label label-input-lg">预留密码2</label>
					<div class="col-md-8">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="fa fa-book nav_icon" style="width: 0em"></i>
							</span> <input type="text" class="form-control1" placeholder=""
								name="key2" id="key2" required="required">
						</div>
					</div>
				</div>
				<div class="form-group mb-n">
					<label class="col-sm-6 " align="center"><button
							type="submit" class="btn btn-danger">提交</button></label>
					<div class="col-sm-6" align="center">
						<button type="reset" class="btn btn-info"
							onclick="javascript:window.location.href='login.jsp'">取消</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
