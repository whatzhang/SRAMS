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

</head>

<body style="height: auto;">

	<div class="panel-info widget-shadow">
		<button type="button" class="btn btn-info"
			style=" width: 100%;margin: 0em 1em 0em 1em; background-color: #d9edf7;color: #31708f; border-color:#d9edf7;">接收/刷新信息</button>
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
						<%
							for (int i = 0; i < 10; i++) {
						%>
						<li><a href="#">
								<div class="chat-left">
									<img class="img-circle" src="img/i3.png" alt=""> <label
										class="small-badge bg-green"></label>
								</div>
								<div class="chat-right">
									<p>Brown Andy</p>
									<h6>Quis risus ullam neget</h6>
								</div>
								<div class="clearfix"></div>
						</a></li>

						<%
							}
						%>
					</ul>

				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">文件</h3>
				</div>
				<div class="panel-body">
					<ul>
						<li><a href="#"><i class="fa fa-flag-o"></i>未读消息<span>2</span></a></li>
						<li><a href="#"><i class="fa fa-file-text-o"></i>已读消息<span>12</span></a></li>
						<li><a href="#"><i class=" fa fa fa-envelope-o"></i>所有消息<span>03</span></a></li>
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

					<input type="submit" class="btn btn-info" style="background-color: #d9edf7;color: #31708f; border-color:#d9edf7; " value="发布提交">
				</form>
			</div>
		</div>

		<div class="clearfix"></div>
	</div>




	<div>
		<div class="panel-info widget-shadow">
			<div class="panel-heading" style="margin: 0em 1em 0em 1em;">消息列表</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">消息主题</th>
							<th style="text-align: center;">发布时间</th>
							<th style="text-align: center;">发布人</th>
							<th style="text-align: center;">接收人</th>
							<th style="text-align: center;">消息内容</th>
							<th style="text-align: center;">状态</th>
							<th style="text-align: center;">操作选项</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < 10; i++) {
						%>
						<tr>
							<th style="text-align: center; vertical-align: middle;">1111</th>
							<td style="text-align: center; vertical-align: middle;">2018/7/7</td>
							<td style="text-align: center; vertical-align: middle;">admin</td>
							<td style="text-align: center; vertical-align: middle;">Allusers</td>
							<td style="text-align: center; vertical-align: middle;">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</td>
							<td style="text-align: center; vertical-align: middle;">已读</td>
							<td style="text-align: center; vertical-align: middle;">
								<div class="dropdown">
									<a href="#" data-toggle="dropdown" aria-expanded="false">
										<p align="center">
											<i class="fa fa-th-large nav_icon"></i>
										</p>
									</a>
									<ul class="dropdown-menu float-right">
										<li><a href="#myModal" data-toggle="modal"
											data-target="#myModal"> <i class="fa fa-cogs nav_icon"
												style="width: 0.3em"></i> 查看具体信息
										</a></li>
										<li><a href="#"> <i class="fa fa-download mail-icon"></i>
												标为已读信息
										</a></li>
										<li><a href="#exampleModal" data-toggle="modal"
											data-target="#exampleModal"><i
												class="fa fa-download mail-icon"></i> 删除信息 </a></li>
									</ul>
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>


			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		style="margin-bottom: 30%;" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" style="width: 40em; ">
			<div class="modal-content"
				style="padding:2em 1em 0em 1em;text-align: left;">

				<div class="form-group mb-n">
					<label for="largeinput">信息主题-----</label> <label for="largeinput">论文类别</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput">发布时间-----</label> <label for="largeinput">2016/9/8</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput">发布人-------</label> <label for="largeinput">admin</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput">接收人-------</label> <label for="largeinput">Allusers</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput">信息主题-----</label> <label for="largeinput">论文类别</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput">信息状态-----</label> <label for="largeinput">已读</label>
				</div>
				<div class="form-group mb-n">
					<label for="largeinput">信息内容:</label>
					<textarea rows="4" class="form-control1 control2"
						placeholder="内容不超过100字" readonly="readonly">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</textarea>
				</div>


				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		style="margin-bottom: 40%;" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document" style="width: 18em;">
			<div class="modal-content">
				<form name="delect_user">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h5 id="exampleModalLabel">确认框</h5>
					</div>
					<div class="modal-body" style="margin: 1.5em 0em 1.5em 0em;">

						<div style="text-align: center; color: #e94e02;">
							<label for="message-text" class="control-label">确定要删除信息？</label>
						</div>

					</div>
					<div class="modal-footer" style="padding-bottom: 0;">
						<button type="submit" class="btn btn-primary">确认</button>
						<button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	</script>
</body>
</html>
