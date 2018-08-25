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

<link href="css/font-awesome.css" rel="stylesheet">

<script src="js/jquery-1.11.1.min.js"></script>

<script src="js/bootstrap.js"></script>
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
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
	<div class="main-page">
		<div class="charts" style="margin: 0em 1.5em 3em 1.5em;">
			<div class="col-md-3 cc">
				<span class="ee">概要统计信息</span>
				
			</div>
			<div class="col-md-9 dd"> <button type="button" class="btn btn-success col-sm-1"
								style="float: right;width: 8em;" onclick="javascript:window.print();">打印页面</button></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="bb"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="aa"></div>
			<div class="col-md-12 charts chrt-page-grids kk" id="cc"
				style="width: 100%;"></div>
			<div class="col-md-12 charts chrt-page-grids kk" id="dd"
				style="width: 100%;"></div>

			<div class="col-md-3 cc">
				<span class="ee">论文信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="ee"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="ff"></div>

			<div class="col-md-3 cc">
				<span class="ee">专利信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="hh"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="ii"></div>

			<div class="col-md-3 cc">
				<span class="ee">获奖信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="ll"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="mm"></div>

			<div class="col-md-3 cc">
				<span class="ee">项目信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="pp"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="qq"></div>

			<div class="col-md-3 cc">
				<span class="ee">教材信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="tt"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="uu"></div>

			<div class="col-md-3 cc">
				<span class="ee">竞赛信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="xx"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="yy"></div>
			<div class="clearfix"></div>

			<div class="col-md-3 cc">
				<span class="ee">用户信息统计信息</span>
			</div>
			<div class="col-md-9 dd"></div>
			<div class="col-md-6 charts chrt-page-grids kk" id="ttt"></div>
			<div class="col-md-6 charts chrt-page-grids chrt-right kk" id="ggg"></div>
			<div class="clearfix"></div>
		</div>
	</div>

	<script src="js/echarts.min.js" type="text/javascript"></script>
	<script src="js/theme/macarons.js" type="text/javascript"></script>
	<script>
		var theme = "macarons";
		optionaa = {
			title : {
				text : '男女科研数量',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '男', '女' ]
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${typeName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '男',
					type : 'bar',
					data : ${SexNanNumber},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				},
				{
					name : '女',
					type : 'bar',
					data : ${SexNvNumber},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				}
			]
		};
		
		optionbb = {
			title : {
				text : '科研数量占比',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : ${typeName}
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [
				{
					name : '数量及占比',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : ${allNumber}
				}
			]
		};
		
		optioncc = {
			title: {
		        text: '不同学院科研成果数据',
		        subtext: '',
		        sublink: ''
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data: ${typeName}
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		     grid: {
		        y: 60,
		        y2: 30,
		        x: 50,
		        x2: 50
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ${academyName}
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series: [
		        {
		            name: '论文',
		            type: 'bar',
		            data: ${academy1}
		        },
		        {
		            name: '专利',
		            type: 'bar',
		            data: ${academy2}
		        },
		        {
		            name: '获奖',
		            type: 'bar',
		            data: ${academy3}
		        },
		        {
		            name: '项目',
		            type: 'bar',
		            data: ${academy4}
		        },
		        {
		            name: '教材',
		            type: 'bar',
		            data: ${academy5}
		        },
		        {
		            name: '竞赛',
		            type: 'bar',
		            data: ${academy6}
		        }
		    ]
		};
		
		optiondd = {
			title: {
		        text: '2018年科研成果及趋势',
		        subtext: '',
		        sublink: ''
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data: ${typeName}
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		     grid: {
		        y: 60,
		        y2: 30,
		        x: 50,
		        x2: 50
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : ${yearName}
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'论文',
		            type:'line',
		            stack: '总量',
		            data: ${thYear}
		        },
		        {
		            name:'专利',
		            type:'line',
		            stack: '总量',
		            data: ${paYear}
		        },
		        {
		            name:'获奖',
		            type:'line',
		            stack: '总量',
		            data: ${prYear}
		        },
		        {
		            name:'项目',
		            type:'line',
		            stack: '总量',
		            data:${proYear}
		        },
		        {
		            name:'教材',
		            type:'line',
		            stack: '总量',
		            data:  ${boYear}
		        },
		        {
		            name:'竞赛',
		            type:'line',
		            stack: '总量',
		            data: ${raYear}
		        }
		    ]
		};
		
        /* 论文 */
        optionee = {
			title : {
				text : '不同学院论文数量',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['论文']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${academyName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '论文',
					type : 'bar',
					data : ${academy1},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				},
			    {
	              name:'搜索引擎细分',
	              type:'pie',
	              tooltip : {
	                  trigger: 'item',
	                  formatter: '{a} <br/>{b} : {c} ({d}%)'
	              },
	              center: [160,130],
	              radius : [0, 50],
	              itemStyle :　{
	                  normal : {
	                      labelLine : {
	                          length : 20
	                      }
	                  }
	              },
	              data: ${thCateNum}
	          }
			]
		};           
		
		optionff = {
			title : {
				text : '不同类别数量占比',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : ${thCateName}
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [
				{
					name : '数量及占比',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : ${thCateNum}
				}
			]
		};
		
		/* 专利 */
		 optionhh = {
			title : {
				text : '专利年份数量走向',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['专利']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${yearName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '专利',
					type : 'bar',
					data : ${paYear},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				}
			]
		};           
		
		optionii = {
			title : {
				text : '不同类别数量占比',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : ${paCateName}
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [
				{
					name : '数量及占比',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : ${paCateNum}
				}
			]
		};
	
		/* 获奖 */
		 optionll = {
			title : {
				text : '不同学院获奖数量',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['论文']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${academyName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '论文',
					type : 'bar',
					data : ${prYear},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				},
			    {
	              name:'搜索引擎细分',
	              type:'pie',
	              tooltip : {
	                  trigger: 'item',
	                  formatter: '{a} <br/>{b} : {c} ({d}%)'
	              },
	              center: [160,130],
	              radius : [0, 50],
	              itemStyle :　{
	                  normal : {
	                      labelLine : {
	                          length : 20
	                      }
	                  }
	              },
	              data: ${prCateNum}
	          }
			]
		};      
		
		optionmm = {
			title : {
				text : '不同学院获奖时间趋势',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['获奖']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${yearName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '获奖',
					type : 'line',
					data : ${prYear},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				}
			]
		};      
		/* 项目 */
		optionpp = {
			title : {
				text : '不同类别数量占比',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : ${proCateName}
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [
				{
					name : '数量及占比',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : ${proCateNum}
				}
			]
		};
		
		optionqq = {
			title : {
				text : '不同学院项目数量趋势',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['论文']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${yearName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '获奖',
					type : 'line',
					data : ${prYear},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				},
			    {
	              name:'搜索引擎细分',
	              type:'pie',
	              tooltip : {
	                  trigger: 'item',
	                  formatter: '{a} <br/>{b} : {c} ({d}%)'
	              },
	              center: [160,130],
	              radius : [0, 50],
	              itemStyle :　{
	                  normal : {
	                      labelLine : {
	                          length : 20
	                      }
	                  }
	              },
	              data:${proMoney}
	          }
			]
		};    
		
		/* 教材 */
		optiontt = {
			title : {
				text : '不同类别数量占比',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : ${boCateName}
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [
				{
					name : '数量及占比',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : ${boCateNum}
				}
			]
		};
		
		optionuu = {
			title : {
				text : '不同学院出版教材趋势',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['论文']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${academyName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '教材',
					type : 'line',
					data : ${academy5},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				},
			    {
	              name:'搜索引擎细分',
	              type:'pie',
	              tooltip : {
	                  trigger: 'item',
	                  formatter: '{a} <br/>{b} : {c} ({d}%)'
	              },
	              center: [160,130],
	              radius : [0, 50],
	              itemStyle :　{
	                  normal : {
	                      labelLine : {
	                          length : 20
	                      }
	                  }
	              },
	              data: ${boFant}
	          }
			]
		};    
		
		/* 竞赛 */
		optionxx = {
			title : {
				text : '不同类别数量占比',
				subtext : '',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : ${raCateName}
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			series : [
				{
					name : '数量及占比',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : ${raCateNum}
				}
			]
		};
		
		optionyy = {
			title : {
				text : '不同学院竞赛数量趋势',
				subtext : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : ['竞赛']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid: {
		        y: 80,
		        y2: 50,
		        x: 50,
		        x2: 50
		    },
			xAxis : [
				{
					type : 'category',
					data : ${yearName}
				}
			],
			yAxis : [
				{
					type : 'value'
				}
			],
			series : [
				{
					name : '获奖',
					type : 'line',
					data : ${raYear},
					markPoint : {
						data : [
							{
								type : 'max',
								name : '最大值'
							},
							{
								type : 'min',
								name : '最小值'
							}
						]
					},
					markLine : {
						data : [
							{
								type : 'average',
								name : '平均值'
							}
						]
					}
				}
			]
		};
		
		/* 用户 */
		optionttt = {
		    title : {
		        text: '用户男女比例',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data: ${SexName}
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'男女比例',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data: ${SexNameNum}
		        }
		    ]
		};
        
        optionggg = {
		    title : {
		        text: '',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data: ${AgeName}
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'用户年龄比例',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data: ${AgeNameNum}
		        }
		    ]
		};
                 
                    
		echarts.init(document.getElementById('aa'), theme).setOption(optionaa);
		echarts.init(document.getElementById('bb'), theme).setOption(optionbb);
		echarts.init(document.getElementById('cc'), theme).setOption(optioncc);
		echarts.init(document.getElementById('dd'), theme).setOption(optiondd);
		/* 论文 */
		echarts.init(document.getElementById('ee'), theme).setOption(optionee);
		echarts.init(document.getElementById('ff'), theme).setOption(optionff);
		/* 专利 */
		echarts.init(document.getElementById('ii'), theme).setOption(optionhh);
		echarts.init(document.getElementById('hh'), theme).setOption(optionii);
		/* 获奖 */
		echarts.init(document.getElementById('ll'), theme).setOption(optionll);
		echarts.init(document.getElementById('mm'), theme).setOption(optionmm);
		/* 项目 */
		echarts.init(document.getElementById('pp'), theme).setOption(optionpp);
		echarts.init(document.getElementById('qq'), theme).setOption(optionqq);
		/* 教材*/
		echarts.init(document.getElementById('uu'), theme).setOption(optiontt);
		echarts.init(document.getElementById('tt'), theme).setOption(optionuu);
		/* 竞赛*/
		echarts.init(document.getElementById('xx'), theme).setOption(optionxx);
		echarts.init(document.getElementById('yy'), theme).setOption(optionyy);
		/* 用户 */
		echarts.init(document.getElementById('ggg'), theme).setOption(optionttt);
		echarts.init(document.getElementById('ttt'), theme).setOption(optionggg);
	</script>
</body>
</html>
