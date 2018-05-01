<%@ page language="java" import="java.util.*,com.sust.entity.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript">
	var isGui = 0;
</script>
</head>
<body>
	<div class="media" style="padding: 2em 2em 2em 2em;">
		<div>
			<div class="form-group mb-n">
				<label for="largeinput" class=" control-label label-input-lg"
					style=" font-size: 1em; color: #e94e02;">选择归纳条件：</label>
				<div style="float: right;">
					<a
						href="${pageContext.request.contextPath}/CountData/downloadGuiNaExcl?type=${flog}"
						onclick="return isGuiNa()">
						<button type="button" class="btn btn-success">导出信息</button>
					</a> <a
						href="${pageContext.request.contextPath}/CountData/downloadGuiNaFile?type=${flog}"
						onclick="return isGuiNa()">
						<button type="button" class="btn btn-success">导出文件</button>
					</a> <a
						href="${pageContext.request.contextPath}/CountData/downloadGuiNaALL?type=${flog}"
						onclick="return isGuiNa()">
						<button type="button" class="btn btn-success">全部导出</button>
					</a>
				</div>
			</div>
			<div class="form-group">
				<form class="form-horizontal" name="Guina1" id="Guina1">
					<div class="form-group mb-n" style="margin-top: 2em;">
						<div class="col-sm-2" style="width: 12em;">
							<select class="form-control1" id="Type" name="Type"
								required="required" onchange="setGuiNaType();">
								<option value="none">选择归纳类别</option>
								<option value="thesis">论文</option>
								<option value="patent">专利</option>
								<option value="praise">获奖</option>
								<option value="project">项目</option>
								<option value="book">教材</option>
								<option value="race">竞赛</option>
							</select>
						</div>
						<!--论文 -->
						<div id="Thesis" style="display:none">
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									发表时间&le;<input type="text" name="date" title="发表时间"
										class="form-control1 input-lg" id="date" style="width: 7em;">
									&ge;<input type="text" name="Cdate" title="发表时间"
										class="form-control1 input-lg" id="Cdate" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="thCate" name="thCate">
									<option value="">论文类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="thle" name="thle">
									<option value="">论文级别</option>
									<option value="1">一级</option>
									<option value="2">二级</option>
								</select>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="thIsCl" name="thIsCl">
									<option value="">是否收录</option>
									<option value="1">已收录</option>
									<option value="0">没收录</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date1" title="文件上传时间"
										class="form-control1 input-lg" id="date1" style="width: 7em;">
									&ge;<input type="text" name="Cdate1" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate1" style="width: 7em;">
								</div>
							</div>
						</div>
						<!--专利 -->
						<div id="Patent" style="display:none">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="PaCate" name="PaCate">
									<option value="">专利类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									授权时间&le;<input type="text" name="date2" title="授权时间"
										class="form-control1 input-lg" id="date2" style="width: 7em;">
									&ge;<input type="text" name="Cdate2" title="授权时间"
										class="form-control1 input-lg" id="Cdate2" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date3" title="文件上传时间"
										class="form-control1 input-lg" id="date3" style="width: 7em;">
									&ge;<input type="text" name="Cdate3" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate3" style="width: 7em;">
								</div>
							</div>
						</div>
						<!--获奖 -->
						<div id="Praise" style="display:none">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="PrCate" name="PrCate">
									<option value="">获奖类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									获奖时间&le;<input type="text" name="date4" title="获奖时间"
										class="form-control1 input-lg" id="date4" style="width: 7em;">
									&ge;<input type="text" name="Cdate4" title="获奖时间"
										class="form-control1 input-lg" id="Cdate4" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date5" title="文件上传时间"
										class="form-control1 input-lg" id="date5" style="width: 7em;">
									&ge;<input type="text" name="Cdate5" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate5" style="width: 7em;">
								</div>
							</div>
						</div>
						<!--项目 -->
						<div id="Project" style="display:none">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="ProCate" name="ProCate">
									<option value="">项目类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									立项时间&le;<input type="text" name="date6" title="立项时间"
										class="form-control1 input-lg" id="date6" style="width: 7em;">
									&ge;<input type="text" name="Cdate6" title="立项时间"
										class="form-control1 input-lg" id="Cdate6" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 15em;">
								<div class="form-group mb-n">
									立项金额 &le;<input type="text" name="bigMoney" title="立项金额"
										class="form-control1 input-lg" id="bigMoney"
										style="width: 5em;">&ge;<input type="text"
										name="smlMoney" title="立项金额" class="form-control1 input-lg"
										id="smlMoney" style="width: 5em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date7" title="文件上传时间"
										class="form-control1 input-lg" id="date7" style="width: 7em;">
									&ge;<input type="text" name="Cdate7" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate7" style="width: 7em;">
								</div>
							</div>
						</div>
						<!--教材 -->
						<div id="Book" style="display:none">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="BoCate" name="BoCate">
									<option value="">项目类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									出版时间&le;<input type="text" name="date8" title="出版时间"
										class="form-control1 input-lg" id="date8" style="width: 7em;">
									&ge;<input type="text" name="Cdate8" title="出版时间"
										class="form-control1 input-lg" id="Cdate8" style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 13em;">
								<div class="form-group mb-n">
									字数&le;<input type="text" class="form-control1 input-lg"
										style="width: 4em;" name="bigFont" id="bigFont">&ge;<input
										type="text" class="form-control1 input-lg" style="width: 4em;"
										name="smlFont" id="smlFont">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date9" title="文件上传时间"
										class="form-control1 input-lg" id="date9" style="width: 7em;">
									&ge;<input type="text" name="Cdate9" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate9" style="width: 7em;">
								</div>
							</div>
						</div>
						<!--竞赛 -->
						<div id="Race" style="display:none">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="RaCate" name="RaCate">
									<option value="">项目类别</option>
									<option value="类别1">类别1</option>
									<option value="类别2">类别2</option>
								</select>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="RaTuan" name="RaTuan">
									<option value="">团体/个人</option>
									<option value="0">团体</option>
									<option value="1">个人</option>
									<option value="2">其他</option>
								</select>
							</div>
							<div class="col-sm-2" style="width: 19em;">
								<div class="form-group mb-n">
									获奖时间&le;<input type="text" name="date10" title="获奖时间"
										class="form-control1 input-lg" id="date10" style="width: 7em;">
									&ge;<input type="text" name="Cdate10" title="获奖时间"
										class="form-control1 input-lg" id="Cdate10"
										style="width: 7em;">
								</div>
							</div>
							<div class="col-sm-2" style="width: 20em;">
								<div class="form-group mb-n">
									文件上传时间&le;<input type="text" name="date11" title="文件上传时间"
										class="form-control1 input-lg" id="date11" style="width: 7em;">
									&ge;<input type="text" name="Cdate11" title="文件上传时间"
										class="form-control1 input-lg" id="Cdate11"
										style="width: 7em;">
								</div>
							</div>
						</div>
					</div>
				</form>
				<form class="form-horizontal" name="Guina2" id="Guina2">
					<div class="form-group mb-n">
						<div class="col-sm-2" style="width: 12em;">
							<select class="form-control1" id="Type1" name="Type1"
								onchange="setUserType();">
								<option value="none">其他类别</option>
								<option value="user">用户属性类别</option>
							</select>
						</div>
						<div id="userType" style="display:none">
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="xuyuan" name="xuyuan">
									<option value="">学院</option>
									<option value="电气与信息工程学院">电气与信息工程学院</option>
									<option value="化工科学与工程学院">化工科学与工程学院</option>
									<option value="材料科学与工程学院">材料科学与工程学院</option>
									<option value="环境科学与工程学院">环境科学与工程学院</option>
									<option value="食品与生物工程学院">食品与生物工程学院</option>
									<option value="机电工程学院">机电工程学院</option>
									<option value="经济与管理学院">经济与管理学院</option>
									<option value="化学与化工学院">化学与化工学院</option>
									<option value="设计与艺术学院">设计与艺术学院</option>
									<option value="文理学院">文理学院</option>
									<option value="职业技术学院">职业技术学院</option>
								</select>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="sex" name="sex">
									<option value="">性别</option>
									<option value="1">男</option>
									<option value="0">女</option>
								</select>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="duty" name="duty">
									<option value="">职称</option>
									<option value="初级">初级</option>
									<option value="中级">中级</option>
									<option value="副高级">副高级</option>
									<option value="正高级">正高级</option>
								</select>
							</div>
							<div class="col-sm-1" style="width: 10em;">
								<div class="form-group mb-n">
									age &le;<input type="text" class="form-control1 input-lg"
										style="width: 3.5em;" name="bigAge" id="bigAge">&ge;<input
										type="text" class="form-control1 input-lg"
										style="width: 3.5em;" name="smlAge" id="smlAge">
								</div>
							</div>
							<div class="col-sm-1" style="width: 12em;">
								<select class="form-control1" id="major" name="major">
									<option value="">专业</option>
									<option value="计算机科学与技术">计算机科学与技术</option>
								</select>
							</div>
						</div>

						<div style="float: right;margin-right: 1em;padding-top: 0.5em;">
							<button type="button" class="btn btn-danger"
								onclick="getGuiNaInfo();">展示归纳信息</button>
							<button type="reset" class="btn btn-info" onclick="reSetAll();">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="panel-info" style="margin-top: 1.5em;">
			<div class="panel-heading success">归纳信息</div>
			<!-- 论文 -->
			<c:if test="${flog == 'thesis'}">
				<script type="text/javascript">
					isGui = 1;
				</script>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr>
							<th style="text-align: center;vertical-align: middle; width: 4%;"><input
								type="checkbox" name="thId"></th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">论文名称</th>
							<th style="text-align: center;vertical-align: middle; width: 6%;">论文类别</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">论文作者</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">发表时间</th>
							<th style="text-align: center;vertical-align: middle; width: 6%;">论文级别</th>
							<th style="text-align: center;vertical-align: middle; width: 6%;">影响因子</th>
							<th style="text-align: center;vertical-align: middle; width: 4%;">收录</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">收录编号</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">发表期刊</th>
							<th style="text-align: center;vertical-align: middle; width: 6%;">起止页码</th>
							<th
								style="text-align: center;vertical-align: middle; width: 17%;">论文简介</th>
							<th style="text-align: center;vertical-align: middle; width: 7%;">上传时间</th>
							<th style="text-align: center;vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.ThesisList}" var="thList">
							<tr>
								<td
									style="text-align: center;vertical-align: middle; width: 4%;"><input
									type="checkbox" value="${thList.thId}" name="thId"></td>
								<td
									style="text-align: center;vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thName}">${thList.thName}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 6%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thCategory}">${thList.thCategory}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thAuthor}">${thList.thAuthor}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thDate}">${thList.thDate}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 6%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thLevel}">${thList.thLevel}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 6%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thFactor}">${thList.thFactor}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 4%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thIncluded}">${thList.thIncluded}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thNumber}">${thList.thNumber}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thJournal}">${thList.thJournal}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 6%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thPage}">${thList.thPage}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 17%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thAbout}">${thList.thAbout}</td>
								<td
									style="text-align: center;vertical-align: middle; width: 7%;"
									data-toggle="tooltip" data-placement="top"
									title="${thList.thUptime}">${thList.thUptime}</td>
								<th align="center"
									style="width: 8%;text-align: center;vertical-align: middle;">
									<div style="width: 100%;height: 2em;">
										<li style="float: left; width: 0.7em;margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpThInfo(${thList.thId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em;margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=thesis&id=${thList.thId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em;padding-left: 0.2em; "></i>
										</a></li>
										<li style="float: left; width: 0.7em;margin-left: 0.9em;"><a
											href="javascript:void(0);"
											onclick="delThInfo(${thList.thId});" title="删除信息"> <i
												class="fa fa-trash-o mail-icon"
												style="width: 1em;padding-left: 0.2em; "></i>
										</a></li>
										<li
											style="float: left; width: 0.7em;margin-left: 0.8em;margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setNum(${thList.thId});"
											data-toggle="modal" data-target="#myLookModal" title="查看信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em;padding-left: 0.1em; "></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 专利 -->
			<c:if test="${flog == 'patent'}">
				<script type="text/javascript">
					isGui = 1;
				</script>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr>
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="paId" id="paId"></th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">专利名称</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">专利作者</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">专利类别</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">申请时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">授权时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">专利号</th>
							<th
								style="text-align: center; vertical-align: middle; width: 25%;">专利简介</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">文件上传时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.PatentList}" var="paList">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${paList.paId}" name="paId"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paName}">${paList.paName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paAuthor}">${paList.paAuthor}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paCategory}">${paList.paCategory}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paPlease}">${paList.paPlease}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paDate}">${paList.paDate}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paNumber}">${paList.paNumber}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 25%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paAbout}">${paList.paAbout}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${paList.paUptime}">${paList.paUptime}</td>
								<th align="center"
									style="width: 8%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpInfo(${paList.paId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=patent&id=${paList.paId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);" onclick="delInfo(${paList.paId});"
											title="删除信息"> <i class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setInfo(${paList.paId});"
											data-toggle="modal" data-target="#myLookModal" title="查看信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em; padding-left: 0.1em;"></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 获奖 -->
			<c:if test="${flog == 'praise'}">
				<script type="text/javascript">
					isGui = 1;
				</script>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr>
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="prId"></th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">获奖名称</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">获奖者</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">获奖类别</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">获奖日期</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">颁发单位</th>
							<th
								style="text-align: center; vertical-align: middle; width: 25%;">获奖简介</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">文件上传时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.PraiseList}" var="prList">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${prList.prId}" name="prId"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prName}">${prList.prName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prAuthor}">${prList.prAuthor}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prCategory}">${prList.prCategory}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prDate}">${prList.prDate}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prUnit}">${prList.prUnit}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 25%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prAbout}">${prList.prAbout}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${prList.prUptime}">${prList.prUptime}</td>
								<th align="center"
									style="width: 10%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpInfo(${prList.prId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=praise&id=${prList.prId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);" onclick="delInfo(${prList.prId});"
											title="删除信息"> <i class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setInfo(${prList.prId});"
											data-toggle="modal" data-target="#myLookModal" title="查看信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em; padding-left: 0.1em;"></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 项目 -->
			<c:if test="${flog == 'project'}">
				<script type="text/javascript">
					isGui = 1;
				</script>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr>
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="proId"></th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">项目名称</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">项目类别</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">立项时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">项目金额</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">项目负责人</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">团队成员</th>
							<th
								style="text-align: center; vertical-align: middle; width: 21%;">获奖简介</th>
							<th
								style="text-align: center; vertical-align: middle; width: 10%;">文件上传时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.ProjectList}" var="proList">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${proList.proId}" name="proId"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proName}">${proList.proName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proCategory}">${proList.proCategory}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proDate}">${proList.proDate}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proCash}">${proList.proCash}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proLeader}">${proList.proLeader}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proTeam}">${proList.proTeam}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 21%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proAbout}">${proList.proAbout}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 10%;"
									data-toggle="tooltip" data-placement="top"
									title="${proList.proUptime}">${proList.proUptime}</td>
								<th align="center"
									style="width: 8%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpInfo(${proList.proId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=project&id=${proList.proId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);"
											onclick="delInfo(${proList.proId});" title="删除信息"> <i
												class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setInfo(${proList.proId});"
											data-toggle="modal" data-target="#myLookModal" title="查看信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em; padding-left: 0.1em;"></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 教材 -->
			<c:if test="${flog == 'book'}">
				<script type="text/javascript">
					isGui = 1;
				</script>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr>
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="boId"></th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">教材名称</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">教材类别</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">出版日期</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">教材主编</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">教材参编</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">教材字数</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">教材出版社</th>
							<th
								style="text-align: center; vertical-align: middle; width: 21%;">获奖简介</th>
							<th
								style="text-align: center; vertical-align: middle; width: 9%;">文件上传时间</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.BookList}" var="boList">
							<tr id="${boList.boId}" onclick="chanceThis(${boList.boId});">
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${boList.boId}" id="${boList.boId}"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boName}">${boList.boName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boCategory}">${boList.boCategory}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boDate}">${boList.boDate}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boEditor}">${boList.boEditor}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boEditor2}">${boList.boEditor2}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boFont}">${boList.boFont}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boPublish}">${boList.boPublish}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 21%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boAbout}">${boList.boAbout}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 9%;"
									data-toggle="tooltip" data-placement="top"
									title="${boList.boUptime}">${boList.boUptime}</td>
								<th align="center"
									style="width: 8%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpInfo(${boList.boId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=book&id=${boList.boId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);" onclick="delInfo(${boList.boId});"
											title="删除信息"> <i class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setInfo(${boList.boId});"
											data-toggle="modal" data-target="#myLookModal" title="查看信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em; padding-left: 0.1em;"></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 竞赛 -->
			<c:if test="${flog == 'race'}">
				<script type="text/javascript">
					isGui = 1;
				</script>
				<table class="table table-bordered"
					style="table-layout: fixed; width: 100%;">
					<thead>
						<tr>
							<th
								style="text-align: center; vertical-align: middle; width: 5%;"><input
								type="checkbox" name="raId"></th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">竞赛名称</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">获奖人</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">竞赛类别</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">个人/团体</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">获奖等级</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">指导老师</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">获奖日期</th>
							<th
								style="text-align: center; vertical-align: middle; width: 23%;">竞赛简介</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">上传日期</th>
							<th
								style="text-align: center; vertical-align: middle; width: 8%;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.RaceList}" var="RaceList">
							<tr>
								<td
									style="text-align: center; vertical-align: middle; width: 5%;"><input
									type="checkbox" value="${RaceList.raId}" name="raId"></td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raName}">${RaceList.raName}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raAuthor}">${RaceList.raAuthor}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raCategory}">${RaceList.raCategory}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raType}">${RaceList.raType}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raLevel}">${RaceList.raLevel}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raTeacher}">${RaceList.raTeacher}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raDate}">${RaceList.raDate}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 23%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raAbout}">${RaceList.raAbout}</td>
								<td
									style="text-align: center; vertical-align: middle; width: 8%;"
									data-toggle="tooltip" data-placement="top"
									title="${RaceList.raUptime}">${RaceList.raUptime}</td>
								<th align="center"
									style="width: 8%; text-align: center; vertical-align: middle;">
									<div style="width: 100%; height: 2em;">
										<li style="float: left; width: 0.7em; margin-left: 0.85em;"><a
											href="javascript:void(0);"
											onclick="showUpInfo(${RaceList.raId});" title="修改信息"> <i
												class="fa fa-cogs nav_icon" style="width: 0.15em"></i>
										</a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="${pageContext.request.contextPath}/download/downloadTypeFile?type=race&id=${RaceList.raId}"
											title="下载文件"> <i class="fa fa-download mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i></a></li>
										<li style="float: left; width: 0.7em; margin-left: 0.9em;"><a
											href="javascript:void(0);"
											onclick="delInfo(${RaceList.raId});" title="删除信息"> <i
												class="fa fa-trash-o mail-icon"
												style="width: 1em; padding-left: 0.2em;"></i>
										</a></li>
										<li
											style="float: left; width: 0.7em; margin-left: 0.8em; margin-right: 0.4em;"><a
											href="#myLookModal" onclick="setInfo(${RaceList.raId});"
											data-toggle="modal" data-target="#myLookModal" title="查看信息">
												<i class="fa fa-book nav_icon"
												style="width: 0.15em; padding-left: 0.1em;"></i>
										</a></li>
									</div>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="flog == 'none'">
			            <p><span> 没有符合此条件的归纳信息！</span></p>
		         </c:if>
			<script>
				$(function() {
					$('[data-toggle="tooltip"]').tooltip({
						container : 'body'
					});
				})
			</script>
			<p>
			<div style="float: left;">
				显示第${page.startRow}至${page.endRow}项/第${page.nowPage}页，共
				${page.totalCount}项/${page.totalPage}页， 每页显示 <select id="pageSize"
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
					href="${pageContext.request.contextPath}/CountData/getPage?page=${page.firstPage}&pageSize=${ps}&flog=${flog}">第一页</a>
				<a
					href="${pageContext.request.contextPath}/CountData/getPage?page=${page.nextPage}&pageSize=${ps}&flog=${flog}">下一页</a>
				<a
					href="${pageContext.request.contextPath}/CountData/getPage?page=${page.prePage}&pageSize=${ps}&flog=${flog}">上一页</a>
				<a
					href="${pageContext.request.contextPath}/CountData/getPage?page=${page.lastPage}&pageSize=${ps}&flog=${flog}">最后页</a>
			</div>
			</p>
		</div>
	</div>
</body>
<script type="text/javascript">
	var thesis = {};
	var patent = {};
	var praise = {};
	var project = {};
	var book = {};
	var race = {};
	var userType = {};
	var flg = "none";
	var flog = 0;
	function setUserType() {
		if ($("#Type1").val() == "user") {
			flog = 1;
			$("#userType").show();
		} else {
			flog = 0;
			$("#userType").hide();
			$("#Guina2")[0].reset();
		}
	}
	function reSetAll() {
		$("#Guina1")[0].reset();
	}
	function setGuiNaType() {
		var ty = $("#Type").val()
		if (ty == "thesis") {
			flg = "thesis";
			$("#Thesis").show();
			$("#Patent").hide();
			$("#Praise").hide();
			$("#Project").hide();
			$("#Book").hide();
			$("#Race").hide();
		} else if (ty == "patent") {
			flg = "patent";
			$("#Thesis").hide();
			$("#Patent").show();
			$("#Praise").hide();
			$("#Project").hide();
			$("#Book").hide();
			$("#Race").hide();
		} else if (ty == "praise") {
			flg = "praise";
			$("#Thesis").hide();
			$("#Patent").hide();
			$("#Praise").show();
			$("#Project").hide();
			$("#Book").hide();
			$("#Race").hide();
		} else if (ty == "project") {
			flg = "project";
			$("#Thesis").hide();
			$("#Patent").hide();
			$("#Praise").hide();
			$("#Project").show();
			$("#Book").hide();
			$("#Race").hide();
		} else if (ty == "book") {
			flg = "book";
			$("#Thesis").hide();
			$("#Patent").hide();
			$("#Praise").hide();
			$("#Project").hide();
			$("#Book").show();
			$("#Race").hide();
		} else if (ty == "race") {
			flg = "race";
			$("#Thesis").hide();
			$("#Patent").hide();
			$("#Praise").hide();
			$("#Project").hide();
			$("#Book").hide();
			$("#Race").show();
		} else {
			alert("请选择所要归纳信息的条件!");
		}
	}
	function getGuiNaInfo() {
		if (flg == "thesis") {
			thesis = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()+ "&bigThda=" + $("#date").val() + "&smlThda=" + $("#Cdate").val() + "&thCate=" + $("#thCate").val() + "&thle=" + $("#thle").val() + "&thIsCl=" + $("#thIsCl").val() + "&bigThUp=" + $("#date1").val() + "&smlThUp=" + $("#Cdate1").val();
			//alert(thesis);
			getGuiNaInfoByAjax("GuiNaThesis", thesis);
		} else if (flg == "patent") {
			patent = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()+"&PaCate"+$("#PaCate").val()+"&bigPada"+$("#date2").val()+"&smlPada"+$("#Cdate2").val()+"&bigPaUp"+$("#date3").val()+"&smlPaUp"+ $("#Cdate3").val();
			alert(patent);
			getGuiNaInfoByAjax("GuiNaPatent", patent);
		} else if (flg == "praise") {
			praise = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()+"&PrCate"+$("#PrCate").val()+"&bigPrda"+$("#date4").val()+"&smlPrda"+$("#Cdate4").val()+"&bigPrUp"+$("#date5").val()+"&smlPrUp"+$("#Cdate5").val();
			alert(praise);
			getGuiNaInfoByAjax("GuiNaPraise", praise);
		} else if (flg == "project") {
			project = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()+"&ProCate"+$("#ProCate").val()+"&bigProda"+$("#date6").val()+"&smlProda"+$("#Cdate6").val()+"&bigMoney"+$("#bigMoney").val()+"&smlMoney"+$("#smlMoney").val()+"&bigProUp"+$("#date7").val()+"&smlProUp"+$("#Cdate7").val();
			alert(project);
			getGuiNaInfoByAjax("GuiNaProject", project);
		} else if (flg == "book") {
			book =  "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()+"&BoCate"+$("#BoCate").val()+"&bigBoda"+$("#date8").val()+"&smlBoda"+$("#Cdate8").val()+"&bigFont"+$("#bigFont").val()+"&smlFont"+$("#smlFont").val()+"&bigBoUp"+$("#date5").val()+"&smlBoUp"+$("#Cdate5").val();
			alert(book);
			getGuiNaInfoByAjax("GuiNaBook", book);
		} else if (flg == "race") {
			race =  "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()+"&RaCate"+$("#RaCate").val()+"&RaTuan"+$("#RaTuan").val()+"&bigRada"+$("#date10").val()+"&smlRada"+$("#Cdate10").val()+"&bigRaUp"+$("#date11").val()+"&smlRaUp"+$("#Cdate11").val();
			alert(race);
			getGuiNaInfoByAjax("GuiNaRace", race);
		} else {
			alert("请选择所要归纳信息的条件!");
		}
	}
	function getGuiNaInfoByAjax(url, too) {
		window.location.href = "${pageContext.request.contextPath}/CountData/" + url + "?" + too;
	}
	function rePages() {
		var page = $("#pageSize").val();
		window.location.href = "${pageContext.request.contextPath}/CountData/getPage?pageSize=" + page +"&flog=${flog}";
		window.parent.scrollTo(0, 0);
	}
	function isGuiNa(){
		 if(isGui== 1){
		   if(confirm("确定提交此操作？")){
		      return true;
		   }else{
		 	  return false;
		   }
		 }else{
		   alert("请先获取归纳信息！");
		   return false;
		 }
	}
</script>
</html>