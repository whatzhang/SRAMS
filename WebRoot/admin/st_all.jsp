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

<script src="js/Chart.js"></script>

<style type="text/css">
</style>
</head>

<body>
	<div class="main-page">
		<div class="charts" style="padding-left: 1em;">

			<div class="col-md-4 charts-grids widget">
				<h4 class="title">Bar Chart Example</h4>
				<canvas id="bar" height="300" width="400"> </canvas>
			</div>
			<div class="col-md-4 charts-grids widget states-mdl">
				<h4 class="title">Line Chart Example</h4>
				<canvas id="line" height="300" width="400"> </canvas>
			</div>
			<div class="col-md-4 charts-grids widget">
				<h4 class="title">Pie Chart Example</h4>
				<canvas id="pie" height="300" width="400"> </canvas>
			</div>
			<div class="clearfix"></div>
			<script>
				var barChartData = {
					labels : [ "Jan", "Feb", "March", "April", "May", "June",
							"July" ],
					datasets : [ {
						fillColor : "rgba(233, 78, 2, 0.9)",
						strokeColor : "rgba(233, 78, 2, 0.9)",
						highlightFill : "#e94e02",
						highlightStroke : "#e94e02",
						data : [ 65, 59, 90, 81, 56, 55, 40 ]
					}, {
						fillColor : "rgba(79, 82, 186, 0.9)",
						strokeColor : "rgba(79, 82, 186, 0.9)",
						highlightFill : "#4F52BA",
						highlightStroke : "#4F52BA",
						data : [ 40, 70, 55, 20, 45, 70, 60 ]
					} ]

				};
				var lineChartData = {
					labels : [ "Jan", "Feb", "March", "April", "May", "June",
							"July" ],
					datasets : [ {
						fillColor : "rgba(242, 179, 63, 1)",
						strokeColor : "#F2B33F",
						pointColor : "rgba(242, 179, 63, 1)",
						pointStrokeColor : "#fff",
						data : [ 70, 60, 72, 61, 75, 59, 80 ]

					}, {
						fillColor : "rgba(97, 100, 193, 1)",
						strokeColor : "#6164C1",
						pointColor : "rgba(97, 100, 193,1)",
						pointStrokeColor : "#9358ac",
						data : [ 50, 65, 51, 67, 52, 64, 50 ]

					} ]

				};
				var pieData = [ {
					value : 90,
					color : "rgba(233, 78, 2, 1)",
					label : "Product 1"
				}, {
					value : 50,
					color : "rgba(242, 179, 63, 1)",
					label : "Product 2"
				}, {
					value : 60,
					color : "rgba(88, 88, 88,1)",
					label : "Product 3"
				}, {
					value : 40,
					color : "rgba(79, 82, 186, 1)",
					label : "Product 4"
				}

				];

				new Chart(document.getElementById("line").getContext("2d"))
						.Line(lineChartData);
				new Chart(document.getElementById("bar").getContext("2d"))
						.Bar(barChartData);
				new Chart(document.getElementById("pie").getContext("2d"))
						.Pie(pieData);
			</script>

		</div>

	</div>
</body>
</html>
