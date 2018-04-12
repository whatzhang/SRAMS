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

<title>register</title>

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

<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/art-content.js"></script>
</head>

<body>
	<div class="panel panel-danger" style="margin: 5em 10em 5em 10em;">
		<div class="panel-heading" style="height: 3em;">
			<h1 class="panel-title" style="text-align: left;">注册用户</h1>
		</div>
		<div class="main-page">
			<div class="panel-info widget-shadow">
				<div class=" panel-body-inputin" style="padding: 2em 1em 2em 2em;">
					<form class="form-horizontal" id="register"
						action="${pageContext.request.contextPath}/login/register"
						method="post" name="register">
						<br> <br>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">登录昵称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg"
									name="sr_login" id="sr_login" placeholder=""
									required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">输入密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control1 input-lg"
									name="sr_pass1" id="pa1" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">验证密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control1 input-lg"
									name="sr_pass2" id="pa2" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">真实姓名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_name"
									id="us_name" placeholder="" required="required">
							</div>

						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">用户年龄</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_age"
									id="us_age" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="radio" class="col-sm-2 control-label">用户性别</label>
							<div class="col-sm-8">
								<div class="radio-inline">
									<label><input type="radio" name="us_sex" checked
										value="1"> 男</label>
								</div>
								<div class="radio-inline">
									<label><input type="radio" name="us_sex" value="0">
										女</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">出生日期</label>
							<div class="col-sm-4">
								<input type="text" name="us_brith" readonly="readonly"
									class="form-control1 input-lg" id="Cdate" />
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">学号/工号</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_num"
									id="us_num" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">职称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_duty"
									id="us_duty" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">专业</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg"
									name="us_major" id="us_major" placeholder=""
									required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">联系地址</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg"
									name="us_address" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">联系电话</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg"
									name="us_phone" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">E-mail</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_mail"
									placeholder="" required="required">
							</div>
						</div>
						<div class="form-group mb-n">
							<label class="col-sm-2 control-label ">所属学院</label>
							<div class="col-sm-4">
								<select class="form-control1" required="required"
									name="us_academy">
									<option value="学院1">学院1</option>
									<option value="学院2">学院2</option>
									<option value="学院3">学院3</option>
									<option value="学院1">其他</option>
								</select>
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">密保问题一</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_qu1"
									placeholder=" " required="required">
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">预留答案一</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_key1"
									placeholder=" " required="required">
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">密保问题二</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_qu2"
									placeholder=" " required="required">
							</div>
						</div>

						<div class="form-group mb-n">
							<label for="largeinput"
								class="col-sm-2 control-label label-input-lg">预留答案二</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1 input-lg" name="us_key2"
									placeholder=" " required="required">
							</div>
						</div>
						<div class="form-group mb-n">

							<div class="col-sm-3" style="text-align: center;">
								<button type="submit" class="btn btn-danger">注册提交</button>
							</div>
							<div class="col-sm-3" style="text-align: center;">
								<button type="reset" class="btn btn-info">重置信息</button>
							</div>
							<div class="col-sm-3" style="text-align: center;">
								<button type="button" class="btn btn-success"
									onclick="javascript:history.back();">返回上一页</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- <script type="text/javascript">
		$(document).ready(function() {
			/**
			 * 下面是进行插件初始化
			 * 你只需传入相应的键值对
			 * */
			$('#defaultForm').bootstrapValidator({
				message : '',
				feedbackIcons : {/*输入框不同状态，显示图片的样式*/
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {/*验证*/
					sr_login : {/*键名和input name值对应*/
						message : '用户名无效',
						validators : {
							notEmpty : {/*非空提示*/
								message : '用户名不能为空'
							},
							regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
								regexp : /^[a-zA-Z0-9_\.]+$/,
								message : '只能是数字和字母_.'
							},
							stringLength : {/*长度提示*/
								min : 4,
								max : 20,
								message : '用户名长度必须在6到30之间'
							}
						/*最后一个没有逗号*/
						}
					},
					sr_pass1 : {
						message : '密码无效',
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 30,
								message : '密码长度必须在6到30之间'
							},
							different : {//不能和用户名相同
								field : 'sr_login',//需要进行比较的input name值
								message : '不能和用户名相同'
							}
						}
					},
					sr_pass2 : {
						message : '密码无效',
						validators : {
							identical : {//相同
								field : 'sr_pass1',
								message : '两次密码不一致'
							}
						}
					},
					us_mail : {
						validators : {
							message : '邮件无效',
							notEmpty : {
								message : '邮件不能为空'
							},
							emailAddress : {
								message : '请输入正确的邮件地址'
							}
						}
					},
					us_phone : {
						message : '号码无效',
						validators : {
							notEmpty : {
								message : '手机号码不能为空'
							},
							stringLength : {
								min : 11,
								max : 11,
								message : '请输入11位手机号码'
							},
							regexp : {
								regexp : /^1[3|5|8]{1}[0-9]{9}$/,
								message : '请输入正确的手机号码'
							}
						}
					},
				}
			});
		});
	</script> -->
</body>
</html>
