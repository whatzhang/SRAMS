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

<title>newsInfo</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="pragma" content="no-cache">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<link href="css/style.css" rel='stylesheet' type='text/css' />

<link href="css/font-awesome.css" rel="stylesheet">

<script src="js/jquery-1.11.1.min.js"></script>

<script src="js/bootstrap.js"></script>
<!-- http://www.jb51.net/article/76093.htm-->
</head>

<body style="height: 60em;">
	<div class="main-page general" style="padding: 2em 2em 0em 2em;">
		<button type="button" class="btn btn-info" onclick="refresh();"
			style="width: 100%; height: 3em; margin: 0em 0em 2em 0em; background-color: #d9edf7; color: #31708f; border-color: #d9edf7;">接收/刷新信息</button>
		<div class="main-page compose">
			<div class="col-md-4 compose-left ">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">消息分类</h3>
					</div>
					<div class="panel-body">
						<ul>
							<li><a href="javascript:void(0);"><i
									class="fa fa-flag-o"></i>未读消息<span>${fn:length(NoReadMe)}</span></a></li>
							<li><a href="javascript:void(0);"><i
									class="fa fa-file-text-o"></i>已读消息<span>${fn:length(ReadMe)}</span></a></li>
							<li><a href="javascript:void(0);"><i
									class=" fa fa fa-envelope-o"></i>垃圾箱<span>${fn:length(DelMe)}</span></a></li>
						</ul>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">消息列表</h3>
					</div>
					<div class="panel-body" data-spy="scroll"
						data-target="#navbar-example" data-offset="0"
						style="height: 27em; overflow: auto;">
						<ul>
							<div id="noR">
								<c:forEach items="${requestScope.NoReadMe}" var="noRead">
									<li><a href="javascript: showNews(${noRead.meId});"
										title="未读消息">
											<div class="chat-left">
												<img class="img-circle" src="img/i3.png" alt="">
											</div>
											<div class="chat-right">
												<p style="color: red;">${noRead.meTitle}</p>
												<p style="font-size: 1px; color: lightblue;">${noRead.meDate}</p>
											</div>
											<div class="clearfix"></div>
									</a></li>
								</c:forEach>
							</div>
							<div id="Re">
								<c:forEach items="${requestScope.ReadMe}" var="Read">
									<li><a href="javascript: showNews(${Read.meId});"
										title="已读消息">
											<div class="chat-left">
												<img class="img-circle" src="img/i3.png" alt="">
											</div>
											<div class="chat-right">
												<p style="color: orange;">${Read.meTitle}</p>
												<p style="font-size: 1px; color: lightblue;">${Read.meDate}</p>
											</div>
											<div class="clearfix"></div>
									</a></li>
								</c:forEach>
							</div>
							<div id="De">
								<c:forEach items="${requestScope.DelMe}" var="Del">
									<li><a href="javascript: showNews(${Del.meId});"
										title="垃圾箱消息">
											<div class="chat-left">
												<img class="img-circle" src="img/i3.png" alt="">
											</div>
											<div class="chat-right">
												<p>${Del.meTitle}</p>
												<p style="font-size: 1px; color: lightblue;">${Del.meDate}</p>
											</div>
											<div class="clearfix"></div>
									</a></li>
								</c:forEach>
							</div>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-md-8 compose-right ">
				<div class="panel panel-info ">
					<div class="panel-heading">
						<h3 class="panel-title">消息内容</h3>
					</div>
					<div class="panel-body" style="height: 41em;">
						<div class="form-group mb-n">
							<input type="text" class="form-control1 input-lg"
								style="font-size: 1em; width: 49%; float: left;" name="From"
								id="From" placeholder="发 送 人 :  " readonly="true"> <input
								type="text" class="form-control1 input-lg"
								style="font-size: 1em; width: 49%; float: right;" name="date"
								id="date" placeholder="发送时间 :" readonly="true">
						</div>
						<div class="form-group mb-n">
							<input type="text" class="form-control1 input-lg"
								style="margin-top: 1em; font-size: 1em;" name="Title" id="Title"
								placeholder="消息主题 :" readonly="true">
						</div>
						<div class="form-group mb-n">
							<textarea class="form-control1 control2"
								style="margin-top: 1em; height: 23em; font-size: 1em;"
								name="About" id="About" placeholder="消息内容 :" readonly="true"></textarea>
						</div>
						<div style="margin-top: 2em; float: right;">
							<button style="margin-right: 1em;margin-top: 0.5em;"
								type="button" onclick="setRead();" class="btn btn-success">标为已读</button>
							<button style="margin-right: 1em;margin-top: 0.5em;"
								type="button" onclick="setNoRead();" class="btn btn-success">标为未读</button>
							<button style="margin-right: 1em;margin-top: 0.5em;"
								type="button" onclick="setDel();" class="btn btn-success">删除信息</button>
							<button style="margin-top: 0.5em;" type="button"
								class="btn btn-success" onclick="removeMe()">清空垃圾箱</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var meID = 0;
		window.onload = function top() {
			this.scroll(0, 0);
		}
		function showNews(da) {
			meID = da;
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/getNewsById",
				data : {
					meId : da
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : setNewsInfo,
				error : function(data) {
					alert("获取信息错误!");
				}
			});
		}
		function setNewsInfo(data) {
			$("#date").val("发送时间 :  " + data.meDate);
			$("#Title").val("消息主题 :  " + data.meTitle);
			$("#About").val("消息内容 :\n" + data.meAbout);
			getUserName(data.meSend)
		}
		function getUserName(id) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/getUserNameById",
				data : {
					usId : id
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : function(data) {
					$("#From").val("发 送 人 :  " + data.string1);
				},
				error : function(data) {
					alert("获取信息错误!");
				}
			});
		}
		function toRead() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/setRead",
				data : {
					meId : meID
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : function(data) {
					alert("设置消息状态为已读成功！");
					window.location.href = "${pageContext.request.contextPath}/news/getUserNews";
				},
				error : function(data) {
					alert("设置消息状态错误!");
				}
			});
		}
		function toNoRead() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/setNoRead",
				data : {
					meId : meID
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : function(data) {
					alert("设置消息状态为未读成功！");
					window.location.href = "${pageContext.request.contextPath}/news/getUserNews";
				},
				error : function(data) {
					alert("设置消息状态错误!");
				}
			});
		}
		function toDel() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/setDel",
				data : {
					meId : meID
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : function(data) {
					alert("移入垃圾箱成功！");
					window.location.href = "${pageContext.request.contextPath}/news/getUserNews";
				},
				error : function(data) {
					alert("设置消息状态错误!");
				}
			});
		}
		function jud() {
			if (meID == 0) {
				alert("请选择所要设置的消息！");
				return false;
			} else {
				return true;
			}
		}
		function setRead() {
			if (jud()) {
				toRead();
			}
		}
		function setNoRead() {
			if (jud()) {
				toNoRead();
			}
		}
		function setDel() {
			if (jud()) {
				toDel();
			}
		}
		function removeMe() {
			if (confirm("确定将要永久清空垃圾箱消息！！")) {
				reReadMe();
			}
		}
		function reReadMe() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/news/deleteReadNews",
				data : {
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : function(data) {
					alert("清空垃圾箱成功！");
					window.location.href = "${pageContext.request.contextPath}/news/getUserNews";
				},
				error : function(data) {
					alert("清空垃圾箱错误!");
				}
			});
		}
		function refresh() {
			window.location.href = "${pageContext.request.contextPath}/news/getUserNews";
		}
	</script>
</body>
</html>
