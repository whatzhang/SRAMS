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

<link href="css/font-awesome.css" rel="stylesheet" type="text/css">

<script src="js/jquery-1.11.1.min.js"></script>

<script src="js/bootstrap.js"></script>

</head>

<body style="height: 63em;">

	<div class="panel-group " id="accordion" role="tablist"
		aria-multiselectable="true"
		style="padding: 2em 2em 2em 2em; height: 60em;">
		<h4 class="title2" style="color: #4682B4; margin-bottom: 1em;">信息导出备份/导入:</h4>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapsew" aria-expanded="true" aria-controls="collapseOne">获取Excel模板</a>
				</h4>
			</div>
			<div id="collapsew" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					<div class="form-group mb-n col-sm-12" style="text-align: center;"
						align="center">

						<label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('thesis');" data-target="#exampleModal1">获取论文Excel模板</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('patent');" data-target="#exampleModal1">获取专利Excel模板</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('praise');" data-target="#exampleModal1">获取获奖Excel模板</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('project');" data-target="#exampleModal1">获取项目Excel模板</button>
						</label>
					</div>

					<div class="form-group mb-n col-sm-12" style="text-align: center;">
						<label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('book');" data-target="#exampleModal1">获取教材Excel模板</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('race');" data-target="#exampleModal1">获取竞赛Excel模板</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="getTemplets('user');" data-target="#exampleModal1">获取用户Excel模板</button>
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">导出部分数据</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="headingOne">
				<div class="panel-body">
					<div class="form-group mb-n col-sm-12" style="text-align: center;"
						align="center">

						<label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('thesis')" data-target="#exampleModal1">导出论文信息</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('patent')" data-target="#exampleModal1">导出专利信息</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('praise')" data-target="#exampleModal1">导出获奖信息</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('project')" data-target="#exampleModal1">导出项目信息</button>
						</label>
					</div>

					<div class="form-group mb-n col-sm-12" style="text-align: center;">
						<label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('book')" data-target="#exampleModal1">导出教材信息</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('race')" data-target="#exampleModal1">导出竞赛信息</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportExcel('user')" data-target="#exampleModal1">导出用户信息</button>
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo">导出全部数据 </a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="headingTwo">
				<div class="panel-body">
					<div class="form-group mb-n"
						style="margin: 5em 0em 5em 0em; text-align: center;">
						<!-- <a href="#exampleModal1" data-toggle="modal"
							data-target="#exampleModal1"> -->
						<button type="button" onclick="exportExcel('all')" class="btn btn-primary">一键导出所有信息</button>
						<!-- </a> -->
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree"> 导入部分数据 </a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">

					<div class="form-group mb-n"
						style="margin: 1em 0em 0em 3em; text-align: center;">
						<form action="" name="">
							<table class="table">
								<tr>
									<td><label for="largeinput" class="control-label"
										style="color: lightgreen; padding: 3px 0px 1px 9em;">请先获取Excel表模板</label>
									</td>
									<td></td>
								</tr>
								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入论文数据</label></td>
									<td><input type="file" class="btn btn-default"
										name="thesis" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入专利数据</label></td>
									<td><input type="file" class="btn btn-default"
										name="patent" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入获奖数据</label></td>
									<td><input type="file" class="btn btn-default"
										name="praise" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入项目数据</label></td>
									<td><input type="file" class="btn btn-default"
										name="project" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入教材数据</label></td>
									<td><input type="file" class="btn btn-default" name="book" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入竞赛数据</label></td>
									<td><input type="file" class="btn btn-default" name="race" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入用户数据</label></td>
									<td><input type="file" class="btn btn-default"
										name="users" /></td>
								</tr>
							</table>
							<div class="modal-footer" style="margin-left: 2em;">
								<!-- <a href="#exampleModal" data-toggle="modal"
									data-target="#exampleModal"> -->
								<button type="submit" onclick="sure()" class="btn btn-primary">提交</button>
								<!-- </a> -->
								<button type="reset" class="btn btn-default">取消</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingFour">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseFour"
						aria-expanded="false" aria-controls="collapseFour">导入全部数据 </a>
				</h4>
			</div>
			<div id="collapseFour" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingFour">
				<div class="panel-body">
					<form action="" name="" enctype="multipart/form-data">
						<div class="form-group mb-n" style="margin: 3em 0em 3em 0em;">
							<div align="center">
								<label for="largeinput" class="control-label"
									style="color: lightgreen; margin-bottom: 2em;">请先获取Excel表模板</label>
							</div>
							<div align="center">
								<input type="file" class="btn btn-default" name="inputAllFile"
									multiple="multiple">
							</div>
							<div style="margin-top: 2em;" align="center">
								<button type="submit" onclick="sure()" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
		
			
				
					
						
							
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="panel-group " id="accordion" role="tablist"
		aria-multiselectable="true"
		style="padding: 2em 2em 2em 2em; height: 60em;">
		<h4 class="title2" style="color: #4682B4; margin-bottom: 1em;">文件导出备份/导入:</h4>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapse1" aria-expanded="true"
						aria-controls="collapse1">导出部分文件</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="heading1">
				<div class="panel-body">
					<div class="form-group mb-n col-sm-12" style="text-align: center;"
						align="center">

						<label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="export()" data-target="#exampleModal1">导出论文文件</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="sure()" data-target="#exampleModal1">导出专利文件</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="sure()" data-target="#exampleModal1">导出获奖文件</button>
					</div>

					<div class="form-group mb-n col-sm-12" style="text-align: center;">
						<label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="sure()" data-target="#exampleModal1">导出教材文件</button>
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="sure()" data-target="#exampleModal1">导出竞赛文件</button>
					    </label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="sure()" data-target="#exampleModal1">导出项目文件</button>
						</label>
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapse2" aria-expanded="false"
						aria-controls="collapse2">导出全部文件 </a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="heading2">
				<div class="panel-body">
					<div class="form-group mb-n"
						style="margin: 5em 0em 5em 0em; text-align: center;">
						<!-- <a href="#exampleModal1" data-toggle="modal"
							data-target="#exampleModal1"> -->
						<button type="button" onclick="sure()" class="btn btn-primary">一键导出所有文件</button>
						<!-- </a> -->
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapse3"
						aria-expanded="false" aria-controls="collapse3"> 导入部分数据 </a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="heading3">
				<div class="panel-body">

					<div class="form-group mb-n"
						style="margin: 1em 0em 0em 3em; text-align: center;">
						<form action="" name="">
							<table class="table">
								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入论文数据文件</label></td>
									<td><input type="file" class="btn btn-default"
										name="thesis" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入专利数据文件</label></td>
									<td><input type="file" class="btn btn-default"
										name="patent" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入获奖数据文件</label></td>
									<td><input type="file" class="btn btn-default"
										name="praise" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入项目数据文件</label></td>
									<td><input type="file" class="btn btn-default"
										name="project" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入教材数据文件</label></td>
									<td><input type="file" class="btn btn-default" name="book" /></td>
								</tr>

								<tr>
									<td><label for="largeinput" class="control-label"
										style="padding: 3px 0px 1px 9em;">导入竞赛数据文件</label></td>
									<td><input type="file" class="btn btn-default" name="race" /></td>
								</tr>
							</table>
							<div class="modal-footer" style="margin-left: 2em;">
								<!-- <a href="#exampleModal" data-toggle="modal"
									data-target="#exampleModal"> -->
								<button type="submit" onclick="sure()" class="btn btn-primary">提交</button>
								<!-- </a> -->
								<button type="reset" class="btn btn-default">取消</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingFour">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapse4"
						aria-expanded="false" aria-controls="collapse4">导入全部数据 </a>
				</h4>
			</div>
			<div id="collapse4" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="heading4">
				<div class="panel-body">
					<form action="" name="" enctype="multipart/form-data">
						<div class="form-group mb-n" style="margin: 3em 0em 3em 0em;">
							<div align="center">
								<input type="file" class="btn btn-default" name="inputAllFile"
									multiple="multiple">
							</div>
							<div style="margin-top: 2em;" align="center">
								<button type="submit" onclick="sure()" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">取消</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function getTemplets(info) {
			if (confirm("确定要提交操作？")) {
				window.location.href = "${pageContext.request.contextPath}/download/downloadExcelTemplets?type=" + info;
			}
		}
		function exportExcel(info) {
		    if (confirm("确定要提交操作？")) {
				window.location.href = "${pageContext.request.contextPath}/download/downloadAllTypeExcl?type=" + info;
			}
		}
	</script>
</body>
</html>
