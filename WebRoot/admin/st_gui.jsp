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

<title>My JSP 'userInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<link href="css/style.css" rel='stylesheet' type='text/css' />

<link href="css/font-awesome.css" rel="stylesheet" type="text/css">

<script src="js/jquery-1.11.1.min.js"></script>

<script src="js/bootstrap.js"></script>

<script src="js/Chart.js"></script>

<style type="text/css">
</style>
</head>

<body>
	<div class="media" style="">
		<div class="bs-example5 widget-shadow">
			<form class="form-horizontal" name="find_user">

				<div class="form-group mb-n">
					<label for="largeinput" class=" control-label label-input-lg"
						style="margin-left: 1em; font-size: 1em; color: #e94e02;">选择归纳条件：</label>
				</div>
				<div class="form-group">

					<div class="col-sm-2">
						<select class="form-control1" id="" name="">
							<option>选择学院</option>
							<option>专利类别</option>
							<option>申请时间</option>
							<option>颁发期刊</option>
						</select>
					</div>

					<div class="col-sm-2">
						<select class="form-control1" id="" name="">
							<option>选择专业</option>
							<option>专利类别</option>
							<option>申请时间</option>
							<option>颁发期刊</option>
						</select>
					</div>

					<div class="col-sm-2">
						<select class="form-control1" id="" name="">
							<option>选择归纳类别</option>
							<option>专利</option>
							<option>论文</option>
							<option>项目</option>
						</select>
					</div>

					<label class="col-sm-2 " align="center"><button
							type="submit" class="btn btn-success">归纳展示信息</button></label> 
				    <label class="col-sm-1 " align="center"><button
							type="button" class="btn btn-success">导出信息</button></label> 
					<label class="col-sm-1 " align="center"><button type="button"
							class="btn btn-success">导出文件</button></label> <label class="col-sm-1 "
						align="center"><button type="button"
							class="btn btn-success">全部导出</button></label>
				</div>
			</form>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr class="success">
						<th scope="row" style="text-align: center;">论文名称</th>
						<th style="text-align: center;">发表时间</th>
						<th style="text-align: center;">论文类别</th>
						<th style="text-align: center;">发表期刊</th>
						<th colspan="3" style="text-align: center;">论文简介</th>
						<th style="text-align: center;">操作选项</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < 10; i++) {
					%>
					<tr>
						<th scope="row" style="text-align: center;">1111</th>
						<td style="text-align: center;">1111</td>
						<td style="text-align: center;">1111</td>
						<td style="text-align: center;">1111</td>
						<td colspan="3" style="text-align: center;">1111</td>
						<td>
							<div class="dropdown">
								<a href="#" data-toggle="dropdown" aria-expanded="false">
									<p align="center">
										<i class="fa fa-th-large nav_icon"></i>
									</p>
								</a>
								<ul class="dropdown-menu float-right">
									<li><a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse15"
										aria-expanded="true" aria-controls="collapse15"> <i
											class="fa fa-cogs nav_icon" style="width: 0.3em"></i> 修改论文信息
									</a></li>
									<li><a href="#" title=""> <i
											class="fa fa-download mail-icon"></i> 下载论文文件
									</a></li>
									<li><a href="#" class="font-red" title=""> <i
											class="fa fa-trash-o mail-icon"></i> 删除论文信息
									</a></li>

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




</body>
</html>