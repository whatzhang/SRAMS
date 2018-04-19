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

	<div class="panel-info" style="margin:  2em 3em 1em 1em; ">
		<button type="button" class="btn btn-info" onclick="refresh();"
			style="width: 100%;margin: 0em 2em 0em 1em; background-color: #d9edf7;color: #31708f; border-color:#d9edf7;">接收/刷新信息</button>
	</div>

	<div class="main-page compose" style="margin: 2em 2em 2em 2em; ">
		<div class="col-md-4 compose-left ">
			<div class="panel panel-info">
				<div class="panel-heading">

					<input type="text" class="form-control1 input-lg"
						style="overflow:auto;" id="chooseUser" placeholder="查找要给发送信息用户">
				</div>
				<div class="panel-body" data-spy="scroll"
					data-target="#navbar-example" data-offset="0"
					style="height:15em; overflow:auto;">
					<ul>
						<div id="NEWS">
							<c:forEach items="${requestScope.nowNews}" var="now">
								<li><a href="javascript: showNewsInfo(${now.meId});"
									 title="未读消息">
										<div class="chat-left">
											<img class="img-circle" src="img/i3.png" alt="">
										</div>
										<div class="chat-right">
											<p style="color: red;">${now.meTitle}</p>
											<p style="font-size: 1px; color: lightblue;">${now.meDate}</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
							</c:forEach>
						</div>
					</ul>

				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">文件</h3>
				</div>
				<div class="panel-body">
					<ul>
						<li><a href="javascript:void(0);"><i class="fa fa-flag-o"></i>未读消息用户数<span>
						<label id="NoReNum">1</label></span></a></li>
						<li><a href="javascript:void(0);"><i
								class="fa fa-file-text-o"></i>已读消息用户数<span><label id="ReNum">2</label></span></a></li>
						<li><a href="javascript:void(0);"><i
								class=" fa fa fa-envelope-o"></i>删除消息用户数<span><label id="DelNum">3</label></span></a></li>
					</ul>
				</div>

			</div>

		</div>


		<div class="panel panel-info col-md-8 compose-right">
			<div class="panel-heading" style="padding: 1em 0em 1em 2em; ">发布新消息</div>
			<div class="panel-body">
				<form class="com-mail">
					<div style="margin: 0em 0em 0.4em 0em;">

						<input type="radio" checked="checked" name="sendWho">AllUsers&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sendWho"> SomeOne

					</div>
					<input type="text" class="form-control1 control3"
						placeholder="To :" required="required"> <input type="text"
						class="form-control1 control3" placeholder="消息主题">
					<textarea rows="6" class="form-control1 control2"
						placeholder="消息内容:" required="required"></textarea>

					<input type="submit" class="btn btn-info"
						style="background-color: #d9edf7;color: #31708f; border-color:#d9edf7; "
						value="发布提交">
				</form>
			</div>
		</div>

		<div class="clearfix"></div>
	</div>




	<div>
		<div class="panel-info">
			<div class="panel-heading" style="margin: 0em 1em 0em 1em;">消息列表</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="msId" id="msId"></th>
							<th style="text-align: center;vertical-align: middle;width: 16%;">消息主题</th>
							<th style="text-align: center;vertical-align: middle;width: 12%;">发布时间</th>
							<th style="text-align: center;vertical-align: middle;width: 12%;">发布人</th>
							<th style="text-align: center;vertical-align: middle;width: 12%;">接收人</th>
							<th style="text-align: center;vertical-align: middle;width: 31%;">消息内容</th>
							<th style="text-align: center;vertical-align: middle;width: 12%;">操作选项</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.MeList}" var="Me">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${Me.meId}" name="meId"></td>
								<th
									style="text-align: center; vertical-align: middle;width: 16%;"
									data-toggle="tooltip" data-placement="top"
									title="${Me.meTitle}">${Me.meTitle}</th>
								<td
									style="text-align: center; vertical-align: middle;width: 12%;"
									data-toggle="tooltip" data-placement="top" title="${Me.meDate}">${Me.meDate}</td>
								<td
									style="text-align: center; vertical-align: middle;width: 12%;"
									data-toggle="tooltip" data-placement="top" title="${Me.meSend}">${Me.meSend}</td>
								<td
									style="text-align: center; vertical-align: middle;width: 12%;"
									data-toggle="tooltip" data-placement="top"
									title="${Me.meReceive}">${Me.meReceive}</td>
								<td
									style="text-align: center; vertical-align: middle;width: 31%;"
									data-toggle="tooltip" data-placement="top"
									title="${Me.meAbout}">${Me.meAbout}</td>
								<th align="center"
									style="text-align: center; vertical-align: middle;width: 12%;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.5em;"><a
											href="javascript:void(0);" onclick="showUpInfo(${Me.meId});"
											title="修改信息"> <i class="fa fa-cogs nav_icon"
												style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 1em;"><a
											href="javascript:void(0);" onclick="delInfo(${Me.meId});"
											title="删除信息"> <i class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 1em; "><a
											href="#myModal" onclick="getNewsById(${Me.meId});"
											data-toggle="modal" data-target="#myModal" title="查看信息">
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
						href="${pageContext.request.contextPath}/news/getAdminNews?page=${page.firstPage}&pageSize=${ps}">第一页</a>
					<a
						href="${pageContext.request.contextPath}/news/getAdminNews?page=${page.nextPage}&pageSize=${ps}">下一页</a>
					<a
						href="${pageContext.request.contextPath}/v/getAdminNews?page=${page.prePage}&pageSize=${ps}">上一页</a>
					<a
						href="${pageContext.request.contextPath}/news/getAdminNews?page=${page.lastPage}&pageSize=${ps}">最后页</a>
				</div>
				</p>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		style="margin-bottom: 30%;" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" style="width: 40em; ">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">详细信息</h4>
				</div>
				<div class="modal-body" style="margin: 0.2em 1em 0em 1em;">
					<div class="form-group mb-n">
						<label for="largeinput">信息主题-----</label> <label for="largeinput"
							id="title"></label>
					</div>
					<div class="form-group mb-n">
						<label for="largeinput">发布时间-----</label> <label for="largeinput"
							id="time"></label>
					</div>
					<div class="form-group mb-n">
						<label for="largeinput">发布人-------</label> <label for="largeinput"
							id="send"></label>
					</div>
					<div class="form-group mb-n">
						<label for="largeinput">接收人-------</label> <label for="largeinput"
							id="resevice"></label>
					</div>
					<div class="form-group mb-n">
						<label for="largeinput" style="margin-bottom: 1em;">信息内容:</label>
						<textarea rows="4" class="form-control1 control2" id="ab"
							style="font-size: 1.1em;" placeholder="内容不超过100字"
							readonly="readonly"></textarea>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-primary"
						style="float: right;margin-right: 1em;" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		function refresh() {
			window.location.href = "${pageContext.request.contextPath}/news/getAdminNews";
		}
		function setReadNum(ww) {
		    document.getElementById('NoRead').innerText = ww.string1;
		    document.getElementById('Readed').innerText = ww.string2;
		    document.getElementById('delNews').innerText = ww.string3;
		    $('NoRead').text(aa);
	        $('Readed').val(bb);
            $('delNews').html(cc);
		}
		function showNewsInfo(daa){
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/getReadNum",
				data : {
					meId : daa
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : function(data){
				    $('NoRead').text(data.string1);
		            $('Readed').val(data.string2);
		            $('delNews').html(data.string3);
		            document.getElementById("NoRead").innerHTML = data.string1;
				    document.getElementById("Readed").innerHTML = data.string2;
				    document.getElementById("delNews").innerHTML = data.string3;
				},
				error : function(data) {
					alert("获取信息错误!");
				}
			});
		}
		function setMyModel(data) {
			document.getElementById('title').innerHTML = data.meTitle;
			document.getElementById('send').innerHTML = data.meSend;
			document.getElementById('resevice').innerHTML = data.meReceive;
			document.getElementById('time').innerHTML = data.meDate;
			document.getElementById('ab').value = data.meAbout;
			showMain(data);
		}
		function getNewsById(meId) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/getNewsById",
				data : {
					meId : meId
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : setMyModel,
				error : function(data) {
					alert("获取信息错误!");
				}
			});
		}
		function showMain() {
		}
		function rePages() {
			var page = $("#pageSize").val();
			window.location.href = "${pageContext.request.contextPath}/news/getAdminNews?pageSize=" + page;
			window.parent.scrollTo(0, 0);
		}
	</script>
</html>
