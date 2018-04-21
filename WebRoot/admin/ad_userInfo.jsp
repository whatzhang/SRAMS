<%@ page language="java" import="java.util.*,com.sust.entity.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<form class="form-horizontal">
						<div class="form-group mb-n">
							<label for="largeinput" class=" control-label label-input-lg"
								style="margin-left: 2em; color: #e94e02;">选择查询条件及信息：</label>
						</div>
						<div class="form-group">
							<div class="col-sm-2" style="margin-left: 1em">
								<select class="form-control1">
									<option>论文名称</option>
									<option>发表时间</option>
									<option>发表期刊</option>
									<option>论文类别</option>
								</select>
							</div>
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg"
								style="color: #e94e02;">关键信息：</label>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
							<button type="submit" class="btn btn-success col-sm-1">查找</button>
							<a
								href="${pageContext.request.contextPath}/download/downloadTypeExcl?type=user"><button
									type="button" class="btn btn-success col-sm-2"
									style="float: right; margin-right: 2em;">导出Excl信息表</button></a>
						</div>
					</form>
				</div>
			</div>
			<br>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr class="success">
							<th style="text-align: center; vertical-align: middle;width: 4%;"><input
								type="checkbox" name="usId"></th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">昵称</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">用户姓名</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">年龄</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">性别</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">生日</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">身份</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">专业</th>
							<th style="text-align: center; vertical-align: middle;width: 8%;">学/工号</th>
							<th style="text-align: center; vertical-align: middle;width: 11%;">联系地址</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">联系电话</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">E-mail</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">所属学院</th>
							<th style="text-align: center; vertical-align: middle;width: 7%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < 10; i++) {
						%>
						<tr>
							<td
								style="text-align: center; vertical-align: middle; width: 4%;"><input
								type="checkbox" value="${RaceList.prId}" name="usId"></td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">111111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">11111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">1111111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">111122</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">111122</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">111111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">11111111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 8%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">111111111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 11%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">11111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">111111111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">22211111111111</td>
							<td
								style="text-align: center; vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="${RaceList.prName}">11111111111</td>
							<th align="center"
								style="width: 7%; text-align: center; vertical-align: middle;">
								<div style="width: 100%; height: 2em;">
									<li style="float: left; width: 0.7em; margin-left: 0.6em;"><a
										href="javascript:void(0);" onclick="upDataInfo()"
										title="修改用户信息"> <i class="fa fa-cogs nav_icon"
											style="width: 0.15em"></i>
									</a></li>
									<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
										href="javascript:void(0);" onclick="delInfo();" title="删除用户">
											<i class="fa fa-trash-o mail-icon"
											style="width: 1em; padding-left: 0.2em;"></i>
									</a></li>
									<li
										style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
										href="#myLookModal" onclick="showMadel();" data-toggle="modal"
										data-target="#myLookModal" title="查看用户信息"> <i
											class="fa fa-book nav_icon"
											style="width: 0.15em; padding-left: 0.1em;"></i>
									</a></li>
								</div>
							</th>
						</tr>
						<%
							}
						%>
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
						href="${pageContext.request.contextPath}/praise/getUserPraiseInfo?page=${page.firstPage}&pageSize=${ps}">第一页</a>
					<a
						href="${pageContext.request.contextPath}/praise/getUserPraiseInfo?page=${page.nextPage}&pageSize=${ps}">下一页</a>
					<a
						href="${pageContext.request.contextPath}/praise/getUserPraiseInfo?page=${page.prePage}&pageSize=${ps}">上一页</a>
					<a
						href="${pageContext.request.contextPath}/praise/getUserPraiseInfo?page=${page.lastPage}&pageSize=${ps}">最后页</a>
				</div>
				</p>
			</div>
			<hr>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<div class=" panel-body-inputin">
					<br>
					<form class="form-horizontal" name="userInfo" id="userInfo">
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
								<input type="text" class="form-control1 input-lg" id="Name"
									title="用户姓名" placeholder="用户姓名" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Age"
									title="用户年龄" placeholder="用户年龄 " value=""
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Cdate"
									id="Cdate" title="出生日期" value=""
									readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4">
								<select class="form-control1" id="shenF" title="用户身份">
									<option>用户身份</option>
									<option>任职教师</option>
									<option>在校学生</option>
									<option>学校职工</option>
									<option>其他</option>
								</select>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Num"
									title="学号/工号" placeholder="学号/工号" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Address"
									title="联系地址" placeholder="联系地址" value=""
									readonly="readonly">
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Phone"
									title="联系电话" placeholder="联系电话" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Mail"
									title="E-mail" placeholder="E-mail" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-4">
								<select class="form-control1" id="Xueyuan" title="所属学院">
									<option>所属学院</option>
									<option>学院1</option>
									<option>学院2</option>
									<option>学院3</option>
									<option>其他</option>
								</select>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg" id="Majer"
									title="专业" placeholder="专业" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-4" title="用户性别">
								<div class="radio-inline">
									<label><input type="radio" id="sex" name="sex"
										value="1" checked> 男</label>
								</div>
								<div class="radio-inline">
									<label><input type="radio" id="sex" name="sex"
										value="0"> 女</label>
								</div>
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Qu1"
									title="密保问题一" placeholder="密保问题一" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Key1"
									title="预留答案一" placeholder="预留答案一" value=""
									readonly="readonly">
							</div>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Qu2"
									title="密保问题二" placeholder="密保问题二" value=""
									readonly="readonly">
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control1 input-lg" id="Key2"
									title="预留答案二" placeholder="预留答案二" value=""
									readonly="readonly">
							</div>
						</div>
						<br>
						<hr>
						<div class="form-group mb-n col-sm-6"
						style="padding-right: 2em; float: right;">
						<button style="float: right;" type="reset" class="btn btn-info"
							onclick="reSet();">重新填写</button>
						<button style="float: right; margin-right: 1em;" type="submit"
							class="btn btn-success" onclick="return isOp();">确认提交</button>
					</div>
					</form>
				</div>
			</div>
			<div class="clearfix"></div>
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
				window.location.href = "${pageContext.request.contextPath}/book/getAllBoList";
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
			    window.location.href = "${pageContext.request.contextPath}/book/getAllBoList";
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
			    window.location.href = "${pageContext.request.contextPath}/book/getAllBoList";
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
    function rePages(){
		   var page = $("#pageSize").val();
		   window.location.href = "${pageContext.request.contextPath}/book/getAllBoList?pageSize="+page;
		   window.parent.scrollTo(0, 0);
   }
</script>
</html>

