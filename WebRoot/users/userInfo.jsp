<%@ page language="java" import="java.util.*,com.sust.entity.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Login login = (Login) session.getAttribute("login");
	if (login == null) {
		response.sendRedirect(basePath + "index.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userInfo.jsp' starting page</title>

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

<body style="height: 55em;">
	<div class="main-page">
		<div class="media"
			style="margin: 2em 2em 2em 2em; padding: 2em 0 1em 0;">
			<%
		     	String ty = (String) request.getAttribute("type");
				if ("info".equals(ty)) {
			%>
			<div class="panel-info">
				<div class=" panel-body-inputin">
					<br>
					<form class="form-horizontal" name="userInfo" id="userInfo">
						<div class="form-group mb-n">
							<div class="btn-group" style="margin-left: 1em;">
								<button type="button" class="btn btn-danger" id="Change"
									onclick="show();">展示信息</button>
								<button type="button" class="btn btn-default" id="Add"
									onclick="upDate();">修改信息</button>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Name"
									title="用户姓名" placeholder="用户姓名" value="${user.usName}"
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Age"
									title="用户年龄" placeholder="用户年龄 " value="${user.usAge}"
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Cdate"
									id="Cdate" title="出生日期" value="${user.usBirthday}"
									readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4">
								<select class="form-control1" id="shenF" title="用户身份">
									<option>${user.usDuty}</option>
									<option>任职教师</option>
									<option>在校学生</option>
									<option>学校职工</option>
									<option>其他</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Num"
									title="学号/工号" placeholder="学号/工号" value="${user.usNum}"
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Address"
									title="联系地址" placeholder="联系地址" value="${user.usAddress}"
									readonly="readonly">
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Phone"
									title="联系电话" placeholder="联系电话" value="${user.usPhone}"
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Mail"
									title="E-mail" placeholder="E-mail" value="${user.usMail}"
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<select class="form-control1" id="Xueyuan" title="所属学院">
									<option>${user.usAcademy}</option>
									<option>学院1</option>
									<option>学院2</option>
									<option>学院3</option>
									<option>其他</option>
								</select>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Majer"
									title="专业" placeholder="专业" value="${user.usMajor}"
									readonly="readonly">
							</div>
							<div class="col-sm-4" title="用户性别">
								<div class="radio-inline">
									<label><input type="radio" id="sex" name="sex"
										value="1" checked> 男</label>
								</div>
								<div class="radio-inline">
									<label><input type="radio" id="sex" name="sex"
										value="0"> 女</label>
								</div>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Qu1"
									title="密保问题一" placeholder="密保问题一" value="${user.usQuestion1}"
									readonly="readonly">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Key1"
									title="预留答案一" placeholder="预留答案一" value="${user.usKey1}"
									readonly="readonly">
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Qu2"
									title="密保问题二" placeholder="密保问题二" value="${user.usQuestion2}"
									readonly="readonly">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Key2"
									title="预留答案二" placeholder="预留答案二" value="${user.usKey2}"
									readonly="readonly">
							</div>
						</div>
						<br>
						<hr>
						<div class="form-group mb-n">
							<a href="${pageContext.request.contextPath}/thesis/getThInfo">
								<button type="button" style="float: right; margin-right: 3em;"
									class="btn btn-info">返回</button>
							</a>
							<button style="float: right; margin-right: 1em;" type="submit"
								class="btn btn-danger" onclick="return checkChang();">确认修改</button>
						</div>
					</form>
				</div>
			</div>
			<div class="clearfix"></div>
			<%
				} else {
			%>
			<div class="panel-info" style="padding-top : 4em;">
				<form class="form-horizontal" name="upPass" id="upPass">
					<br> <br>
					<div class="form-group mb-n">
						<label for="largeinput"
							class="col-sm-2 control-label label-input-lg">输入新密码</label>
						<div class="col-md-8">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="fa fa-book nav_icon" style="width: 0em"></i>
								</span> <input type="password" name="pass" id="pass"
									class="form-control1" placeholder="">
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
								</span> <input type="password" name="repass" id="repass"
									class="form-control1" placeholder="">
							</div>
						</div>
					</div>
					<br><br>
					<hr>
					<div class="form-group mb-n">
						<a href="${pageContext.request.contextPath}/thesis/getThInfo">
							<button type="button" style="float: right; margin-right: 4em;"
								class="btn btn-info">返回</button>
						</a>
						<button style="float: right; margin-right: 1em;" type="submit"
							class="btn btn-danger" onclick="return checkPass();">确认修改</button>
					</div>
				</form>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<script type="text/javascript">
	    var flog = 1;
	    var usId ;
	    var ms = "确认修改此信息？";
		function upDate() {
			$("#userInfo input").attr("readonly",false);
			$("#Change").removeClass("btn btn-danger");
			$("#Change").addClass("btn btn-default");
			$("#Add").addClass("btn btn-danger");
			flog = 0;
		}
		function show() {
			$("#userInfo input").attr("readonly",true);
			$("#Add").removeClass("btn btn-danger");
			$("#Add").addClass("btn btn-default");
			$("#Change").addClass("btn btn-danger");
			flog = 1;
		}
		function checkChang() {
			if(confirm(ms)){
				upUserInfo();
				return true;
			}else{
				return false;
			}
		}
		function upUserInfo() {
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/users/upUserInfo",
				data : {
					usId : <%=login.getUsId()%>,
					usName : $("#Name").val(),
					usAge : $("#Age").val(),
					usSex : $("#sex").val(),
					usBirthday : $("#Cdate").val(),
					usNum : $("#Num").val(),
					usDuty : $("#shenF").val(),
					usMajor : $("#Majer").val(),
					usAddress : $("#Address").val(),
					usMail : $("#Mail").val(),
					usPhone : $("#Phone").val(),
					usAcademy : $("#Xueyuan").val(),
					usQuestion1 : $("#Qu1").val(),
					usKey1 : $("#Key1").val(),
					usQuestion2 : $("#Qu2").val(),
					usKey2 : $("#Key2").val(),
				},
				dataType : 'json',
				cache : false,
				async : false,
				success : function(data) {
					 alert("修改成功！");
					 window.location.href = "${pageContext.request.contextPath}/thesis/getThInfo";
				}, 
				error : function(data) {
					alert("update error!");
				}
			});
		}
		function checkPass(){
			if($("#pass").val() == $("#repass").val()){
			    if(confirm(ms)){
					upPassword();
					return true;
				}else{
					return false;
				}
			}else{
			   alert("两次输入密码不一致！")
			   return false;
			}
		}
		
		function upPassword(){
		$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/login/upPass",
				data : {
					Pass : $("#repass").val()
				},
				dataType : 'json',
				cache : false,
				async : false,
				success : function(data) {
					alert("修改密码成功！");
					 window.location.href = "${pageContext.request.contextPath}/thesis/getThInfo";
				}, 
				error : function(data) {
					alert("update error!");
				}
			});
		}
	</script>
</body>
</html>
