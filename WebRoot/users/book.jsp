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
			<div class="panel-info" style="margin: 1em 0em 4em 0em;">
				<div class=" panel-body-inputin">
					<form class="form-horizontal"
						action="${pageContext.request.contextPath}/book/findUserBookInfo"
						id="findbookInfo" name="findbookInfo" method="get">
						<div class="form-group mb-n">
							<label for="largeinput" class=" control-label label-input-lg"
								style="margin-left: 2em; color: #e94e02;">选择查询条件及信息：</label> <a
								href="${pageContext.request.contextPath}/download/downloadTypeExcl?type=book"><button
									type="button" class="btn btn-success col-sm-1"
									style="float: right;margin-right: 2em;width: 10em;">导出所有信息为Excl</button></a>
							<button class="btn btn-danger" id="find" type="submit"
								style="float: right;margin-right: 2em;"
								onclick="return findInfo();">查询信息</button>
						</div>
						<div id="Book">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="BoCate" name="BoCate">
									<option value="">项目类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									出版时间&le;<input type="text" name="date8" title="出版时间"
										class="form-control1 input-lg" id="date8" style="width: 7em;">
									&ge;<input type="text" name="Cdate8" title="出版时间"
										class="form-control1 input-lg" id="Cdate8" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 13em;">
								<div class="form-group mb-n">
									字数&le;<input type="text" class="form-control1 input-lg"
										style="width: 4em;" name="bigFont" id="bigFont">&ge;<input
										type="text" class="form-control1 input-lg" style="width: 4em;"
										name="smlFont" id="smlFont">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date9" title="文件上传时间"
										class="form-control1 input-lg" id="date9" style="width: 7em;">
									&ge;<input type="text" name="Cdate9" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate9" style="width: 7em;">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<br>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<c:if test="${isShow == 'yes'}">
					<c:if test="${isFind == 'yes'}">
						<div class="panel-heading success" style="vertical-align: middle;">
							查找信息 <a
								href="${pageContext.request.contextPath}/book/getUserBoList"
								style="color: red;float: right;"> 取消查找信息 </a> <a
								href="${pageContext.request.contextPath}/book/downloadUserFind"
								style="color: red;float: right;margin-right: 1em;"> 导出查找信息 </a>
						</div>
						<table class="table table-bordered"
							style="table-layout: fixed; width: 100%;">
							<thead>
								<tr>
									<th
										style="text-align: center; vertical-align: middle; width: 5%;"><input
										type="checkbox" name="boId"></th>
									<th
										style="text-align: center; vertical-align: middle; width: 9%;">教材名称</th>
									<th
										style="text-align: center; vertical-align: middle; width: 9%;">教材类别</th>
									<th
										style="text-align: center; vertical-align: middle; width: 9%;">出版日期</th>
									<th
										style="text-align: center; vertical-align: middle; width: 9%;">教材主编</th>
									<th
										style="text-align: center; vertical-align: middle; width: 9%;">教材参编</th>
									<th
										style="text-align: center; vertical-align: middle; width: 9%;">教材字数</th>
									<th
										style="text-align: center; vertical-align: middle; width: 10%;">教材出版社</th>
									<th
										style="text-align: center; vertical-align: middle; width: 23%;">获奖简介</th>
									<th
										style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.BoList}" var="List">
									<tr>
										<td
											style="text-align: center; vertical-align: middle; width: 5%;"><input
											type="checkbox" value="${List.boId}" name="boId"></td>
										<td
											style="text-align: center; vertical-align: middle; width: 9%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boName}">${List.boName}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 9%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boCategory}">${List.boCategory}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 9%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boDate}">${List.boDate}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 9%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boEditor}">${List.boEditor}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 9%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boEditor2}">${List.boEditor2}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 9%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boFont}">${List.boFont}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 10%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boPublish}">${List.boPublish}</td>
										<td
											style="text-align: center; vertical-align: middle; width: 23%;"
											data-toggle="tooltip" data-placement="top"
											title="${List.boAbout}">${List.boAbout}</td>
										<th align="center"
											style="width: 8%; text-align: center; vertical-align: middle;">
											<div style="width: 100%; height: 2em;">
												<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
													href="javascript:void(0);"
													onclick="showUpInfo(${List.boId});" title="修改信息"> <i
														class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
												</a></li>
												<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
													href="${pageContext.request.contextPath}/download/downloadTypeFile?type=book&id=${List.boId}&isFind=yes"
													title="下载文件"> <i class="fa fa-download mail-icon"
														style="width: 1em; padding-left: 0.2em;"></i>
												</a></li>
												<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
													href="javascript:void(0);" onclick="delInfo(${List.boId});"
													title="删除信息"> <i class="fa fa-trash-o mail-icon"
														style="width: 1em; padding-left: 0.2em;"></i>
												</a></li>
												<li
													style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
													href="#myLookModal" onclick="setInfo(${List.boId});"
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
								href="${pageContext.request.contextPath}/book/getUserPage?page=${page1.firstPage}&pageSize=${ps1}">第一页</a>
							<a
								href="${pageContext.request.contextPath}/book/getUserPage?page=${page1.nextPage}&pageSize=${ps1}">下一页</a>
							<a
								href="${pageContext.request.contextPath}/book/getUserPage?page=${page1.prePage}&pageSize=${ps1}">上一页</a>
							<a
								href="${pageContext.request.contextPath}/book/getUserPage?page=${page1.lastPage}&pageSize=${ps1}">最后页</a>
						</div>
						</p>
					</c:if>
					<c:if test="${isFind != 'yes'}">
						<span
							style="text-align: center;vertical-align: middle;color: red;">没有满足查询条件的信息！</span>
					</c:if>
				</c:if>
				<c:if test="${isShow != 'yes'}">
					<div class="panel-heading success">用户论文信息</div>
					<table class="table table-bordered"
						style="table-layout: fixed; width: 100%;">
						<thead>
							<tr>
								<th
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" name="boId"></th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">教材名称</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">教材类别</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">出版日期</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">教材主编</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">教材参编</th>
								<th
									style="text-align: center; vertical-align: middle; width: 9%;">教材字数</th>
								<th
									style="text-align: center; vertical-align: middle; width: 10%;">教材出版社</th>
								<th
									style="text-align: center; vertical-align: middle; width: 23%;">获奖简介</th>
								<th
									style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.BookList}" var="RaceList">
								<tr>
									<td
										style="text-align: center; vertical-align: middle; width: 5%;"><input
										type="checkbox" value="${RaceList.boId}" name="boId"></td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boName}">${RaceList.boName}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boCategory}">${RaceList.boCategory}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boDate}">${RaceList.boDate}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boEditor}">${RaceList.boEditor}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boEditor2}">${RaceList.boEditor2}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 9%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boFont}">${RaceList.boFont}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 10%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boPublish}">${RaceList.boPublish}</td>
									<td
										style="text-align: center; vertical-align: middle; width: 23%;"
										data-toggle="tooltip" data-placement="top"
										title="${RaceList.boAbout}">${RaceList.boAbout}</td>
									<th align="center"
										style="width: 8%; text-align: center; vertical-align: middle;">
										<div style="width: 100%; height: 2em;">
											<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
												href="javascript:void(0);"
												onclick="showUpInfo(${RaceList.boId});" title="修改信息"> <i
													class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
											</a></li>
											<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
												href="${pageContext.request.contextPath}/download/downloadTypeFile?type=book&id=${RaceList.boId}"
												title="下载文件"> <i class="fa fa-download mail-icon"
													style="width: 1em; padding-left: 0.2em;"></i>
											</a></li>
											<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
												href="javascript:void(0);"
												onclick="delInfo(${RaceList.boId});" title="删除信息"> <i
													class="fa fa-trash-o mail-icon"
													style="width: 1em; padding-left: 0.2em;"></i>
											</a></li>
											<li
												style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
												href="#myLookModal" onclick="setInfo(${RaceList.boId});"
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
							href="${pageContext.request.contextPath}/book/getUserPage?page=${page.firstPage}&pageSize=${ps}">第一页</a>
						<a
							href="${pageContext.request.contextPath}/book/getUserPage?page=${page.nextPage}&pageSize=${ps}">下一页</a>
						<a
							href="${pageContext.request.contextPath}/book/getUserPage?page=${page.prePage}&pageSize=${ps}">上一页</a>
						<a
							href="${pageContext.request.contextPath}/book/getUserPage?page=${page.lastPage}&pageSize=${ps}">最后页</a>
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
							<input type="text" class="form-control1 input-lg" name="boName"
								title="教材名称" id="boName" placeholder="教材名称" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg"
								name="boCategory" title="教材类别" id="boCategory"
								placeholder="教材类别" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" name="Cdate" readonly="readonly" title="出版日期"
								class="form-control1 input-lg" id="Cdate" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="boEditor"
								title="教材主编" name="boEditor" placeholder="教材主编"
								required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg"
								name="boEditor2" title="教材参编" id="boEditor2" placeholder="教材参编"
								required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" name="boFont"
								title="教材字数" id="boFont" placeholder="教材字数" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg"
								name="boPublish" title="出版社" id="boPublish" placeholder="出版社"
								required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-12">
							<textarea rows="2" class="form-control1 control2 " name="boAbout"
								id="boAbout" style="font-size: 1em;"
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
							<tr style="text-align: center; vertical-align: middle;">
								<td><label for="largeinput"
									class="control-label label-input-lg">教材名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_na" id="bo_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">教材类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_ca" id="bo_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">出版日期</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_da" id="bo_da" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">教材主编</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e1" id="bo_e1" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">教材参编</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e2" id="bo_e2" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">教材字数</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_pa" id="bo_pa" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">出版社</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_pu" id="bo_pu" readonly="true"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">教材简介</label></td>
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
    var idd = null ;
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
    	$("#boName").val(data.boName);
		$("#boCategory").val(data.boCategory);
		$("#Cdate").val(data.boDate);
		$("#boEditor").val(data.boEditor);
		$("#boEditor2").val(data.boEditor2);
		$("#boFont").val(data.boFont);
		$("#boPublish").val(data.boPublish);
		$("#boAbout").val(data.boAbout);
	}
    function showInfoModel(data) {
    	$("#bo_na").val(data.boName);
		$("#bo_ca").val(data.boCategory);
		$("#bo_da").val(data.boDate);
		$("#bo_e1").val(data.boEditor);
		$("#bo_e2").val(data.boEditor2);
		$("#bo_pa").val(data.boFont);
		$("#bo_pu").val(data.boPublish);
		$("#bo_ab").val(data.boAbout);
		showInfo(data);
	}
    function setInfo(Id) {
    	idd = Id;
    	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/book/getBoInfo",
			data : {
				boId : Id
			},
			dataType : 'json',
			cache : false,
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
			url : "${pageContext.request.contextPath}/book/DeletePaInfo",
			data : too,
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data){
				alert(data.string1);
				window.location.href = "${pageContext.request.contextPath}/book/getUserBoList";
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
			url : "${pageContext.request.contextPath}/book/getBoInfo",
			data : {
				boId : Id
			},
			dataType : 'json',
			cache : false,
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
			url : "${pageContext.request.contextPath}/book/upBoInfo",
			data : {
				usId : <%=login.getUsId()%>,
				boId : idd,
				boName : $("#boName").val(),
				boCategory : $("#boCategory").val(),
				boDate : $("#Cdate").val(),
				boEditor : $("#boEditor").val(),
				boEditor2 : $("#boEditor2").val(),
				boFont : $("#boFont").val(),
				boPublish : $("#boPublish").val(),
				boAbout : $("#boAbout").val()
			},
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				alert("修改成功！");
			    window.location.href = "${pageContext.request.contextPath}/book/getUserBoList";
			}, 
			error : function(data) {
				alert("update error!");
			}
		});
	}
    function addRaInfo() {
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/book/addBoInfo",
			data : {
				usId : <%=login.getUsId()%>,
				boName : $("#boName").val(),
				boCategory : $("#boCategory").val(),
				boDate : $("#Cdate").val(),
				boEditor : $("#boEditor").val(),
				boEditor2 : $("#boEditor2").val(),
				boFont : $("#boFont").val(),
				boPublish : $("#boPublish").val(),
				boAbout : $("#boAbout").val()
			},
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				alert("添加信息成功，请上传文件！");
			    window.location.href = "${pageContext.request.contextPath}/book/getUserBoList";
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
            url : "${pageContext.request.contextPath}/upload/uploadFileAjax?type=book",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data : {
            	ID : idd
            },
            success: function(data) {
	            alert(data.string1);
	            window.location.href = "${pageContext.request.contextPath}/book/getUserBoList";
            },
            error: function (data){
                alert("出错");
            }  
         });
    }
    function rePages(){
	   var page = $("#pageSize").val();
	   window.location.href = "${pageContext.request.contextPath}/book/getUserBoList?pageSize="+page;
	   window.parent.scrollTo(0, 0);
   }
   function rePages1(){
   	   var page = $("#pageSize1").val();
       window.location.href = "${pageContext.request.contextPath}/book/getUserPage?pageSize="+page;
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