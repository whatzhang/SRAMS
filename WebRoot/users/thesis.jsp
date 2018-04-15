<%@page import="javax.servlet.jsp.tagext.PageData"%>
<%@ page language="java" import="java.util.*,com.sust.entity.*"
	pageEncoding="UTF-8"%>
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
<body style="overflow-y: auto;">
	<%!int i = 0;%>
	<input type="hidden" name="numJ" id="numJ" />
	<div class="main-page">
		<div class="media" style="padding: 1em 1em 1em 1em;">
			<div class="panel-info">
				<div class=" panel-body-inputin">
					<form class="form-horizontal">
						<div class="form-group mb-n">
							<label for="largeinput" class=" control-label label-input-lg"
								style="margin-left: 2em; color: #e94e02;">选择查询条件及信息：</label>
						</div>
						<div class="form-group mb-n">
							<div class="col-sm-1" style="margin-left: 1em">
								<select class="form-control1">
									<option>论文名称</option>
									<option>发表时间</option>
									<option>发表期刊</option>
									<option>论文类别</option>
								</select>
							</div>
							<label for="largeinput"
								class="col-sm-1 control-label label-input-lg"
								style="color: #e94e02;">关键信息：</label>
							<div class="col-sm-4">
								<input type="text" class="form-control1 input-lg"
									id="largeinput" placeholder=" ">
							</div>
							<button type="submit" class="btn btn-success col-sm-1">查找</button>
							<button type="button" class="btn btn-success col-sm-1"
								style="float: right;margin-right: 2em;" onclick="dowenExcl();">导出Excl信息表</button>
						</div>
					</form>
				</div>
			</div>
			<br> <br>
			<div class="panel-info" style="padding: 1em 1em 1em 1em;">
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr class="success">
							<th style="text-align: center;vertical-align: middle; width: 4%;"><input
								type="checkbox" name="thId"></th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">论文名称</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">论文类别</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">发表时间</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">论文级别</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">影响因子</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">是否收录</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">收录编号</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">发表期刊</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">起止页码</th>
							<th
								style="text-align: center;vertical-align: middle; width: 25%;">论文简介</th>
							<th style="text-align: center;vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Thesis> lt = (List<Thesis>) request.getAttribute("list");
							if (lt != null) {
								for (i = 0; i < lt.size(); i++) {
						%>
						<tr>
							<td style="text-align: center;vertical-align: middle; width: 4%;"><input
								type="checkbox" value="<%=lt.get(i).getThId()%>" name="thId"></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThName()%>"><%=lt.get(i).getThName()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThCategory()%>"><%=lt.get(i).getThCategory()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThDate()%>"><%=lt.get(i).getThDate()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThLevel()%>"><%=lt.get(i).getThLevel()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThFactor()%>"><%=lt.get(i).getThFactor()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThIncluded()%>"><%=lt.get(i).getThIncluded()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThNumber()%>"><%=lt.get(i).getThNumber()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThJournal()%>"><%=lt.get(i).getThJournal()%></td>
							<td style="text-align: center;vertical-align: middle; width: 7%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThPage()%>"><%=lt.get(i).getThPage()%></td>
							<td
								style="text-align: center;vertical-align: middle; width: 25%;"
								data-toggle="tooltip" data-placement="top"
								title="<%=lt.get(i).getThAbout()%>"><%=lt.get(i).getThAbout()%></td>
							<th align="center"
								style="width: 8%;text-align: center;vertical-align: middle;">
								<div style="width: 100%;height: 2em;">
									<li style="float: left; width: 0.7em;margin-left: 0.85em;"><a
										href="javascript:void(0);"
										onclick="showUpThInfo(<%=lt.get(i).getThId()%>);" title="修改信息">
											<i class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
									</a></li>
									<li style="float: left; width: 0.7em;margin-left: 0.9em;"><a
										href="${pageContext.request.contextPath}/download/downloadTypeFile?type=thesis&id=<%=lt.get(i).getThId()%>"
										title="下载文件"> <i class="fa fa-download mail-icon"
											style="width: 1em;padding-left: 0.2em; "></i>
									</a></li>
									<li style="float: left; width: 0.7em;margin-left: 0.9em;"><a
										href="javascript:void(0);"
										onclick="delThInfo(<%=lt.get(i).getThId()%>);" title="删除信息">
											<i class="fa fa-trash-o mail-icon"
											style="width: 1em;padding-left: 0.2em; "></i>
									</a></li>
									<li
										style="float: left; width: 0.7em;margin-left: 0.8em;margin-right: 0.4em;"><a
										href="#myLookModal"
										onclick="setNum(<%=lt.get(i).getThId()%>);"
										data-toggle="modal" data-target="#myLookModal" title="查看信息">
											<i class="fa fa-book nav_icon"
											style="width: 0.15em;padding-left: 0.1em; "></i>
									</a></li>
								</div>
							</th>
						</tr>
						<%
							}
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
						href="${pageContext.request.contextPath}/thesis/getUserThInfo?page=${page.firstPage}&pageSize=${ps}">第一页</a>
					<a
						href="${pageContext.request.contextPath}/thesis/getUserThInfo?page=${page.nextPage}&pageSize=${ps}">下一页</a>
					<a
						href="${pageContext.request.contextPath}/thesis/getUserThInfo?page=${page.prePage}&pageSize=${ps}">上一页</a>
					<a
						href="${pageContext.request.contextPath}/thesis/getUserThInfo?page=${page.lastPage}&pageSize=${ps}">最后页</a>
				</div>
				</p>
			</div>
		</div>
		<div class="media">
			<div class="panel-info" style="padding: 0em 2em 1em 2em;"
				id="UpAndDe">
				<form class="form-horizontal" id="upAndadd" name="upAndadd">
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
							<input type="text" class="form-control1 input-lg" name="thName"
								title="论文名称" id="thName" placeholder="论文名称" required="required">
						</div>
						<div class="col-sm-4">
							<select class="form-control1" required="required" name="thCate"
								id="thCate" title="论文类别">
								<option value="">论文类别</option>
								<option value="类别1">类别1</option>
								<option value="类别2">类别2</option>
								<option value="类别3">类别3</option>
								<option value="其它">其他</option>
							</select>
						</div>
						<div class="col-sm-4">
							<input type="text" name="Cdate" readonly="readonly" title="发表时间"
								class="form-control1 input-lg" id="Cdate" required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="thLevel"
								title="论文级别" name="thLevel" placeholder="论文级别"
								required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="thfactor"
								title="影响因子" name="thfactor" placeholder="影响因子"
								required="required">
						</div>
						<div class="col-sm-4">
							<select class="form-control1" required="required" title="是否收录"
								name="thIscloud" id="thIscloud">
								<option value="">是否收录</option>
								<option value="1">是</option>
								<option value="0">否</option>
								<option value="2">其它</option>
							</select>
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-4">

							<input type="text" class="form-control1 input-lg" id="thNum"
								title="收录编码" name="thNum" placeholder="收录号码" required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="thJour"
								title="发表期刊" name="thJour" placeholder="发表期刊"
								required="required">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control1 input-lg" id="thPage"
								title="起止页码" name="thPage" placeholder="起止页码（例：12-15）"
								required="required">
						</div>
					</div>
					<div class="form-group mb-n">
						<div class="col-sm-12">
							<textarea rows="2" class="form-control1 control2 " name="thAbout"
								id="thAbout" style="font-size: 1em;"
								placeholder="请简要描述论文信息，不超过200字" required="required"></textarea>
						</div>
					</div>
					<div class="form-group mb-n col-sm-6"
						style="padding-right: 2em;float: right;">
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
							<tr style="text-align: center;vertical-align: middle; ">
								<td><label for="largeinput"
									class="control-label label-input-lg">论文名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_na" id="th_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">论文类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_ca" id="th_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">论文作者</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_au" id="th_au" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">发表时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_da" id="th_da" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">论文级别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_le" id="th_le" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">影响因子</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_fa" id="th_fa" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">是否收录</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_is" id="th_is" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">收录编号</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_nu" id="th_nu" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">发表期刊</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_ja" id="th_ja" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">起止页码</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_pa" id="th_pa" readonly="true"></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">论文简介</label></td>
							</tr>
							<tr>
								<td colspan="4"><textarea class="form-control1 control2"
										name="th_ab" id="th_ab" style="font-size: 1em;height: 10em;"
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
			var num = 0;
			var idd = 0;
			var flog = 1;
			var ms = "确认修改此信息？";
			function setNum(d) {
				document.getElementById("numJ").value = d;
				num = document.getElementById("numJ").value;
				idd = d;
				show();
			}
			function showModal(data) {
				$("#th_na").val(data.thName);
				$("#th_ca").val(data.thCategory);
				$("#th_au").val(data.thAuthor);
				$("#th_da").val(data.thDate);
				$("#th_le").val(data.thLevel);
				$("#th_fa").val(data.thFactor);
				$("#th_is").val(data.thIncluded);
				$("#th_nu").val(data.thNumber);
				$("#th_ja").val(data.thJournal);
				$("#th_pa").val(data.thPage);
				$("#th_ab").val(data.thAbout);
				showUpInfo(data);
			}
			function show() {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/thesis/getShowInfo",
					data : {
						thId : idd
					},
					dataType : 'json',
					cache : false,
					async : true,
					success : showModal,
					error : function(data) {
						alert("showThesis error!");
					}
				});
			}
			function showUpInfo(data) {
				$("#thName").val(data.thName);
				$("#thCate").get(0).options[0].text = data.thCategory;
				$("#Cdate").val(data.thDate);
				$("#thLevel").val(data.thLevel);
				$("#thfactor").val(data.thFactor);
				$("#thIscloud").get(0).options[0].text = data.thIncluded;
				$("#thNum").val(data.thNumber);
				$("#thJour").val(data.thJournal);
				$("#thPage").val(data.thPage);
				$("#thAbout").val(data.thAbout);
			}
			function showUpThInfo(upId) {
			    idd = upId;
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/thesis/getThInfoUp",
					data : {
						upId : upId
					},
					dataType : 'json',
					cache : false,
					async : true,
					success : showUpInfo,
					error : function(data) {
						alert("updateThesis error!");
					}
				});
			}
			function delThesis(deId,fg) {
			var too ={"deId" : deId,
			          "fg" : fg 
		     }
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/thesis/DeleteThInfo",
					data : too,
					dataType : 'json',
					cache : false,
					async : true,
					success : function(data){
					     alert(data.string1);
					     window.location.href = "${pageContext.request.contextPath}/thesis/getUserThInfo";
					},
					error : function(data) {
						alert("删除信息出错!");
					}
				});
			}
			function delThInfo(deId){
			    var fg ;
			    if (confirm("确定要删除吗？") == true) {
				      if(confirm("是否删除电子文件？")){
				         fg = "yes";
				      }else{
				         fg = 'no';
				      }
					  delThesis(deId,fg);
			    } else {
					return false;
				}
			}
			function reSet() {
				$("#thCate").get(0).options[0].text = "论文类别";
				$("#thIscloud").get(0).options[0].text = "是否收录";
			}
			function add() {
				$("#Change").removeClass("btn btn-danger");
				$("#Change").addClass("btn btn-default");
				$("#Add").addClass("btn btn-danger");
				$("sureCh").button("确认添加");
				ms = "确认添加此信息？";
				$('#upAndadd')[0].reset();
				reSet();
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
			function getObjectURL(file) {
				var url = null;
				if (window.createObjcectURL != undefined) {
					url = window.createOjcectURL(file);
				} else if (window.URL != undefined) {
					url = window.URL.createObjectURL(file);
				} else if (window.webkitURL != undefined) {
					url = window.webkitURL.createObjectURL(file);
				}
				return url;
			}
			//添加信息
			function addThInfo() {
				var thName = $("#thName").val();
				var thCate = $("#thCate").val();
				var Cdate = $("#Cdate").val();
				var thLevel = $("#thLevel").val();
				var thfactor = $("#thfactor").val();
				var thIscloud = $("#thIscloud").val();
				var thNum = $("#thNum").val();
				var thJour = $("#thJour").val();
				var thPage = $("#thPage").val();
				var thAbout = $("#thAbout").val();
				//alert(thName + "++" + thCate + "++" + Cdate + "++" + thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage + "++" + thAbout);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/thesis/addThesisInfo",
					data : {
					    usId : <%=login.getUsId()%>,
						thName : thName,
						thCate : thCate,
						Cdate : Cdate,
						thLevel : thLevel,
						thfactor : thfactor,
						thIscloud : thIscloud,
						thNum : thNum,
						thJour : thJour,
						thPage : thPage,
						thAbout : thAbout
					},
					dataType : 'json',
					cache : false,
					async : false,
					success : function(data) {
						alert(data.info);
					    window.location.href = "${pageContext.request.contextPath}"+data.urlNext;
					}, 
					error : function() {
                        alert("添加信息出错！");
					}
				});
			}
			//更新信息
			function updateThInfo() {
				var thName = $("#thName").val();
				var thCate = $("#thCate").val();
				var Cdate = $("#Cdate").val();
				var thLevel = $("#thLevel").val();
				var thfactor = $("#thfactor").val();
				var thIscloud = $("#thIscloud").val();
				var thNum = $("#thNum").val();
				var thJour = $("#thJour").val();
				var thPage = $("#thPage").val();
				var thAbout = $("#thAbout").val();
				//alert(thName + "++" + thCate + "++" + Cdate + "++" + thLevel + "++" + thfactor + "++" + thIscloud + "++" + thNum + "++" + thJour + "++" + thPage + "++" + thAbout);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/thesis/updateThInfo",
					data : {
					    usId : <%=login.getUsId()%>,
					    thId : upThId,
						thName : thName,
						thCate : thCate,
						Cdate : Cdate,
						thLevel : thLevel,
						thfactor : thfactor,
						thIscloud : thIscloud,
						thNum : thNum,
						thJour : thJour,
						thPage : thPage,
						thAbout : thAbout
					},
					dataType : 'json',
					cache : false,
					async : false,
					success : function(data) {
						alert(data.info);
					    window.location.href = "${pageContext.request.contextPath}"+data.urlNext; 
					}, 
					error : function() {
					    alert("修改信息出错！");
					}
				});
			}
			function isOp() {
				if (confirm(ms) == true) {
					if (flog == 0) {
						addThInfo();
					} else {
						updateThInfo();
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
		            url : "${pageContext.request.contextPath}/upload/uploadFileAjax?type=thesis",
		            contentType : "application/x-www-form-urlencoded; charset=utf-8",
		            data : {
		            	ID : idd
		            },
		            success: function(data) {
			            alert(data.string1);
		            },
		            error: function (data){
		                alert("出错");
		            }  
		         });
		    }
		    function rePages(){
				   var page = $("#pageSize").val();
				   window.location.href = "${pageContext.request.contextPath}/thesis/getUserThInfo?pageSize="+page;
            }
            function dowenExcl(){
				$.ajax({
					type : "POST",
					url : "",
					data : {
					   type : "thesis",
					   usId : <%=login.getUsId()%>
					},
					dataType : 'json',
					cache : false,
					async : true,
					success : function(data){
					     console.info(data.string1);
					},
					error : function(data) {
						alert("下载信息出错!");
					}
				});
            }
		</script>
</body>
</html>

