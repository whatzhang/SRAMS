<%@ page language="java" import="java.util.*,com.sust.entity.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<style type="text/css">
td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<div class="main-page">
		<div class="media" style="padding: 1em 1em 1em 1em;">
			<div class="panel-info">
				<div class=" panel-body-inputin">
					<form class="form-horizontal">
						<div class="form-group mb-n">
							<label for="largeinput" class=" control-label label-input-lg"
								style="margin-left: 2em; color: #e94e02;">选择查询条件及信息：</label>
						</div>
						<div class="form-group">
							<div class="col-sm-2" style="margin-left: 1em">
								<select class="form-control1">
									<option>论文名称</option>
									<option>发表时间</option>
									<option>发表期刊</option>
									<option>论文类别</option>
								</select>
							</div>
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg"
								style="color: #e94e02;">关键信息：</label>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
							<button type="submit" class="btn btn-success col-sm-1">查找</button>
							<a
								href="${pageContext.request.contextPath}/download/downloadTypeExcl?type=user"><button
									type="button" class="btn btn-success col-sm-2"
									style="float: right; margin-right: 2em;">导出用户信息Excel</button></a>
						</div>
					</form>
				</div>
			</div>
			<br>
			<div class="media" style="margin: 1em 1em 2em 1em; ">
				<div style="width: 60%;float: left;">
					<div class="panel-info">
						<div class="panel-heading success">用户登录信息</div>
						<table class="table table-bordered"
							style="table-layout: fixed; width: 100%;">
							<thead>
								<tr>
									<th
										style="text-align: center; vertical-align: middle;width: 4%;"><input
										type="checkbox" name="usId"></th>
									<th
										style="text-align: center; vertical-align: middle;width: 12%;">登录昵称</th>
									<th
										style="text-align: center; vertical-align: middle;width: 11%;">密码</th>
									<th
										style="text-align: center; vertical-align: middle;width: 7%;">权限类别</th>
									<th
										style="text-align: center; vertical-align: middle;width: 11%;">最后上线日期</th>
									<th
										style="text-align: center; vertical-align: middle;width: 7%;">状态</th>
									<th
										style="text-align: center; vertical-align: middle;width: 7%;">信息完善</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.loginList}" var="Ra">
									<tr data-toggle="modal"
										data-target="#myLookModal" onclick="showLoginInfo(${Ra.usId})">
										<td
											style="text-align: center; vertical-align: middle; width: 4%;"><input
											type="checkbox" value="${Ra.usId}" name="loId"></td>
										<td
											style="text-align: center; vertical-align: middle; width: 12%;"
											data-toggle="tooltip1" data-placement="top"
											title="${Ra.loLogin}">${Ra.loLogin}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 11%;"
											data-toggle="tooltip1" data-placement="top"
											title="${Ra.loPass}">${Ra.loPass}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 7%;"
											data-toggle="tooltip" data-placement="top"
											title="${Ra.loType}">${Ra.loType}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 11%;"
											data-toggle="tooltip1" data-placement="top"
											title="${Ra.loLogin}">${Ra.loLogin}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 7%;"
											data-toggle="tooltip1" data-placement="top"
											title="${Ra.loLogin}">${Ra.loLogin}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 7%;"
											data-toggle="tooltip1" data-placement="top"
											title="${Ra.loLogin}">${Ra.loLogin}</td>
									</tr>
								</c:forEach>
								<script>
									$(function() {
										$('[data-toggle="tooltip1"]').tooltip({
											container : 'body'
										});
									})
								</script>
							</tbody>
						</table>
						<p>
						<div style="float: left;">
							显示第${page.startRow}至${page.endRow}项/第${page.pageNum}页，共
							${page.total}项/${page.pages}页， 每页显示 <select id="pageSize1"
								onchange="rePages1()" size="1">
								<option value="${page.pageSize}">${page.pageSize}</option>
								<option value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
							</select>条记录
						</div>
						<div style="float:right;">
							<a
								href="${pageContext.request.contextPath}/users/getAllLogin?page=${page.firstPage}&pageSize=${ps}">第一页</a>
							<a
								href="${pageContext.request.contextPath}/users/getAllLogin?page=${page.nextPage}&pageSize=${ps}">下一页</a>
							<a
								href="${pageContext.request.contextPath}/users/getAllLogin?page=${page.prePage}&pageSize=${ps}">上一页</a>
							<a
								href="${pageContext.request.contextPath}/users/getAllLogin?page=${page.lastPage}&pageSize=${ps}">最后页</a>
						</div>
						</p>
					</div>
				</div>
				<div style="width: 37%; float: right;padding-top: 5px;">
					<div class="panel-info">
						<div class=" panel-body-inputin">
							<form class="form-horizontal" name="loginINFO" id="loginINFO">
								<div class="form-group mb-n">
									<div class="btn-group" style="margin-left: 1em;">
										<button type="button" class="btn btn-danger" id="loginChange"
											onclick="loginCh();">修改信息</button>
										<button type="button" class="btn btn-default" id="loginAdd"
											onclick="loginAd();">添加信息</button>
									</div>
								</div>
								<div class="form-group mb-n">
									<div class="col-sm-6">
										<input type="text" class="form-control1 input-lg" id="NName"
											title="登录昵称" placeholder="登录昵称" required="required">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control1 input-lg" id="PPass"
											title="登录密码" placeholder="登录密码" required="required">
									</div>
								</div>

								<div class="form-group mb-n">
									<div class="col-sm-6">
										<input type="text" class="form-control1 input-lg"
											id="LastTime" title="最后上线时间" placeholder="最后上线时间"
											required="required">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control1 input-lg" id="iSALL"
											title="信息是否完善" placeholder="信息是否完善" required="required">
									</div>
								</div>
								<div class="form-group mb-n">
									<div class="col-sm-6">
										<select class="form-control1" id="TType">
											<option>用户权限</option>
											<option value="user">普通用户</option>
											<option value="admin">管理员</option>
										</select>
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control1 input-lg" id="Status"
											title="账号状态" placeholder="账号状态" required="required">
									</div>
								</div>
								<br>
								<hr>
								<div class="form-group mb-n col-sm-6"
									style="padding-right: 2em; float: right;">
									<button style="float: right; margin-left: 1em;" type="reset"
										class="btn btn-info">重新填写</button>
									<button style="float: right;" type="submit"
										class="btn btn-success" onclick="return loginIsOp();">确认提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin: 0em 1em 0em 1em; ">
			<br>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<div class="panel-heading">用户详细信息</div>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr class="default">
							<th style="text-align: center; vertical-align: middle;width: 4%;"><input
								type="checkbox" name="usId"></th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">用户姓名</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">年龄</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">性别</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">生日</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">职称</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">专业</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">学/工号</th>
							<th style="text-align: center; vertical-align:middle;width: 11%;">联系地址</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">联系电话</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">E-mail</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">所属学院</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.usersList}" var="RaceList">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 4%;"><input
									type="checkbox" value="${RaceList.usId}" name="usId"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usName}">${RaceList.usName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usAge}">${RaceList.usAge}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"><c:if
										test="${RaceList.usSex==0}">女</c:if> <c:if
										test="${RaceList.usSex!=0}">男</c:if></td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usBirthday}">${RaceList.usBirthday}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usDuty}">${RaceList.usDuty}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usMajor}">${RaceList.usMajor}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usNum}">${RaceList.usNum}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 11%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usAddress}">${RaceList.usAddress}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usPhone}">${RaceList.usPhone}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usMail}">${RaceList.usMail}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.usAcademy}">${RaceList.usAcademy}</td>
								<th align="center"
									style="width: 5%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.6em;"><a
											href="javascript:void(0);"
											onclick="showUserMadel(${RaceList.usId},0)" title="修改用户信息">
												<i class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);"
											onclick="delUserInfo(${RaceList.usId});" title="删除用户"> <i
												class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal"
											onclick="showUserMadel(${RaceList.usId},1);"
											data-toggle="modal" data-target="#myLookModal" title="查看用户信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em; padding-left: 0.1em;"></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
						<script>
							$(function() {
								$('[data-toggle="tooltip"]').tooltip({
									container : 'body'
								});
							})
						</script>
					</tbody>
				</table>
				<p>
				<div style="float: left;">
					显示第${page1.startRow}至${page1.endRow}项/第${page1.pageNum}页，共
					${page1.total}项/${page1.pages}页， 每页显示<select id="pageSize"
						onchange="rePages()" size="1">
						<option value="${page1.pageSize}">${page1.pageSize}</option>
						<option value="10">10</option>
						<option value="25">25</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>条记录
				</div>
				<div style="float:right;">
					<a
						href="${pageContext.request.contextPath}/users/getAllUsers?page=${page1.firstPage}&pageSize=${ps1}">第一页</a>
					<a
						href="${pageContext.request.contextPath}/users/getAllUsers?page=${page1.nextPage}&pageSize=${ps1}">下一页</a>
					<a
						href="${pageContext.request.contextPath}/users/getAllUsers?page=${page1.prePage}&pageSize=${ps1}">上一页</a>
					<a
						href="${pageContext.request.contextPath}/users/getAllUsers?page=${page1.lastPage}&pageSize=${ps1}">最后页</a>
				</div>
				</p>
			</div>
			<hr>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<div class=" panel-body-inputin">
					<br>
					<form class="form-horizontal" name="userINFO" id="userINFO">
						<div class="form-group mb-n">
							<div class="btn-group" style="margin-left: 1em;">
								<button type="button" class="btn btn-danger" id="Change"
									onclick="change();">修改信息</button>
								<button type="button" class="btn btn-default" id="Add"
									onclick="add();">添加信息</button>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Name"
									title="用户姓名" placeholder="用户姓名" required="required">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Age"
									title="用户年龄" placeholder="用户年龄 " required="required">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Cdate"
									id="Cdate" title="出生日期" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4">
								<select class="form-control1" id="shenF" title="用户身份">
									<option>用户身份</option>
									<option>任职教师</option>
									<option>在校学生</option>
									<option>学校职工</option>
									<option>其他</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Num"
									title="学号/工号" placeholder="学号/工号" required="required">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Address"
									title="联系地址" placeholder="联系地址" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Phone"
									title="联系电话" placeholder="联系电话" required="required">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Mail"
									title="E-mail" placeholder="E-mail" required="required">
							</div>
							<div class="col-sm-4">
								<select class="form-control1" id="Xueyuan" title="所属学院">
									<option>所属学院</option>
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
									title="专业" placeholder="专业" required="required">
							</div>
							<div class="col-sm-4" style="display:none" id="FFF">
								<input type="text" class="form-control1 input-lg" id="loName"
									title="登录名称" placeholder="登录名称" required="required">
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
									title="密保问题一" placeholder="密保问题一" required="required">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Key1"
									title="预留答案一" placeholder="预留答案一" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Qu2"
									title="密保问题二" placeholder="密保问题二" required="required">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Key2"
									title="预留答案二" placeholder="预留答案二" required="required">
							</div>
						</div>
						<br>
						<hr>
						<div class="form-group mb-n col-sm-6"
							style="padding-right: 2em; float: right;">
							<button style="float: right;" type="reset" class="btn btn-info"
								onclick="reSet();">重新填写</button>
							<button style="float: right; margin-right: 1em;" type="submit"
								class="btn btn-success" onclick="return isOp();">确认提交</button>
						</div>
					</form>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="modal fade" id="myLookModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">详细信息</h4>
				</div>
				<div class="modal-body" style="margin: 1em 1em 0em 0.5em;">
					<div id="what">
						<table class="table" style="text-align: left;">
							<tbody style="font-size: 1em;">
								<tr>
									<td><label for="largeinput"
										class="control-label label-input-lg">用户姓名</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_na" id="th_na" readonly="true"></td>
									<td><label for="largeinput"
										class="control-label label-input-lg">用户年龄</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_ca" id="th_ca" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">出生日期</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_au" id="th_au" readonly="true"></td>
									<td><label for="largeinput"
										class=" control-label label-input-lg">用户身份</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_da" id="th_da" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">学号/工号</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_le" id="th_le" readonly="true"></td>
									<td><label for="largeinput"
										class=" control-label label-input-lg">联系地址</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_fa" id="th_fa" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">联系电话</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_is" id="th_is" readonly="true"></td>
									<td><label for="largeinput"
										class=" control-label label-input-lg">E-mail</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_nu" id="th_nu" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">所属学院</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_ja" id="th_ja" readonly="true"></td>
									<td><label for="largeinput"
										class=" control-label label-input-lg">专业</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_pa" id="th_pa" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">密保问题一</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_qq1" id="th_qq1" readonly="true"></td>
									<td><label for="largeinput"
										class=" control-label label-input-lg">预留答案一</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_pass1" id="th_pass1" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">密保问题二</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_qq2" id="th_qq2" readonly="true"></td>
									<td><label for="largeinput"
										class=" control-label label-input-lg">预留答案二</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_pass2" id="th_pass2" readonly="true"></td>
								</tr>
								<tr>
									<td><label for="largeinput"
										class=" control-label label-input-lg">用户性别</label></td>
									<td><input type="text" class="form-control1 input-lg"
										name="th_time" id="th_time" readonly="true"></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="info" style="margin-bottom: 1em;"><span>此用户暂时无具体信息,请及时上传！</span></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						style="margin-right: 1em;" data-dismiss="modal">确 &nbsp;定</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var flog = 1;
	var ms = "确认修改此信息？";
	var flogg = 1;
	var mss = "确认修改此信息？";
	var loid;
	var usid;
	function reSet() {
		$("#shenF").get(0).options[0].text = "用户身份";
		$("#Xueyuan").get(0).options[0].text = "所属学院";
	}
	function loginAd() {
		$("#loginChange").removeClass("btn btn-danger");
		$("#loginChange").addClass("btn btn-default");
		$("#loginAdd").addClass("btn btn-danger");
		$('#loginINFO')[0].reset();
		mss = "确认添加此信息？";
		flogg = 0;
	}
	function loginCh() {
		$("#loginAdd").removeClass("btn btn-danger");
		$("#loginAdd").addClass("btn btn-default");
		$("#loginChange").addClass("btn btn-danger");
		mss = "确认修改此信息？";
		flogg = 1;
	}
	function loginIsOp() {
		if (confirm(mss) == true) {
			if (flogg == 0) {
				addloginInfo();
			} else {
				uploginInfo();
			}
			return true;
		} else {
			return false;
		}
	}
	function addloginInfo() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/login/addloginInfo",
			data : {
				loLogin : $("#NName").val(),
				loPass : $("#PPass").val(),
				loLogin : $("#LastTime").val(),
				Status : $("#Status").val(),
				loType : $("#TType").val(),
				isALL : $("#iSALL").val()
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert(data.string1);
				location.reload();
			},
			error : function(data) {
				alert("addUserInfo error!");
			}
		});
	}
	function uploginInfo() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/login/updataLoginInfo",
			data : {
				usId : loid,
				loLogin : $("#NName").val(),
				loPass : $("#PPass").val(),
				loLogin : $("#LastTime").val(),
				Status : $("#Status").val(),
				loType : $("#TType").val(),
				isALL : $("#iSALL").val()
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert(data.string1);
				location.reload();			},
			error : function(data) {
				console.log("updateUserInfo error!");
			}
		});
	}
	function add() {
		$("#Change").removeClass("btn btn-danger");
		$("#Change").addClass("btn btn-default");
		$("#Add").addClass("btn btn-danger");
		ms = "确认添加此信息？";
		$('#userINFO')[0].reset();
		$("#shenF").get(0).options[0].text = "用户身份";
		$("#Xueyuan").get(0).options[0].text = "所属学院";
		$("#FFF").show();
		reSet();
		flog = 0;
	}
	function change() {
		$("#Add").removeClass("btn btn-danger");
		$("#Add").addClass("btn btn-default");
		$("#Change").addClass("btn btn-danger");
		$("#FFF").hide();
		ms = "确认修改此信息？";
		flog = 1;
	}
	function isOp() {
		if (confirm(ms) == true) {
			if (flog == 0) {
				addUserDataInfo();
			} else {
				upUserDataInfo();
			}
			return true;
		} else {
			return false;
		}
	}
	function chanceThis(usId) {
		document.getElementById("NumId").value = this.id;
		$(this).addClass("select").siblings().removeClass("select");
		$(this).find(":checkbox").attr("checked", true);
		$(this).find("td").addClass("backcolor_font");
		alert(usId);
	}
	function rePages1() {
		var page = $("#pageSize1").val();
		window.location.href = "${pageContext.request.contextPath}/users/getAllLogin?pageSize=" + page;
		window.parent.scrollTo(0, 0);
	}
	function rePages() {
		var page = $("#pageSize").val();
		window.location.href = "${pageContext.request.contextPath}/users/getAllUsers?pageSize=" + page;
		window.parent.scrollTo(0, 0);
	}
	function showLoginInfo(Id) {
		showLogin(Id);
		showUserMadel(Id, 1);
	}
	function showLogin(Id) {
		loid = Id;
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/login/getLoginInfo",
			data : {
				usId : Id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				$("#NName").val(data.loLogin);
				$("#PPass").val(data.loPass);
				$("#LastTime").val(data.loLogin);
				$("#Status").val(data.loLogin);
				$("#TType").get(0).options[0].text = data.loType;
				$("#iSALL").val(data.loLogin);
			},
			error : function(data) {
				alert("updateThesis error!");
			}
		});
	}
	function addUserDataInfo() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/users/addUserDataInfo",
			data : {
				loName : $("#loName").val(),
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
				usKey2 : $("#Key2").val()
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert(data.string1);
				location.reload();
			},
			error : function(data) {
				alert("update error!");
			}
		});
	}
	function upUserDataInfo() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/users/upUserInfoById",
			data : {
				usId : usid,
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
				usKey2 : $("#Key2").val()
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert("修改成功！");
				location.reload();
			},
			error : function(data) {
				alert("update error!");
			}
		});
	}
	function showUserMadel(id, fg) {
		usid = id;
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/users/getUserInfoById",
			data : {
				usId : id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				if (fg == 1) {
					if (data == null) {
						$("#what").hide();
						$("#info").show();
					} else {
				    	$("#info").hide();
				    	$("#what").show();
						showInModel(data);
						showInUpData(data);
					}
				} else {
					if (data == null) {
						$("#what").hide();
						$("#info").show();
					} else {
				    	$("#info").hide();
				    	$("#what").show();
						showInUpData(data);
					}
				}
			},
			error : function(data) {
				alert("getUserInfo error!");
			}
		});
	}
	function showInModel(data) {
		$("#th_na").val(data.usName);
		$("#th_ca").val(data.usAge);
		$("#th_time").val(data.usSex);
		$("#th_au").val(data.usBirthday);
		$("#th_le").val(data.usNum);
		$("#th_da").val(data.usDuty);
		$("#shenF").val(data.usDuty);
		$("#th_pa").val(data.usMajor);
		$("#th_fa").val(data.usAddress);
		$("#th_nu").val(data.usMail);
		$("#th_is").val(data.usPhone);
		$("#th_ja").val(data.usAcademy);
		$("#th_qq1").val(data.usQuestion1);
		$("#th_pass1").val(data.usKey1);
		$("#th_qq2").val(data.usQuestion2);
		$("#th_pass2").val(data.usKey2);
	}
	function showInUpData(data) {
		$("#Name").val(data.usName);
		$("#Age").val(data.usAge);
		$("#sex").val(data.usSex);
		$("#Cdate").val(data.usBirthday);
		$("#Num").val(data.usNum);
		$("#shenF").val(data.usDuty);
		$("#shenF").get(0).options[0].text = data.usDuty;
		$("#Majer").val(data.usMajor);
		$("#Address").val(data.usAddress);
		$("#Mail").val(data.usMail);
		$("#Phone").val(data.usPhone);
		$("#Xueyuan").get(0).options[0].text = data.usAcademy;
		$("#Qu1").val(data.usQuestion1);
		$("#Key1").val(data.usKey1);
		$("#Qu2").val(data.usQuestion2);
		$("#Key2").val(data.usKey2);
	}
	function delUserInfo(id) {
		var fg;
		if (confirm("确定要删除吗？") == true) {
			if (confirm("是否删除有关此用户的所有信息数据？")) {
				fg = "yes";
			} else {
				fg = 'no';
			}
			delUsersByID(id, fg);
		} else {
			return false;
		}
	}
	function delUsersByID(id, fg) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/users/DeleteUserInfo",
			data : {
				usId : id,
				fg : fg
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert(data.string1);
			    location.reload();
			},
			error : function(data) {
				alert("删除信息出错!");
			}
		});
	}
</script>
</html>

