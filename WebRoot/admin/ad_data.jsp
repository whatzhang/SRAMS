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
<style type="text/css">
.kk {
	height: 30em;
	/* border: 1px solid red; */
}

.cc {
	height: 2.5em;
	width: 20%;
	background-color: #FF9966;
	border-radius: 0.5em;
	margin-top: 1.5em;
	text-align: center;
	padding-top: 0.3em;
	padding-bottom: 0.5em;
	margin-left: 2em;
}

.dd {
	height: 2.5em;
	width: 80%;
	margin-top: 1.5em;
}

.ee {
	font-size: 1.3em;
	color: #fff;
}
</style>
</head>
<body>
	<div class="col-md-3 cc">
		<span class="ee">信息导出备份/导入:</span>
	</div>
	
	<div class="panel-group " id="accordion" role="tablist"
		aria-multiselectable="true"
		style="padding: 0em 2em 2em 2em; height: 60em;margin-top: 5em;">

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
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-danger" data-toggle="modal"
								onclick="getTemplets('typeData')" data-target="#exampleModal1">获取以上Excel模板</button>
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">导出信息</a>
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
						</label> <label class="col-sm-3 " align="center">
							<button type="button" class="btn btn-danger" data-toggle="modal"
								onclick="exportExcel('typeData')" data-target="#exampleModal1">导出以上信息</button>
					</div>
				</div>
			</div>
		</div>

		<!-- <div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree"> 导入信息</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body" style="text-align: left;">
					<form class="form-horizontal" action="" name="">
						<div class="form-group mb-n">
							<div class="col-sm-3">
								<label for="largeinput" class="control-label"
									style="color: lightgreen; ">请先获取Excel表模板</label>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<label for="largeinput" class="control-label">导入论文数据</label> <input
									type="file" class="btn btn-default" name="thesis" />
							</div>
							<div class="col-sm-6">
								<label for="largeinput" class="control-label">导入专利数据</label> <input
									type="file" class="btn btn-default" name="patent" />
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<label for="largeinput" class="control-label">导入获奖数据</label> <input
									type="file" class="btn btn-default" name="praise" />
							</div>
							<div class="col-sm-6">
								<label for="largeinput" class="control-label">导入教材数据</label> <input
									type="file" class="btn btn-default" name="book" />
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<label for="largeinput" class="control-label">导入竞赛数据</label> <input
									type="file" class="btn btn-default" name="race" />
							</div>
							<div class="col-sm-6">
								<label for="largeinput" class="control-label">导入用户数据</label> <input
									type="file" class="btn btn-default" name="user" />
							</div>
						</div>
						<div class="form-group mb-n"></div>
						<div class="modal-footer" style="margin-left: 2em;">
							<button type="submit" onclick="return sure();"
								class="btn btn-primary">提交</button>
							<button type="reset" class="btn btn-default">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingFour">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseFour"
						aria-expanded="false" aria-controls="collapseFour">导入全部信息 </a>
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
		</div> -->
		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="heading1">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion"
						href="#collapse1" aria-expanded="true" aria-controls="collapse1">导出部分文件</a>
				</h4>
			</div>

			<div id="collapse1" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="heading1">
				<div class="panel-body">
					<div class="form-group mb-n col-sm-12" style="text-align: center;"
						align="center">

						<label class="col-sm-4 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportFile('thesis')" data-target="#exampleModal1">导出论文文件</button>
						</label> <label class="col-sm-4 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportFile('patent')" data-target="#exampleModal1">导出专利文件</button>
						</label> <label class="col-sm-4 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportFile('praise')" data-target="#exampleModal1">导出获奖文件</button>
					</div>

					<div class="form-group mb-n col-sm-12" style="text-align: center;">
						<label class="col-sm-4 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportFile('book')" data-target="#exampleModal1">导出教材文件</button>
						</label> <label class="col-sm-4 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportFile('race')" data-target="#exampleModal1">导出竞赛文件</button>
						</label> <label class="col-sm-4 " align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								onclick="exportFile('project')" data-target="#exampleModal1">导出项目文件</button>
						</label>
					</div>
				</div>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="heading2">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapse2" aria-expanded="false"
						aria-controls="collapse2">导出全部 </a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="heading2">
				<div class="panel-body">
					<div class="form-group mb-n"
						style="margin: 5em 0em 5em 0em; text-align: center;">
						<button type="button" onclick="exportFile('all')"
							class="btn btn-primary">一键导出所有文件</button>
						<button type="button" onclick="exportFile('allData')"
							class="btn btn-primary">一键导出所有文件及Excel表</button>
					</div>
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
		function sure() {
			if (confirm("确定要提交操作？")) {
				return true;
			} else {
				return false;
			}
		}
		function exportFile(info) {
			if (confirm("确定要提交操作？")) {
				window.location.href = "${pageContext.request.contextPath}/download/downloadTypeZipFiles?type=" + info;
			}
		}
	</script>
</body>
</html>
