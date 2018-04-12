<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>SUST科研归档管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="application/x-javascript">
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 0);
	}

</script>
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
<!--webfonts-->
<link
	href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<!--//webfonts-->
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

<script src="js/myjs.js"></script>


</head>
<body class="cbp-spmenu-push" onload="scroll(0, 0)">

	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class=" sidebar" role="navigation">
			<div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left"
					id="cbp-spmenu-s1">
				<ul class="nav" id="side-menu">
					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>论文信息<span class="nav-badge">3</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/ad_thesis.jsp#th_show" target="iFrame">论文信息列表<span
									class="nav-badge-btm">08</span></a></li>
							<li><a href="admin/ad_thesis.jsp" onclick="aa();"
								target="iFrame">论文信息查询</a></li>
							<li><a href="admin/ad_thesis.jsp#th_add" target="iFrame">论文添加修改</a></li>
						</ul></li>

					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>专利信息<span class="nav-badge">3</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/ad_patent.jsp#pa_show" target="iFrame">专利信息列表<span
									class="nav-badge-btm">08</span></a></li>
							<li><a href="admin/ad_patent.jsp" onclick="aa();"
								target="iFrame">专利信息查询</a></li>
							<li><a href="admin/ad_patent.jsp#pa_add" target="iFrame">专利添加修改</a></li>
						</ul></li>
					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>获奖信息<span class="nav-badge">3</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/ad_praise.jsp#pr_show" target="iFrame">获奖信息列表<span
									class="nav-badge-btm">08</span></a></li>
							<li><a href="admin/ad_praise.jsp" onclick="aa();"
								target="iFrame">获奖信息查询</a></li>
							<li><a href="admin/ad_praise.jsp#pr_add" target="iFrame">获奖添加修改</a></li>
						</ul></li>
					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>项目信息<span class="nav-badge">3</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/ad_project.jsp#pro_show" target="iFrame">项目信息列表<span
									class="nav-badge-btm">08</span></a></li>
							<li><a href="admin/ad_project.jsp" onclick="aa();"
								target="iFrame">项目信息查询</a></li>
							<li><a href="admin/ad_project.jsp#pro_add" target="iFrame">项目添加修改</a></li>
						</ul></li>
					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>教材信息<span class="nav-badge">3</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/ad_book.jsp#bo_show" target="iFrame">教材信息列表<span
									class="nav-badge-btm">05</span></a></li>
							<li><a href="admin/ad_book.jsp" onclick="aa();"
								target="iFrame">教材信息查询</a></li>
							<li><a href="admin/ad_book.jsp#bo_add" target="iFrame">教材添加修改</a></li>
						</ul></li>
					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>竞赛信息<span class="nav-badge">3</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/ad_race.jsp#ra_show" target="iFrame">竞赛信息列表<span
									class="nav-badge-btm">05</span></a></li>
							<li><a href="admin/ad_race.jsp" onclick="aa();"
								target="iFrame">竞赛信息查询</a></li>
							<li><a href="admin/ad_race.jsp#ra_add" target="iFrame">竞赛添加修改</a></li>
						</ul></li>
					<li><a href="admin/st_gui.jsp" onclick="aa();" target="iFrame"
						class="chart-nav"><i class="fa fa-book nav_icon"></i>信息归纳<span
							class="nav-badge">1</span> <span class="fa arrow"></span></a></li>
					<li><a href="#" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>信息统计<span class="nav-badge">6</span>
							<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="admin/st_all.jsp" target="iFrame">所有信息总和</a></li>
							<li><a href="admin/st_info.jsp#thesis" target="iFrame">论文信息统计</a></li>
							<li><a href="admin/st_info.jsp#patent" target="iFrame">专利信息统计</a></li>
							<li><a href="admin/st_info.jsp#praise" target="iFrame">获奖信息统计</a></li>
							<li><a href="admin/st_info.jsp#project" target="iFrame">项目信息统计</a></li>
							<li><a href="admin/st_info.jsp#book" target="iFrame">教材信息统计</a></li>
							<li><a href="admin/st_info.jsp#race" target="iFrame">竞赛信息统计</a></li>
						</ul></li>
					<li><a href="admin/ad_newsInfo.jsp" onclick="aa();"
						target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>信息公告<span class="nav-badge">1</span>
							<span class="fa arrow"></span></a></li>
					<li><a href="admin/ad_userInfo.jsp" onclick="aa();"
						target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>用户管理<span class="nav-badge">1</span>
							<span class="fa arrow"></span></a></li>
					<li><a href="admin/ad_data.jsp" onclick="aa();"
						target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>数据处理<span class="nav-badge">1</span>
							<span class="fa arrow"></span></a></li>
					<li><a href="admin/ad_other.jsp" onclick="aa();"
						target="iFrame" class="chart-nav"><i
							class="fa fa-book nav_icon"></i>其他<span
							class="nav-badge-btm pull-right">other</span></a></li>

				</ul>
				</nav>
			</div>
		</div>


		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush">
					<i class="fa fa-bars"></i>
				</button>
				<!--toggle button end-->
				<!--logo -->
				<div class="logo">
					<a href="admin/admin_index.jsp">
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
				<!--//end-search-box-->
				<div class="clearfix"></div>
			</div>
			<div class="header-right">
				<div class="profile_details_left">
					<!--notifications of menu start -->
					<ul class="nofitications-dropdown">
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-envelope"></i><span
								class="badge">3</span></a>
							<ul class="dropdown-menu" style="width: 10em;">
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
							</ul></li>
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-bell"></i><span
								class="badge blue">3</span></a>
							<ul class="dropdown-menu" style="width: 10em;">
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
							</ul></li>
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-tasks"></i><span
								class="badge blue1">15</span></a>
							<ul class="dropdown-menu" style="width: 15em;">
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
							</ul></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<!--notification menu end -->
				<div class="profile_details">
					<ul>
						<li class="dropdown profile_details_drop"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false">
								<div class="profile_img">
									<span class="prfil-img"><img src="img/a.png" alt="">
									</span>
									<div class="user-name">
										<p>MUREN</p>
										<span>Administrator</span>
									</div>
									<i class="fa fa-angle-down lnr"></i> <i
										class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>
								</div>
						</a>
							<ul class="dropdown-menu drp-mnu">
								<li><a href="#" data-toggle="modal" data-target="#myModal"><i
										class="fa fa-user"></i>用户信息</a></li>
								<li><a href="users/upPass.jsp" onclick="aa();"
									target="iFrame"><i class="fa fa-cog"></i>修改密码</a></li>
								<li><a href="login.jsp"><i class="fa fa-sign-out"></i>退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>





		<div id="page-wrapper">
			<iframe id="iFrame" name="iFrame" width="100%" frameborder="0"
				scrolling="no" src="admin/ad_thesis.jsp"></iframe>
		</div>






		<div class="footer">
			<p style="position: absolute; right: 25em;">
				&copy; 2016 Novus Admin Panel. All Rights Reserved | Design by <a
					href="#" target="_blank">wahtzhangy</a>
			</p>
		</div>



		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 25em;">
				<div class="modal-content" style="padding: 0em 0em 0em 2em;">
					<br> <br>
					<table class="table" style="text-align: left;">
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


	<!-- Classie -->
	<script src="js/classie.js"></script>
	<script type="text/javascript">
		var mainIframe = document.getElementById('iFrame'); //右下角的iframe的id改成你自己命名的
		mainIframe.onload = function() {
			this.height = iFrame.document.body.scrollHeight;
			this.contentDocument.documentElement.scrollTop = 0;
		}
		var menuLeft = document.getElementById('cbp-spmenu-s1'), showLeftPush = document
				.getElementById('showLeftPush'), body = document.body;

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
		};
		function aa() {
			this.scroll(0, 0);
		}
	</script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
</body>
</html>