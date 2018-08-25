<%@ page language="java" import="java.util.*,com.sust.entity.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<form class="form-horizontal"
						action="${pageContext.request.contextPath}/project/findProjectInfo"
						id="findprojectInfo" name="findprojectInfo" method="get">
						<div class="form-group mb-n">
							<label for="largeinput" class=" control-label label-input-lg"
								style="margin-left: 2em; color: #e94e02;">选择查询条件及信息：</label> <a
								href="${pageContext.request.contextPath}/download/downloadAllTypeExcl?type=project"><button
									type="button" class="btn btn-success col-sm-1"
									style="float: right;margin-right: 2em;width: 10em;">导出所有信息为Excl</button></a>
							<button class="btn btn-danger" id="find" type="submit"
								style="float: right;margin-right: 2em;"
								onclick="return findInfo();">查询信息</button>
						</div>
						<div id="Project">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="ProCate" name="ProCate">
									<option value="">项目类别</option>
									<option value="基础理论研究">基础理论研究</option>
									<option value="应用性研究">应用性研究</option>
									<option value="其他">其他</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									立项时间&le;<input type="text" name="date6" title="立项时间"
										class="form-control1 input-lg" id="date6" style="width: 7em;">
									&ge;<input type="text" name="Cdate6" title="立项时间"
										class="form-control1 input-lg" id="Cdate6" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 15em;">
								<div class="form-group mb-n">
									立项金额 &le;<input type="text" name="bigMoney" title="立项金额"
										class="form-control1 input-lg" id="bigMoney"
										style="width: 5em;">&ge;<input type="text"
										name="smlMoney" title="立项金额" class="form-control1 input-lg"
										id="smlMoney" style="width: 5em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date7" title="文件上传时间"
										class="form-control1 input-lg" id="date7" style="width: 7em;">
									&ge;<input type="text" name="Cdate7" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate7" style="width: 7em;">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<c:if test="${isShow == 'yes'}">
					<div class="panel-heading success" style="vertical-align: middle;">
						查找信息 <a
							href="${pageContext.request.contextPath}/project/getAllProList"
							style="color: red;float: right;"> 取消查找信息 </a> <a
							href="${pageContext.request.contextPath}/project/downloadFind"
							style="color: red;float: right;margin-right: 1em;"> 导出查找信息 </a>
					</div>
					<table class="table table-bordered"
						style="table-layout: fixed; width: 100%;">
						<thead>
							<tr>
								<th
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" name="proId"></th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">项目名称</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">项目类别</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">立项时间</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">项目金额</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">项目负责人</th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">团队成员</th>
								<th
									style="text-align: center; vertical-align: middle; width: 21%;">获奖简介</th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">文件上传时间</th>
								<th
									style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.ProjectList}" var="proList">
								<tr>
									<td
										style="text-align: center; vertical-align: middle; width: 5%;"><input
										type="checkbox" value="${proList.proId}" name="proId"></td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proName}">${proList.proName}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proCategory}">${proList.proCategory}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proDate}">${proList.proDate}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proCash}">${proList.proCash}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proLeader}">${proList.proLeader}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proTeam}">${proList.proTeam}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 21%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proAbout}">${proList.proAbout}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${proList.proUptime}">${proList.proUptime}</td>
									<th align="center"
										style="width: 8%; text-align: center; vertical-align: middle;">
										<div style="width: 100%; height: 2em;">
											<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
												href="javascript:void(0);"
												onclick="showUpInfo(${proList.proId});" title="修改信息"> <i
													class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
											</a></li>
											<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
												href="${pageContext.request.contextPath}/download/downloadTypeFile?type=project&id=${proList.proId}&isFind=yes&role=AD"
												title="下载文件"> <i class="fa fa-download mail-icon"
													style="width: 1em; padding-left: 0.2em;"></i>
											</a></li>
											<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
												href="javascript:void(0);"
												onclick="delInfo(${proList.proId});" title="删除信息"> <i
													class="fa fa-trash-o mail-icon"
													style="width: 1em; padding-left: 0.2em;"></i>
											</a></li>
											<li
												style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
												href="#myLookModal" onclick="setInfo(${proList.proId});"
												data-toggle="modal" data-target="#myLookModal" title="查看信息">
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
						显示第${page1.startRow}至${page1.endRow}项/第${page1.nowPage}页，共
						${page1.totalCount}项/${page1.totalPage}页， 每页显示 <select
							id="pageSize1" onchange="rePages1()" size="1">
							<option value="${page1.pageSize}">${page1.pageSize}</option>
							<option value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>条记录
					</div>
					<div style="float:right;">
						<a
							href="${pageContext.request.contextPath}/project/getPage?page=${page1.firstPage}&pageSize=${ps1}">第一页</a>
						<a
							href="${pageContext.request.contextPath}/project/getPage?page=${page1.nextPage}&pageSize=${ps1}">下一页</a>
						<a
							href="${pageContext.request.contextPath}/project/getPage?page=${page1.prePage}&pageSize=${ps1}">上一页</a>
						<a
							href="${pageContext.request.contextPath}/project/getPage?page=${page1.lastPage}&pageSize=${ps1}">最后页</a>
					</div>
					</p>
				</c:if>
				<c:if test="${isShow != 'yes'}">
					<div class="panel-heading success" style="vertical-align: middle;">
						所有获奖信息</div>
					<table class="table table-bordered"
						style="table-layout: fixed; width: 100%;">
						<thead>
							<tr>
								<th
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" name="proId"></th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">项目名称</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">项目类别</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">立项时间</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">项目金额</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">项目负责人</th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">团队成员</th>
								<th
									style="text-align: center; vertical-align: middle; width: 21%;">获奖简介</th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">文件上传时间</th>
								<th
									style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.ProjectList}" var="RaceList">
								<tr>
									<td
										style="text-align: center; vertical-align: middle; width: 5%;"><input
										type="checkbox" value="${RaceList.proId}" name="proId"></td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proName}">${RaceList.proName}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proCategory}">${RaceList.proCategory}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proDate}">${RaceList.proDate}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proCash}">${RaceList.proCash}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proLeader}">${RaceList.proLeader}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proTeam}">${RaceList.proTeam}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 21%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proAbout}">${RaceList.proAbout}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.proUptime}">${RaceList.proUptime}</td>
									<th align="center"
										style="width: 8%; text-align: center; vertical-align: middle;">
										<div style="width: 100%; height: 2em;">
											<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
												href="javascript:void(0);"
												onclick="showUpInfo(${RaceList.proId});" title="修改信息"> <i
													class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
											</a></li>
											<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
												href="${pageContext.request.contextPath}/download/downloadTypeFile?type=project&id=${RaceList.proId}&role=AD"
												title="下载文件"> <i class="fa fa-download mail-icon"
													style="width: 1em; padding-left: 0.2em;"></i>
											</a></li>
											<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
												href="javascript:void(0);"
												onclick="delInfo(${RaceList.proId});" title="删除信息"> <i
													class="fa fa-trash-o mail-icon"
													style="width: 1em; padding-left: 0.2em;"></i>
											</a></li>
											<li
												style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
												href="#myLookModal" onclick="setInfo(${RaceList.proId});"
												data-toggle="modal" data-target="#myLookModal" title="查看信息">
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
						显示第${page.startRow}至${page.endRow}项/第${page.pageNum}页，共
						${page.total}项/${page.pages}页， 每页显示<select id="pageSize"
							onchange="rePages()" size="1">
							<option value="${page.pageSize}">${page.pageSize}</option>
							<option value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>条记录
					</div>
					<div style="float:right;">
						<a
							href="${pageContext.request.contextPath}/project/getAllProList?page=${page.firstPage}&pageSize=${ps}">第一页</a>
						<a
							href="${pageContext.request.contextPath}/project/getAllProList?page=${page.nextPage}&pageSize=${ps}">下一页</a>
						<a
							href="${pageContext.request.contextPath}/project/getAllProList?page=${page.prePage}&pageSize=${ps}">上一页</a>
						<a
							href="${pageContext.request.contextPath}/project/getAllProList?page=${page.lastPage}&pageSize=${ps}">最后页</a>
					</div>
					</p>
				</c:if>
			</div>
		</div>
		<div class="media">
			<div class="panel-info" style="padding: 0em 2em 1em 2em;"
				id="UpAndDe">
				<form class="form-horizontal" id="upAndaddRa" name="upAndaddRa">
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
							<input type="text" class="form-control1 input-lg" name="proName"
								title="项目名称" id="proName" placeholder="项目名称" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg"
								name="proCategory" title="项目类别" id="proCategory"
								placeholder="项目类别" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" name="Cdate" readonly="readonly" title="立项日期"
								class="form-control1 input-lg" id="Cdate" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="proCash"
								title="立项金额" name="proCash" placeholder="立项金额"
								required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg"
								name="proLeader" title="项目领导" id="proLeader" placeholder="项目领导"
								required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" name="proTeam"
								title="团队成员" id="proTeam" placeholder="项目团队" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-12">
							<textarea rows="2" class="form-control1 control2 "
								name="proAbout" id="proAbout" style="font-size: 1em;"
								placeholder="请简要描述论文信息，不超过200字" required="required"></textarea>
						</div>
					</div>
					<div class="form-group mb-n col-sm-6"
						style="padding-right: 2em; float: right;">
						<button style="float: right;" type="reset" class="btn btn-info"
							onclick="reSet();">重新填写</button>
						<button style="float: right; margin-right: 1em;" type="submit"
							class="btn btn-success" onclick="return isOp();">确认提交</button>
					</div>
				</form>
				<form class="form-horizontal" id="upFile" name="upFile"
					enctype="multipart/form-data">
					<div class="form-group mb-n "
						style="text-align: left; margin-left: 0.08em;">
						<div style="float: left;">
							<div class="btn btn-default btn-file" title="上传电子文件">
								<input type="file" name="upfile" id="upfile" size="1">
							</div>
							<p class="help-block">(格式为：zip/rar/doc/docx/pdf)Max.20MB</p>
						</div>
						<div style="text-align: left; margin-left: 0.08em;">
							<button style="margin-left: 2em;" type="button"
								class="btn btn-success" onclick="checkFile();">上&nbsp;传</button>
						</div>
					</div>
				</form>
			</div>
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
					<table class="table" style="text-align: left;">
						<tbody style="font-size: 1em;">
							<tr style="text-align: left; vertical-align: middle;">
								<td><label for="largeinput"
									class="control-label label-input-lg">项目名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_na" id="bo_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">项目类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_ca" id="bo_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">立项时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_da" id="bo_da" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">立项金额</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e1" id="bo_e1" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">项目领导</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e2" id="bo_e2" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">团队成员</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_pa" id="bo_pa" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_time" id="bo_time" readonly="true"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">项目简介</label></td>
							</tr>
							<tr>
								<td colspan="4"><textarea class="form-control1 control2"
										name="bo_ab" id="bo_ab" style="font-size: 1em; height: 10em;"
										readonly="true"></textarea></td>
							</tr>
						</tbody>
					</table>
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
    var idd = null;
    var ms = "确认修改此信息？";
	function add() {
		$("#Change").removeClass("btn btn-danger");
		$("#Change").addClass("btn btn-default");
		$("#Add").addClass("btn btn-danger");
		$("sureCh").button("确认添加");
		ms = "确认添加此信息？";
		$('#upAndaddRa')[0].reset();
		flog = 0;
	}
	function change() {
		$("#Add").removeClass("btn btn-danger");
		$("#Add").addClass("btn btn-default");
		$("#Change").addClass("btn btn-danger");
		$("sureCh").button("确认修改");
		ms = "确认修改此信息？";
		flog = 1;
	}
    function showInfo(data) {
    	$("#proName").val(data.proName);
		$("#proCategory").val(data.proCategory);
		$("#Cdate").val(data.proDate);
		$("#proCash").val(data.proCash);
		$("#proLeader").val(data.proLeader);
		$("#proTeam").val(data.proTeam);
		$("#proUptime").val(data.proUptime);
		$("#proAbout").val(data.proAbout);
	}
    function showInfoModel(data) {
    	$("#bo_na").val(data.proName);
		$("#bo_ca").val(data.proCategory);
		$("#bo_da").val(data.proDate);
		$("#bo_e1").val(data.proCash);
		$("#bo_e2").val(data.proLeader);
		$("#bo_pa").val(data.proTeam);
		$("#bo_time").val(data.proUptime);
		$("#bo_ab").val(data.proAbout);
		showInfo(data);
	}
    function setInfo(Id) {
    	idd = Id;
    	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/project/getProInfo",
			data : {
				ProId : Id
			},
			dataType : 'json',
			cache : true,
			async : true,
			success : showInfoModel,
			error : function(data) {
				alert("get error!");
			}
		});
	}
     function delInfo(deId){
	    var fg ;
	    if (confirm("确定要删除吗？") == true) {
		      if(confirm("是否删除电子文件？")){
		         fg = "yes";
		      }else{
		         fg = 'no';
		      }
			  delInfoOk(deId,fg);
	    } else {
			return false;
		}
	}
    function delInfoOk(deId,fg) {
    var too ={"deId" : deId,
			  "fg" : fg 
		     }
    	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/project/DeleteProInfo",
			data : too,
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data){
				alert(data.string1);
				location.reload();
			},
			error : function(data) {
				alert("删除信息出错!");
			}
		});
	}
    function showUpInfo(Id) {
    	idd = Id;
    	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/project/getProInfo",
			data : {
				ProId : Id
			},
			dataType : 'json',
			cache : true,
			async : true,
			success : showInfo,
			error : function(data) {
				alert("get error!");
			}
		});
	}
    function UpRaInfo() {
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/project/upProInfo",
			data : {
				usId : <%=login.getUsId()%>,
				ProId : idd,
				ProName : $("#proName").val(),
				ProCategory : $("#proCategory").val(),
				ProDate : $("#Cdate").val(),
				proCash : $("#proCash").val(),
				proLeader : $("#proLeader").val(),
				proTeam : $("#proTeam").val(),
				ProAbout : $("#proAbout").val()
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
    function addRaInfo() {
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/project/addProInfo",
			data : {
				usId : <%=login.getUsId()%>,
				ProName : $("#proName").val(),
				ProCategory : $("#proCategory").val(),
				ProDate : $("#Cdate").val(),
				proCash : $("#proCash").val(),
				proLeader : $("#proLeader").val(),
				proTeam : $("#proTeam").val(),
				ProAbout : $("#proAbout").val()
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert("添加成功！");
			    location.reload();
			}, 
			error : function(data) {
				alert("add error!");
			}
		});
	}
    function isOp() {
		if (confirm(ms) == true) {
			if (flog == 0) {
				addRaInfo();
			} else {
				UpRaInfo();
			}
			return true;
		} else {
			return false;
		}
	}
    function checkFile(){
        var allowtype =  ["doc","docx","pdf","rar","zip"];
		var filename = $("#upfile").val();  
		if(idd != null){
			if ($.inArray(filename.substring(filename.lastIndexOf(".")+1,filename.length).toLowerCase(),allowtype) == -1){
			    alert("请输入正确的格式(doc,docx,pdf,rar,zip)");
			}else{
				upFile();
			}
		}else{
			alert("选择要上传文件的信息！");
		}
	}
    function upFile(){
    	$("#upFile").ajaxSubmit({
            type : 'POST',
            url : "${pageContext.request.contextPath}/upload/uploadFileAjax?type=project",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data : {
            	ID : idd
            },
            success: function(data) {
	            alert(data.string1);
            },
            error: function (data){
                alert("出错");
            }  
         });
    }
    function rePages(){
  		 var page = $("#pageSize").val();
  		 window.location.href = "${pageContext.request.contextPath}/project/getAllProList?pageSize="+page;
         window.parent.scrollTo(0, 0);
   }
   function rePages1(){
		    var page = $("#pageSize1").val();
			window.location.href = "${pageContext.request.contextPath}/project/getPage?pageSize=" + page;
			window.parent.scrollTo(0, 0);
	}
	function findInfo() {
		if (confirm("确定要查找？")) {
			return true;
		} else {
			return false;
		}
	}
</script>
</html>