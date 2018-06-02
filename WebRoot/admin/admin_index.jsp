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

<title>SUST科研归档管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!-- 
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic" rel='stylesheet' type='text/css'>
 -->
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>

<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">

</head>
<body class="cbp-spmenu-push">

	<div class="main-content" style="overflow-y: hidden;">
		<div class=" sidebar" role="navigation">
			<div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left"
					id="cbp-spmenu-s1">
				<ul class="nav" id="side-menu">
					<li><a href="admin/ad_data.jsp" onclick="aa();"
						target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>数据文件<span class="nav-badge"
							id="al">${da.string9}</span> <span class="fa arrow"></span></a></li>
					<li><a href="${pageContext.request.contextPath}/CountData/toStatisticInit" class="chart-nav" target="iFrame"><i
							class="fa fa-book nav_icon"></i>信息统计<span class="nav-badge">6</span>
							<span class="fa arrow"></span></a>
						<!-- <ul class="nav nav-second-level collapse">
							<li><a
								href="${pageContext.request.contextPath}/CountData/toStatisticInit"
								target="iFrame">所有信息总和</a></li>
							<li><a href="admin/st_info.jsp#thesis" target="iFrame">论文信息统计</a></li>
							<li><a href="admin/st_info.jsp#patent" target="iFrame">专利信息统计</a></li>
							<li><a href="admin/st_info.jsp#praise" target="iFrame">获奖信息统计</a></li>
							<li><a href="admin/st_info.jsp#project" target="iFrame">项目信息统计</a></li>
							<li><a href="admin/st_info.jsp#book" target="iFrame">教材信息统计</a></li>
							<li><a href="admin/st_info.jsp#race" target="iFrame">竞赛信息统计</a></li> 
						</ul>-->
						</li>
					<li><a
						href="${pageContext.request.contextPath}/thesis/getAllThInfo"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>论文信息<span class="nav-badge"
							id="th">${da.string1}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/patent/getAllPaInfo"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>专利信息<span class="nav-badge"
							id="pa">${da.string2}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/praise/getAllPraiseInfo"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>获奖信息<span class="nav-badge"
							id="pr">${da.string3}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/project/getAllProList"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>项目信息<span class="nav-badge"
							id="pro">${da.string4}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/book/getAllBoList"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>教材信息<span class="nav-badge"
							id="bo">${da.string5}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/race/getAllRaceInfo"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>竞赛信息<span class="nav-badge"
							id="ra">${da.string6}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/CountData/getCountDataInit"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>信息归纳<span class="nav-badge">1</span>
							<span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/users/getAllUsersInfo"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>用户管理<span class="nav-badge"
							id="us">${da.string8}</span> <span class="fa arrow"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath}/news/getAdminNews"
						onclick="aa();" target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>消息公告<span class="nav-badge"
							id="me">${da.string7}</span> <span class="fa arrow"></span></a></li>
					<li><a href="admin/ad_other.jsp" onclick="aa();"
						target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>其他<span
							class="nav-badge-btm pull-right">other</span></a></li>

				</ul>
				</nav>
			</div>
		</div>

		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush">
					<i class="fa fa-bars"></i>
				</button>
				<!--toggle button end-->
				<!--logo -->
				<div class="logo">
					<a href="${pageContext.request.contextPath}/login/toAdmin">
						<h1>SUST</h1> <span>科研管理归档</span>
					</a>
				</div>
				<!--//logo-->
				<!--search-box-->
				<div class="search-box">
					<form class="input">
						<input class="sb-search-input input__field--madoka"
							placeholder="Search..." type="search" id="input-31" /> <label
							class="input__label" for="input-31"> <svg class="graphic"
								width="100%" height="100%" viewBox="0 0 404 77"
								preserveAspectRatio="none"> <path
								d="m0,0l404,0l0,77l-404,0l0,-77z" /> </svg>
						</label>
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="header-right">
				<div class="profile_details_left">
					<ul class="nofitications-dropdown">
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-envelope"></i><span
								class="badge">3</span></a>
							<!-- <ul class="dropdown-menu" style="width: 10em;">
								<li>
									<div class="notification_header">
										<h3>You have 3 news</h3>
									</div>
								</li>
								<li><a href="#">
										<div class="user_img">
											<img src="img/1.png" alt="">
										</div>
										<div class="notification_desc">
											<p>AAAAAA</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li class="odd"><a href="#">
										<div class="user_img">
											<img src="img/2.png" alt="">
										</div>
										<div class="notification_desc">
											<p>BBBBBB</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li><a href="#">
										<div class="user_img">
											<img src="img/3.png" alt="">
										</div>
										<div class="notification_desc">
											<p>CCCCCC</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li>
									<div class="notification_bottom">
										<a href="#">See all messages</a>
									</div>
								</li>
							</ul> --></li>
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-bell"></i><span
								class="badge blue">3</span></a>
							<!-- <ul class="dropdown-menu" style="width: 10em;">
								<li>
									<div class="notification_header">
										<h3>You have 3 new notification</h3>
									</div>
								</li>
								<li><a href="#">
										<div class="user_img">
											<img src="img/1.png" alt="">
										</div>
										<div class="notification_desc">
											<p>AAAAAA</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li class="odd"><a href="#">
										<div class="user_img">
											<img src="img/2.png" alt="">
										</div>
										<div class="notification_desc">
											<p>BBBBBB</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li><a href="#">
										<div class="user_img">
											<img src="img/3.png" alt="">
										</div>
										<div class="notification_desc">
											<p>CCCCCC</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li>
									<div class="notification_bottom">
										<a href="#">See all messages</a>
									</div>
								</li>
							</ul> --></li>
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-tasks"></i><span
								class="badge blue1">15</span></a>
							<!-- <ul class="dropdown-menu" style="width: 15em;">
								<li>
									<div class="notification_header">
										<h3>You have 8 pending task</h3>
									</div>
								</li>
								<li><a href="#">
										<div class="task-info">
											<span class="task-desc">Database update</span><span
												class="percentage">40%</span>
											<div class="clearfix"></div>
										</div>
										<div class="progress progress-striped active">
											<div class="bar yellow" style="width: 40%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<span class="task-desc">Dashboard done</span><span
												class="percentage">90%</span>
											<div class="clearfix"></div>
										</div>
										<div class="progress progress-striped active">
											<div class="bar green" style="width: 90%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<span class="task-desc">Mobile App</span><span
												class="percentage">33%</span>
											<div class="clearfix"></div>
										</div>
										<div class="progress progress-striped active">
											<div class="bar red" style="width: 33%;"></div>
										</div>
								</a></li>
								<li><a href="#">
										<div class="task-info">
											<span class="task-desc">Issues fixed</span><span
												class="percentage">80%</span>
											<div class="clearfix"></div>
										</div>
										<div class="progress progress-striped active">
											<div class="bar  blue" style="width: 80%;"></div>
										</div>
								</a></li>
								<li>
									<div class="notification_bottom">
										<a href="#">See all pending tasks</a>
									</div>
								</li>
							</ul> --></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				
				<div class="profile_details">
					<ul>
						<li class="dropdown profile_details_drop"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false">
								<div class="profile_img">
									<span class="prfil-img"><img src="img/a.png" alt="">
									</span>
									<div class="user-name">
										<p><%=login.getLoLogin()%></p>
										<span><%=login.getLoType()%></span>
									</div>
									<i class="fa fa-angle-down lnr"></i> <i
										class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>
								</div>
						</a>
							<ul class="dropdown-menu drp-mnu">
								<li><a
									href="${pageContext.request.contextPath}/users/UserInfo?type=info"
									target="iFrame"><i class="fa fa-user"></i>用户信息</a></li>
								<li><a
									href="${pageContext.request.contextPath}/users/UserInfo?type=pass"
									target="iFrame"><i class="fa fa-cog"></i>修改密码</a></li>
								<li><a
									href="${pageContext.request.contextPath}/login/toUser"><i
										class="fa fa-sign-out"></i>用户界面</a></li>
								<li><a
									href="${pageContext.request.contextPath}/login/Layout"><i
										class="fa fa-sign-out"></i>退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>

		<div id="page-wrapper">
			<iframe id="iFrame" name="iFrame" width="100%"
				onload="this.height=iFrame.document.body.scrollHeight"
				frameborder="0" scrolling="no"
				src="${pageContext.request.contextPath}/CountData/getAdminMenuInit"></iframe>
		</div>

		<div class="footer">
			<p>
				&copy; 2016 Novus Admin Panel. All Rights Reserved | Design by <a
					href="#" target="_blank">whatzhangy</a>
			</p>
		</div>

	</div>

	<script src="js/classie.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		var menuLeft = document.getElementById('cbp-spmenu-s1'),
			showLeftPush = document
				.getElementById('showLeftPush'),
			body = document.body;
	
		showLeftPush.onclick = function() {
			classie.toggle(this, 'active');
			classie.toggle(body, 'cbp-spmenu-push-toright');
			classie.toggle(menuLeft, 'cbp-spmenu-open');
			disableOther('showLeftPush');
		};
	
		function disableOther(button) {
			if (button !== 'showLeftPush') {
				classie.toggle(showLeftPush, 'disabled');
			}
		}
		function aa() {
			window.parent.scrollTo(0, 0);
			return true;
		}
		function getNumInfo() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/login/toAdmin",
				data : {
				},
				dataType : 'json',
				cache : false,
				async : true,
				success : showData,
				error : function(data) {
					alert("getAdminData error!");
				}
			});
		}
		function showData(data) {
			alert(data.string1);
			$("th").value(data.string1);
			$("pa").text(data.string2);
			$("pr").html(data.string3);
			$("pro").text(data.string4);
			$("bo").text(data.string5);
			$("ra").text(data.string6);
			$("me").text(data.string7);
			$("us").text(data.string8);
			$("al").text(data.string9);
		}
	</script>
</body>
</html>