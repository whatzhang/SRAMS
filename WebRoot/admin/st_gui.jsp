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
									<option value="自然类">自然类</option>
									<option value="人文类">人文类</option>
									<option value="社科类">社科类</option>
									<option value="其它">其他</option>
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
										<option value="发明类">发明类</option>
										<option value="实用新型">实用新型</option>
										<option value="外观设计">外观设计</option>
										<option value="国际专利">国际专利</option>
										<option value="其他">其他</option>
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
									<option value="特等奖">特等奖</option>
									<option value="一等奖">一等奖</option>
									<option value="二等奖">二等奖</option>
									<option value="三等奖">三等奖</option>
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
									<option value="基础理论研究">基础理论研究</option>
									<option value="应用性研究">应用性研究</option>
									<option value="其他">其他</option>
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
							    	<option value="文学艺术">文学艺术</option>
									<option value="自然科学">自然科学</option>
									<option value="医药卫生">医药卫生</option>
									<option value="工业技术">工业技术</option>
									<option value="哲学宗教">哲学宗教</option>
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
									<option value="">竞赛类别</option>
									<option value="学科竞赛">学科竞赛</option>
									<option value="科技竞赛">科技竞赛</option>
									<option value="其他">其他</option>
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
							<button type="reset" class="btn btn-info" onclick="reSetAll();">重置归纳条件</button>
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
							<tr onclick="chanceThis('thesis',${thList.thId});"
								data-toggle="modal" data-target="#myLookModal">
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
								<th
									style="width: 8%; text-align: center; vertical-align: middle; font-size: 1em;"><a href="javascript: void(0);"
									onclick="deleteInfo('thesis',${thList.thId})">删除</a></th>
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
							<tr onclick="chanceThis('patent',${paList.paId});"
								data-toggle="modal" data-target="#myLookModal1">
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
								<th
									style="width: 8%; text-align: center; vertical-align: middle; font-size: 0.8em;"><a href="javascript: void(0);"
									onclick="deleteInfo('patent',${paList.paId})">删除</a></th>
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
							<tr onclick="chanceThis('praise',${prList.prId});"
								data-toggle="modal" data-target="#myLookModal2">
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
								<th
									style="width: 8%; text-align: center; vertical-align: middle; font-size: 0.8em;"><a href="javascript: void(0);"
									onclick="deleteInfo('praise',${prList.prId})">删除</a></th>
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
							<tr onclick="chanceThis('project',${proList.proId});"
								data-toggle="modal" data-target="#myLookModal3">
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
								<th
									style="width: 8%; text-align: center; vertical-align: middle; font-size: 0.8em;"><a href="javascript: void(0);"
									onclick="deleteInfo('project',${proList.proId})">删除</a></th>
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
							<tr onclick="chanceThis('book',${boList.boId});"
								data-toggle="modal" data-target="#myLookModal4">
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
								<th
									style="width: 8%; text-align: center; vertical-align: middle; font-size: 0.8em;"><a href="javascript: void(0);"
									onclick="deleteInfo('book',${boList.boId})">删除</a></th>
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
							<tr onclick="chanceThis('race',${proList.proId});"
								data-toggle="modal" data-target="#myLookModal5">
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
								<th
									style="width: 8%; text-align: center; vertical-align: middle; font-size: 0.8em;"><a href="javascript: void(0);"
									onclick="deleteInfo('race',${RaceList.raId})">删除</a></th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="flog == 'none'">
				<p>
					<span> 没有符合此条件的归纳信息！</span>
				</p>
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
							<tr style="text-align: left;vertical-align: middle; ">
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
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="th_time" id="th_time" readonly="true"></td>
								<td></td>
								<td></td>

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
	<div class="modal fade" id="myLookModal1" tabindex="-1" role="dialog"
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
							<tr style="text-align: left; vertical-align: middle;">
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
								<td><label for="largeinput"
									class=" control-label label-input-lg">专利作者</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_au" id="ra_au" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_time" id="ra_time" readonly="true"></td>
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

	<div class="modal fade" id="myLookModal2" tabindex="-1" role="dialog"
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
							<tr style="text-align: left; vertical-align: middle;">
								<td><label for="largeinput"
									class="control-label label-input-lg">获奖名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="pr_na" id="pr_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">获奖类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="pr_ca" id="pr_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">颁发单位</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="pr_ty" id="pr_ty" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">获奖时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="pr_da" id="pr_da" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">获奖人</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="pr_au" id="pr_au" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="pr_time" id="pr_time" readonly="true"></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">获奖简介</label></td>
							</tr>
							<tr>
								<td colspan="4"><textarea class="form-control1 control2"
										name="pr_ab" id="pr_ab" style="font-size: 1em; height: 10em;"
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

	<div class="modal fade" id="myLookModal3" tabindex="-1" role="dialog"
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
							<tr style="text-align: left; vertical-align: middle;">
								<td><label for="largeinput"
									class="control-label label-input-lg">项目名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_na" id="bo_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">项目类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_ca" id="bo_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">立项时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_da" id="bo_da" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">立项金额</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e1" id="bo_e1" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">项目领导</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e2" id="bo_e2" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">团队成员</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_pa" id="bo_pa" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_time" id="bo_time" readonly="true"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">项目简介</label></td>
							</tr>
							<tr>
								<td colspan="4"><textarea class="form-control1 control2"
										name="bo_ab" id="bo_ab" style="font-size: 1em; height: 10em;"
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

	<div class="modal fade" id="myLookModal4" tabindex="-1" role="dialog"
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
							<tr style="text-align: left; vertical-align: middle;">
								<td><label for="largeinput"
									class="control-label label-input-lg">教材名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_na" id="bo_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">教材类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_ca" id="bo_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">出版日期</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_da" id="bo_da" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">教材主编</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e1" id="bo_e1" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">教材参编</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_e2" id="bo_e2" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">教材字数</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_pa" id="bo_pa" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">出版社</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="bo_pu" id="bo_pu" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="boUptime" title="文件上传时间" id="boUptime"
									placeholder="文件上传时间" readonly="true"></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">教材简介</label></td>
							</tr>
							<tr>
								<td colspan="4"><textarea class="form-control1 control2"
										name="bo_ab" id="bo_ab" style="font-size: 1em; height: 10em;"
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

	<div class="modal fade" id="myLookModal5" tabindex="-1" role="dialog"
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
							<tr style="text-align: left; vertical-align: middle;">
								<td><label for="largeinput"
									class="control-label label-input-lg">竞赛名称</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_na" id="ra_na" readonly="true"></td>
								<td><label for="largeinput"
									class="control-label label-input-lg">竞赛类别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_ca" id="ra_ca" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">个人/团体</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_ty" id="ra_ty" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">获奖时间</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_da" id="ra_da" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">竞赛级别</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_le" id="ra_le" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">指导老师</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_te" id="ra_te" readonly="true"></td>
							</tr>
							<tr>
								<td><label for="largeinput"
									class=" control-label label-input-lg">获奖人</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_au" id="ra_au" readonly="true"></td>
								<td><label for="largeinput"
									class=" control-label label-input-lg">文件上传日期</label></td>
								<td><input type="text" class="form-control1 input-lg"
									name="ra_time" id="ra_time" readonly="true"></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: left;"><label
									for="largeinput" class=" control-label label-input-lg">竞赛简介</label></td>
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
			thesis = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()
			+ "&bigThda=" + $("#date").val() + "&smlThda=" + $("#Cdate").val() + "&thCate=" + $("#thCate").val() + "&thle=" + $("#thle").val() + "&thIsCl=" + $("#thIsCl").val() + "&bigThUp=" + $("#date1").val() + "&smlThUp=" + $("#Cdate1").val();
			//alert(thesis);
			getGuiNaInfoByAjax("GuiNaThesis", thesis);
		} else if (flg == "patent") {
			patent = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()
			+ "&PaCate=" + $("#PaCate").val() + "&bigPada=" + $("#date2").val() + "&smlPada=" + $("#Cdate2").val() + "&bigPaUp=" + $("#date3").val() + "&smlPaUp=" + $("#Cdate3").val();
			alert(patent);
			getGuiNaInfoByAjax("GuiNaPatent", patent);
		} else if (flg == "praise") {
			praise = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()
			+ "&PrCate=" + $("#PrCate").val() + "&bigPrda=" + $("#date4").val() + "&smlPrda=" + $("#Cdate4").val() + "&bigPrUp=" + $("#date5").val() + "&smlPrUp=" + $("#Cdate5").val();
			alert(praise);
			getGuiNaInfoByAjax("GuiNaPraise", praise);
		} else if (flg == "project") {
			project = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()
			+ "&ProCate=" + $("#ProCate").val() + "&bigProda=" + $("#date6").val() + "&smlProda=" + $("#Cdate6").val() + "&bigMoney=" + $("#bigMoney").val() + "&smlMoney=" + $("#smlMoney").val() + "&bigProUp=" + $("#date7").val() + "&smlProUp=" + $("#Cdate7").val();
			alert(project);
			getGuiNaInfoByAjax("GuiNaProject", project);
		} else if (flg == "book") {
			book = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()
			+ "&BoCate=" + $("#BoCate").val() + "&bigBoda=" + $("#date8").val() + "&smlBoda=" + $("#Cdate8").val() + "&bigFont=" + $("#bigFont").val() + "&smlFont=" + $("#smlFont").val() + "&bigBoUp=" + $("#date5").val() + "&smlBoUp=" + $("#Cdate5").val();
			alert(book);
			getGuiNaInfoByAjax("GuiNaBook", book);
		} else if (flg == "race") {
			race = "flg=" + flog + "&xuyuan=" + $("#xuyuan").val() + "&sex=" + $("#sex").val() + "&duty=" + $("#duty").val() + "&bigAge=" + $("#bigAge").val() + "&smlAge=" + $("#smlAge").val() + "&major=" + $("#major").val()
			+ "&RaCate=" + $("#RaCate").val() + "&RaTuan=" + $("#RaTuan").val() + "&bigRada=" + $("#date10").val() + "&smlRada=" + $("#Cdate10").val() + "&bigRaUp=" + $("#date11").val() + "&smlRaUp=" + $("#Cdate11").val();
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
		window.location.href = "${pageContext.request.contextPath}/CountData/getPage?pageSize=" + page + "&flog=${flog}";
		window.parent.scrollTo(0, 0);
	}
	function isGuiNa() {
		if (isGui == 1) {
			if (confirm("确定提交此操作？")) {
				return true;
			} else {
				return false;
			}
		} else {
			alert("请先获取归纳信息！");
			return false;
		}
	}
	function deleteInfo(type, id) {
		var fg;
		if (confirm("确定要删除吗？") == true) {
			if (confirm("是否删除电子文件？")) {
				fg = "yes";
			} else {
				fg = 'no';
			}
			deleteIt(type, id, fg);
		} else {
			return false;
		}
	}
	function deleteIt(type, id, fg) {
		var url = "";
		if (type == "thesis") {
			url = "/thesis/DeleteThInfo";
		} else if (type == "patent") {
			url = "/patent/DeletePaInfo";
		} else if (type == "praise") {
			url = "/praise/DeletePrInfo";
		} else if (type == "project") {
			url = "/project/DeleteProInfo";
		} else if (type == "book") {
			url = "/book/DeleteBoInfo";
		} else if (type == "race") {
			url = "/race/DeleteRaInfo";
		} else {
			console.log("none");
		}
		var too = {
			"deId" : id,
			"fg" : fg
		};
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}" + url,
			data : too,
			dataType : 'json',
			cache : false,
			async : true,
			success : function(data) {
				alert(data.string1);
				location.reload();
			},
			error : function(data) {
				alert("删除信息出错!");
			}
		});
	}
	function chanceThis(type, id) {
		if (type == "thesis") {
			show(id);
		} else if (type == "patent") {
			show1(id);
		} else if (type == "praise") {
			show2(id);
		} else if (type == "project") {
			show3(id);
		} else if (type == "book") {
			show4(id);
		} else if (type == "race") {
			show5(id);
		} else {
			console.log("none");
		}
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
		$("#th_time").val(data.thUptime);
		$("#th_ab").val(data.thAbout);
		showUpInfo(data);
	}
	function show(id) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/thesis/getShowInfo",
			data : {
				thId : id
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
	function showModal1(data) {
		$("#ra_na").val(data.paName);
		$("#ra_ca").val(data.paCategory);
		$("#ra_ty").val(data.paPlease);
		$("#ra_da").val(data.paDate);
		$("#ra_le").val(data.paNumber);
		$("#ra_au").val(data.paAuthor);
		$("#ra_time").val(data.paUptime);
		$("#ra_ab").val(data.paAbout);
		showInfo(data);
	}
	function show1(Id) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/patent/getPaInfo",
			data : {
				Id : Id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : showModal1,
			error : function(data) {
				alert("updateThesis error!");
			}
		});
	}
	function showModal2(data) {
		$("#pr_na").val(data.prName);
		$("#pr_ca").val(data.prCategory);
		$("#pr_da").val(data.prDate);
		$("#pr_ty").val(data.prUnit);
		$("#pr_au").val(data.prAuthor);
		$("#pr_time").val(data.prUptime);
		$("#pr_ab").val(data.prAbout);
		showInfo(data);
	}
	function show2(Id) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/praise/getPrInfo",
			data : {
				prId : Id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : showModal2,
			error : function(data) {
				alert("get error!");
			}
		});
	}
	function showModal3(data) {
		$("#bo_na").val(data.proName);
		$("#bo_ca").val(data.proCategory);
		$("#bo_da").val(data.proDate);
		$("#bo_e1").val(data.proCash);
		$("#bo_e2").val(data.proLeader);
		$("#bo_pa").val(data.proTeam);
		$("#bo_time").val(data.proUptime);
		$("#bo_ab").val(data.proAbout);
		showInfo(data);
	}
	function show3(Id) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/project/getProInfo",
			data : {
				ProId : Id
			},
			dataType : 'json',
			cache : true,
			async : true,
			success : showModal3,
			error : function(data) {
				alert("get error!");
			}
		});
	}
	function showModal4(data) {
		$("#bo_na").val(data.boName);
		$("#bo_ca").val(data.boCategory);
		$("#bo_da").val(data.boDate);
		$("#bo_e1").val(data.boEditor);
		$("#bo_e2").val(data.boEditor2);
		$("#bo_pa").val(data.boFont);
		$("#bo_pu").val(data.boPublish);
		$("#boUptime").val(data.boUptime);
		$("#bo_ab").val(data.boAbout);
		showInfo(data);
	}
	function show4(Id) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/book/getBoInfo",
			data : {
				boId : Id
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : showModal4,
			error : function(data) {
				alert("get error!");
			}
		});
	}
	function showModal5(data) {
		$("#ra_na").val(data.raName);
		$("#ra_ca").val(data.raCategory);
		$("#ra_da").val(data.raDate);
		$("#ra_le").val(data.raLevel);
		$("#ra_ty").val(data.raType);
		$("#ra_te").val(data.raTeacher);
		$("#ra_ab").val(data.raAbout);
		$("#ra_au").val(data.raAuthor);
		$("#ra_time").val(data.raUptime);
		showInfo(data);
	}
	function show5(raId) {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/race/getRaInfo",
			data : {
				raId : raId
			},
			dataType : 'json',
			cache : false,
			async : true,
			success : showModal5,
			error : function(data) {
				alert("updateThesis error!");
			}
		});
	}
</script>
</html>