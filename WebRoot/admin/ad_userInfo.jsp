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

<body>

	<div class="media">


		<div class="bs-example5">
			<form class="form-horizontal" name="find_user">
				<div class="form-group mb-n">
					<label for="largeinput" class=" control-label label-input-lg"
						style="margin-left: 1em; font-size: 1em; color: #e94e02;">选择查询条件及信息：</label>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<select class="form-control1">
							<option>专利名称</option>
							<option>专利类别</option>
							<option>申请时间</option>
							<option>颁发期刊</option>
						</select>
					</div>
					<label for="largeinput"
						class="col-sm-2 control-label label-input-lg"
						style="color: #e94e02; font-size: 0.9em;">关键信息：</label>
					<div class="col-sm-5">
						<input type="text" class="form-control1 input-lg" id="largeinput"
							placeholder=" ">
					</div>
					<label class="col-sm-2 " align="center"><button
							type="submit" class="btn btn-success">查&nbsp;&nbsp;&nbsp;找</button></label>
				</div>
			</form>
			<br>
			<table class="table table-bordered ">
				<thead>
					<tr class="success">
						<th style="text-align: center;">用户名称</th>
						<th style="text-align: center;">年龄</th>
						<th style="text-align: center;">性别</th>
						<th style="text-align: center;">身份</th>
						<th style="text-align: center;">学/工号</th>
						<th style="text-align: center;">联系地址</th>
						<th style="text-align: center;">联系电话</th>
						<th style="text-align: center;">E-mail</th>
						<th style="text-align: center;">所属学院</th>
						<th style="text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < 10; i++) {
					%>
					<tr>
						<td style="text-align: center;">111111111111</td>
						<td style="text-align: center;">11111111111</td>
						<td style="text-align: center;">1111111111111</td>
						<td style="text-align: center;">111122</td>
						<td style="text-align: center;">111122</td>
						<td style="text-align: center;">111111111111</td>
						<td style="text-align: center;">11111111111111</td>
						<td style="text-align: center;">111111111111111</td>
						<td style="text-align: center;">11111111111</td>
						<td>
							<div class="dropdown">
								<a href="#" data-toggle="dropdown" aria-expanded="false">
									<p align="center">
										<i class="fa fa-th-large nav_icon"></i>
									</p>
								</a>
								<ul class="dropdown-menu float-right">
									<li><a href="#myModal" data-toggle="modal"
										data-target="#myModal"> <i class="fa fa-cogs nav_icon"
											style="width: 0.3em"></i> 修改用户信息
									</a></li>
									<li><a href="#myModal1" data-toggle="modal"
										data-target="#myModal1"> <i
											class="fa fa-download mail-icon"></i> 查看详细信息
									</a></li>
									<li><a href="#exampleModal" data-toggle="modal"
										data-target="#exampleModal"> <i
											class="fa fa-trash-o mail-icon"></i> 删除用户信息
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
			<br> <br>
		</div>


		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
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

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form class="form-horizontal">
						<br> <br>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">用户姓名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">用户年龄</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>
						<div class="form-group">
							<label for="radio" class="col-sm-3 control-label">用户性别</label>
							<div class="col-sm-6">
								<div class="radio-inline">
									<label><input type="radio" checked="checked"> 男</label>
								</div>
								<div class="radio-inline">
									<label><input type="radio"> 女</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">用户身份</label>
							<div class="col-sm-3">
								<select class="form-control1">
									<option>任职教师</option>
									<option>在校学生</option>
									<option>学校职工</option>
									<option>其他</option>
								</select>
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">学号/工号</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder="">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">联系地址</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">联系电话</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">E-mail</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>
						<div class="form-group mb-n">
							<label class="col-sm-3 control-label ">所属学院</label>
							<div class="col-sm-3">
								<select class="form-control1">
									<option>学院1</option>
									<option>学院2</option>
									<option>学院3</option>
									<option>其他</option>
								</select>
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">密保问题一</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">预留答案一</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">密保问题二</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-3 control-label label-input-lg">预留答案二</label>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">提交更改</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>

						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="myModal1" tabindex="1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 25em;">
				<div class="modal-content">
					<br> <br>
					<table class="table" style="text-align: center;">
						<tbody>
							<tr>
								<td><label for="largeinput"
									class="control-label label-input-lg">用户名</label></td>
								<td style="text-align: left; font-size: 0.8em;"">用户名</td>

							</tr>
							<tr>
								<td><label for="largeinput"
									class="control-label label-input-lg">姓名</label></td>
								<td style="text-align: left; font-size: 0.8em;"">姓名</td>

							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">用户年龄</label></td>
								<td style="text-align: left; font-size: 0.8em;"">用户年龄</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">用户性别</label></td>
								<td style="text-align: left; font-size: 0.8em;"">用户性别</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">用户身份</label></td>
								<td style="text-align: left; font-size: 0.8em;"">用户身份</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">学号/工号</label></td>
								<td style="text-align: left; font-size: 0.8em;"">学号/工号</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">联系地址</label></td>
								<td style="text-align: left; font-size: 0.8em;"">联系地址</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">联系电话</label></td>
								<td style="text-align: left; font-size: 0.8em;"">联系电话</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">E-mail</label></td>
								<td style="text-align: left; font-size: 0.8em;"">E-mail</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">所属学院</label></td>
								<td style="text-align: left; font-size: 0.8em;"">所属学院</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">密保问题一</label></td>
								<td style="text-align: left; font-size: 0.8em;"">密保问题一</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">预留答案一</label></td>
								<td style="text-align: left; font-size: 0.8em;">预留答案一</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">密保问题二</label></td>
								<td style="text-align: left; font-size: 0.8em;"">密保问题二</td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">预留答案二</label></td>
								<td style="text-align: left; font-size: 0.8em;">预留答案二</td>
							</tr>

						</tbody>
					</table>

					<div class="modal-footer" style="text-align: center;">
						<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>

					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
