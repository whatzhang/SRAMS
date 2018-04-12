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

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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

	<div class="main-page">
		<div class="media">
			<div class="panel-info widget-shadow" id="pa_find">
				<div class=" panel-body-inputin" style="height: 7em;">
					<form class="form-horizontal">
						<div class="form-group mb-n">
							<label for="largeinput" class=" control-label label-input-lg"
								style="margin-left: 2em; font-size: 1em; color: #e94e02;">选择查询条件及信息：</label>
						</div>
						<div class="form-group">
							<div class="col-sm-2" style="margin-left: 1em">
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
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
							<label class="col-sm-2 " align="center"><button
									type="submit" class="btn btn-success">查&nbsp;&nbsp;&nbsp;找</button></label>
						</div>
					</form>
				</div>
				<br>
			</div>
			<br>

			<div class="bs-example5 widget-shadow"
				data-example-id="default-media" id="pa_show">
				<table class="table table-bordered">
					<thead>
						<tr class="success">
							<th scope="row" style="text-align: center;">专利名称</th>
							<th style="text-align: center;">专利类别</th>
							<th style="text-align: center;">申请时间</th>
							<th style="text-align: center;">颁发时间</th>
							<th style="text-align: center; width: 14em;">专利简介</th>
							<th style="text-align: center;">操作选项</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" style="text-align: center;">1111</th>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center; width: 14em;">1111</td>
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
						<tr>
							<th scope="row" style="text-align: center;">1111</th>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center; width: 14em;">1111</td>
							<td><div class="dropdown">
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
								</div></td>
						</tr>
						<tr>
							<th scope="row" style="text-align: center;">1111</th>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center; width: 14em;">1111</td>
							<td><div class="dropdown">
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
								</div></td>
						</tr>
						<tr>
							<th scope="row" style="text-align: center;">1111</th>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center; width: 14em;">1111</td>
							<td><div class="dropdown">
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
								</div></td>
						</tr>
						<tr>
							<th scope="row" style="text-align: center;">1111</th>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center; width: 14em;">1111</td>
							<td><div class="dropdown">
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
								</div></td>
						</tr>
						<tr>
							<th scope="row" style="text-align: center;">1111</th>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center;">1111</td>
							<td style="text-align: center; width: 14em;">1111</td>
							<td><div class="dropdown">
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
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="media_1">
				<div class="col-md-6 media_1-left widget-shadow">
					<div class="panel_2" style="padding: 2em 2em 1em 2em;" id="pa_add">
						<form class="form-horizontal" id="add" name="add">
							<h3 class="title1" style="font-size: 1.2em; text-align: center;">增添信息</h3>
							<br>
							<div class="form-group mb-n">
								<label for="largeinput">专利名称</label> <input type="text"
									class="form-control1 input-lg"
									style="width: 17em; margin-left: 1em" id="largeinput"
									placeholder=" ">
							</div>

							<div class="form-group mb-n">
								<label for="largeinput">专利类别</label> <input type="text"
									class="form-control1 input-lg"
									style="width: 17em; margin-left: 1em" id="largeinput"
									placeholder=" ">
							</div>
							<div class="form-group mb-n">
								<label for="largeinput">申请时间</label> <input type="text"
									style="width: 17em; margin-left: 1em" name="Cdate"
									readonly="readonly" class="form-control1 input-lg" id="Cdate" />

							</div>
							<div class="form-group mb-n">
								<label for="largeinput">颁发时间</label> <input type="text"
									style="width: 17em; margin-left: 1em" name="Cdate1"
									readonly="readonly" class="form-control1 input-lg" id="Cdate1" />

							</div>

							<div class="form-group mb-n">
								<label for="largeinput">专利简介</label>

								<textarea rows="5" class="form-control1 control2"
									placeholder="内容不超过100字"></textarea>

							</div>
							<div class="form-group mb-n">
								<label for="largeinput">上传文件</label>
								<div style="">
									<div class="btn btn-default btn-file">

										<input type="file" name="attachment" value="Upload">
									</div>
									<p class="help-block">Max. 32MB</p>
								</div>
							</div>
							<div class="form-group mb-n">
								<label align="center"><button type="submit"
										class="btn btn-danger">确认提交</button></label>
								<button style="float: right;" type="reset" class="btn btn-info">重新填写</button>

							</div>
						</form>
					</div>
				</div>
				<div class="col-md-6 media_1-right widget-shadow">
					<div class="panel_2 panel_3" style="padding: 2em 2em 1em 2em;"
						id="pa_up">
						<form class="form-horizontal" id="updata" name="updata">
							<h3 class="title1" style="font-size: 1.2em; text-align: center;">修改信息</h3>
							<br>
							<div class="form-group mb-n">
								<label for="largeinput">专利名称</label> <input type="text"
									class="form-control1 input-lg"
									style="width: 17em; margin-left: 1em" id="largeinput"
									placeholder=" ">
							</div>

							<div class="form-group mb-n">
								<label for="largeinput">专利类别</label> <input type="text"
									class="form-control1 input-lg"
									style="width: 17em; margin-left: 1em" id="largeinput"
									placeholder=" ">
							</div>
							<div class="form-group mb-n">
								<label for="largeinput">申请时间</label> <input type="text"
									style="width: 17em; margin-left: 1em" name="Cdate2"
									readonly="readonly" class="form-control1 input-lg" id="Cdate2" />
							</div>
							<div class="form-group mb-n">
								<label for="largeinput">颁发时间</label> <input type="text"
									style="width: 17em; margin-left: 1em" name="Cdate3"
									readonly="readonly" class="form-control1 input-lg" id="Cdate3" />
							</div>

							<div class="form-group mb-n">
								<label for="largeinput">专利简介</label>

								<textarea rows="5" class="form-control1 control2"
									placeholder="内容不超过100字"></textarea>

							</div>
							<div class="form-group mb-n">
								<label for="largeinput">上传文件</label>
								<div style="">
									<div class="btn btn-default btn-file">

										<input type="file" name="attachment" value="Upload">
									</div>
									<p class="help-block">Max. 32MB</p>
								</div>
							</div>
							<div class="form-group mb-n" style="text-align: center;">
								<button style="float: left;" type="submit"
									class="btn btn-danger">确认修改</button>
								<button style="float: right;" type="reset" class="btn btn-info">取消</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>