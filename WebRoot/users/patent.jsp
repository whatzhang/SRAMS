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
							<label class="col-sm-2 " align="center"><button
									type="submit" class="btn btn-success">查找</button></label>
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
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="paId" id="paId"></th>
							<th
								style="text-align: center; vertical-align: middle; width: 14%;">专利名称</th>
							<th
								style="text-align: center; vertical-align: middle; width: 12%;">专利类别</th>
							<th
								style="text-align: center; vertical-align: middle; width: 12%;">申请时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 12%;">授权时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 12%;">专利号</th>
							<th
								style="text-align: center; vertical-align: middle; width: 25%;">专利简介</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.PatentList}" var="List">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${List.paId}" name="paId"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 14%;"
									data-toggle="tooltip" data-placement="top"
									title="${List.paName}">${List.paName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 12%;"
									data-toggle="tooltip" data-placement="top"
									title="${List.paCategory}">${List.paCategory}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 12%;"
									data-toggle="tooltip" data-placement="top"
									title="${List.paPlease}">${List.paPlease}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 12%;"
									data-toggle="tooltip" data-placement="top"
									title="${List.paDate}">${List.paDate}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 12%;"
									data-toggle="tooltip" data-placement="top"
									title="${List.paNumber}">${List.paNumber}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 25%;"
									data-toggle="tooltip" data-placement="top"
									title="${List.paAbout}">${List.paAbout}</td>
								<th align="center"
									style="width: 8%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpInfo(${List.paId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=patent&id=${List.paId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);" onclick="delInfo(${List.paId});"
											title="删除信息"> <i class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setInfo(${List.paId});"
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
							<input type="text" class="form-control1 input-lg" name="raName"
								title="专利名称" id="raName" placeholder="专利名称" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg"
								name="raCategory" title="专利类别" id="raCategory"
								placeholder="专利类别" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="raLevel"
								title="专利号" name="raLevel" placeholder="专利号" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-4">
							<input type="text" name="Cdate" readonly="readonly" title="申请时间"
								class="form-control1 input-lg" id="Cdate" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" name="Cdate1" readonly="readonly" title="授权时间"
								class="form-control1 input-lg" id="Cdate1" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-12">
							<textarea rows="2" class="form-control1 control2 " name="raAbout"
								id="raAbout" style="font-size: 1em;"
								placeholder="请简要描述专利信息，不超过200字" required="required"></textarea>
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
									class="control-label label-input-lg">专利名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_na" id="ra_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">专利类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_ca" id="ra_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">申请时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_ty" id="ra_ty" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">授权时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_da" id="ra_da" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">专利号</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_le" id="ra_le" readonly="true"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">专利简介</label></td>
							</tr>
							<tr>
								<td colspan="4"><textarea class="form-control1 control2"
										name="ra_ab" id="ra_ab" style="font-size: 1em; height: 10em;"
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
	<script type="text/javascript">
    var flog = 1;
    var idd =null;
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
    	$("#raName").val(data.paName);
		$("#raCategory").val(data.paCategory);
		$("#raLevel").val(data.paNumber);
		$("#Cdate").val(data.paPlease);
		$("#Cdate1").val(data.paDate);
		$("#raAbout").val(data.paAbout);
	}
    function showInfoModel(data) {
    	 $("#ra_na").val(data.paName);
		 $("#ra_ca").val(data.paCategory);
		 $("#ra_ty").val(data.paPlease);
		 $("#ra_da").val(data.paDate);
		 $("#ra_le").val(data.paNumber);
		$("#ra_ab").val(data.paAbout);
		showInfo(data);
	}
    function setInfo(Id) {
    	idd = Id;
    	$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/patent/getPaInfo",
			data : {
				Id : Id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : showInfoModel,
			error : function(data) {
				alert("updateThesis error!");
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
			url : "${pageContext.request.contextPath}/patent/DeletePaInfo",
			data : too,
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data){
				alert(data.string1);
				window.location.href = "${pageContext.request.contextPath}/patent/getUserPaInfo";
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
			url : "${pageContext.request.contextPath}/patent/getPaInfo",
			data : {
				Id : Id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : showInfo,
			error : function(data) {
				alert("updateThesis error!");
			}
		});
	}
    function UpRaInfo() {
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/patent/upPaInfo",
			data : {
				usId : <%=login.getUsId()%>,
				Id : idd,
				paName : $("#raName").val(),
				paCategory : $("#raCategory").val(),
				paNumber : $("#raLevel").val(),
				paPlease : $("#Cdate").val(),
				paDate : $("#Cdate1").val(),
				paAbout : $("#raAbout").val()
			},
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				alert("修改成功！");
			    window.location.href = "${pageContext.request.contextPath}/patent/getUserPaInfo";
			}, 
			error : function(data) {
				alert("updateRace error!");
			}
		});
	}
    function addRaInfo() {
    	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/patent/addPaInfo",
			data : {
				usId : <%=login.getUsId()%>,
				paName : $("#raName").val(),
				paCategory : $("#raCategory").val(),
				paNumber : $("#raLevel").val(),
				paPlease : $("#Cdate").val(),
				paDate : $("#Cdate1").val(),
				paAbout : $("#raAbout").val()
			},
			dataType : 'json',
			cache : false,
			async : false,
			success : function(data) {
				alert("添加成功！");
				 window.location.href = "${pageContext.request.contextPath}/patent/getUserPaInfo";
			}, 
			error : function(data) {
				alert("updateRace error!");
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
            url : "${pageContext.request.contextPath}/upload/uploadFileAjax?type=patent",
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            data : {
            	ID : idd
            },
            success: function(data) {
	            alert(data.string1);
			    //window.location.href = "${pageContext.request.contextPath}/patent/getUserPaInfo";
            },
            error: function (data){
                alert("出错");
            }  
         });
    }
</script>
</body>
</html>