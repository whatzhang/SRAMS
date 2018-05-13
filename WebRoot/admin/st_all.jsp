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
			<div class="col-md-9 dd"></div>
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
					data : [ 2.0, 4.9, 7.0, 23.2, 25.6, 76.7],
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7],
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
					data : [
						{
							value : 335,
							name : '论文'
						},
						{
							value : 310,
							name : '专利'
						},
						{
							value : 234,
							name : '获奖'
						},
						{
							value : 135,
							name : '项目'
						},
						{
							value : 1350,
							name : '教材'
						},
						{
							value : 55,
							name : '竞赛'
						}
					]
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
		            data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
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
		            data: [484.7,1444.3,1332.1,908,871.8,1983.7,1627.6,499.2,293,495,1239,1459]
		        },
		        {
		            name: '专利',
		            type: 'bar',
		            data: [506.3,1674.7,1405,1023.2,969,2149.7,1851.7,581.3,956,798,1459,1329]
		        },
		        {
		            name: '获奖',
		            type: 'bar',
		            data: [600.9,1823.4,1484.3,1116.1,1063.7,2455.5,2033.5,657.1,933,755,988,1890]
		        },
		        {
		            name: '项目',
		            type: 'bar',
		            data: [631.9,1902,1745.1,1215.1,1118.3,2736.9,2294,699.4,560,900,456,567]
		        },
		        {
		            name: '教材',
		            type: 'bar',
		            data: [404.7,1444.3,1332.1,908,871.8,1983.7,1627.6,499.2,932,565,1233,956]
		        },
		        {
		            name: '竞赛',
		            type: 'bar',
		            data: [506.3,1674.7,1405,1023.2,969,2149.7,1851.7,581.3,450,670,900,1433]
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
		            data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
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
		            data:[120, 132, 101, 134, 90, 1230, 210, 233, 563, 10, 90, 1230]
		        },
		        {
		            name:'专利',
		            type:'line',
		            stack: '总量',
		            data:[220, 182, 191, 234, 290, 330, 310, 234, 290, 123, 234, 290]
		        },
		        {
		            name:'获奖',
		            type:'line',
		            stack: '总量',
		            data:[150, 232, 201, 154, 190, 330, 410, 444, 230, 600, 154, 190]
		        },
		        {
		            name:'项目',
		            type:'line',
		            stack: '总量',
		            data:[320, 332, 301, 334, 390, 330, 320, 340, 77, 599, 332, 301]
		        },
		        {
		            name:'教材',
		            type:'line',
		            stack: '总量',
		            data:[820, 932, 901, 934, 1290, 1330, 1320, 1000, 342, 888, 932, 901]
		        },
		        {
		            name:'竞赛',
		            type:'line',
		            stack: '总量',
		            data:[620, 532, 901, 834, 290, 1330, 130, 1600, 342, 588, 532, 901]
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4, 28.7, 70.7],
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
	              data:[
	                  {value:1048, name:'百度'},
	                  {value:251, name:'ss'},
	                  {value:1048, name:'dd'},
	                  {value:251, name:'谷歌'},
	                  {value:147, name:'必应'},
	                  {value:102, name:'其他'}
	              ]
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
				data : ['类别一','类别二','类别三','其他']
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
					data : [
						{
							value : 335,
							name : '类别一'
						},
						{
							value : 310,
							name : '类别二'
						},
						{
							value : 234,
							name : '类别三'
						},
						{
							value : 135,
							name : '其他'
						}
					]
				}
			]
		};
		
		/* 专利 */
		 optionhh = {
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4],
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
	              data:[
	                  {value:1048, name:'百度'},
	                  {value:251, name:'ss'},
	                  {value:1048, name:'dd'},
	                  {value:251, name:'谷歌'},
	                  {value:147, name:'必应'},
	                  {value:102, name:'其他'}
	              ]
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
				data : ['类别一','类别二','类别三','其他']
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
					data : [
						{
							value : 335,
							name : '类别一'
						},
						{
							value : 310,
							name : '类别二'
						},
						{
							value : 234,
							name : '类别三'
						},
						{
							value : 135,
							name : '其他'
						}
					]
				}
			]
		};
	
		/* 获奖 */
		 optionll = {
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4, 28.7, 70.7],
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
	              data:[
	                  {value:1048, name:'百度'},
	                  {value:251, name:'ss'},
	                  {value:1048, name:'dd'},
	                  {value:251, name:'谷歌'},
	                  {value:147, name:'必应'},
	                  {value:102, name:'其他'}
	              ]
	          }
			]
		};      
		
		optionmm = {
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4],
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
	              data:[
	                  {value:1048, name:'团体'},
	                  {value:251, name:'个人'},
	                  {value:1048, name:'其他'},
	              ]
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
				data : ['类别一','类别二','类别三','其他']
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
					data : [
						{
							value : 335,
							name : '类别一'
						},
						{
							value : 310,
							name : '类别二'
						},
						{
							value : 234,
							name : '类别三'
						},
						{
							value : 135,
							name : '其他'
						}
					]
				}
			]
		};
		
		optionqq = {
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4],
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
	              data:[
	                  {value:1048, name:'>10000'},
	                  {value:251, name:'>5000,<10000'},
	                  {value:1048, name:'<5000'},
	              ]
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
				data : ['类别一','类别二','类别三','其他']
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
					data : [
						{
							value : 335,
							name : '类别一'
						},
						{
							value : 310,
							name : '类别二'
						},
						{
							value : 234,
							name : '类别三'
						},
						{
							value : 135,
							name : '其他'
						}
					]
				}
			]
		};
		
		optionuu = {
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4],
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
	              data:[
	                  {value:1048, name:'>10000'},
	                  {value:251, name:'>5000,<10000'},
	                  {value:1048, name:'<5000'},
	              ]
	          }
			]
		};    
		
		/* 教材 */
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
				data : ['类别一','类别二','类别三','其他']
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
					data : [
						{
							value : 335,
							name : '类别一'
						},
						{
							value : 310,
							name : '类别二'
						},
						{
							value : 234,
							name : '类别三'
						},
						{
							value : 135,
							name : '其他'
						}
					]
				}
			]
		};
		
		optionyy = {
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
					data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月']
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
					data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 2.6, 5.9, 9.0, 26.4],
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
	              data:[
	                  {value:1048, name:'>10000'},
	                  {value:251, name:'>5000,<10000'},
	                  {value:1048, name:'<5000'},
	              ]
	          }
			]
		};
		
		/* 用户 */
		optionttt = {
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
		        data:['男','女']
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
		            data:[
		                {value:335, name:'男'},
		                {value:120, name:'女'}
		            ]
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
		        data: ['Age<20', '20<Age<30', '30<Age<40', '40<Age<50', 'Age>50']
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
		            data:[
		                {value:335, name:'Age<20'},
		                {value:120, name:'20<Age<30'},
		                {value:335, name:'30<Age<40'},
		                {value:120, name:'40<Age<50'},
		                {value:335, name:'Age>50'}
		            ]
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
