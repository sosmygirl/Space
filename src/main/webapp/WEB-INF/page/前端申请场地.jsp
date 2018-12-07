<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--<link rel="icon" href="../../favicon.ico">-->

<title>场地管理系统</title>

<link
	href="css/bootstrap.min.css"
	rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script	src="js/bootstrap.min.js"></script>
<link href="css/base.css" rel="stylesheet">
<link href="css/apply-index.css" rel="stylesheet">
<link href="css/apply-form.css" rel="stylesheet">
</head>

<body>
	<!-- 使用动态include指令导入头部 -->
	




<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index">场地管理系统</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav pull-right">
				

					
						<li><a href="" data-toggle="modal" data-target="#loginPane">登录</a>
						</li>
						<li><a href="" data-toggle="modal" data-target="#registPane">注册</a>
						</li>
					

					
				
			</ul>
		</div>
	</div>
</nav>
<!-- 消息提示 -->




	
		<!--登录模态框-->
		<div class="modal fade" id="loginPane" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">登录</h4>
					</div>
					<div class="modal-body">
						<form>
							<p hidden="hidden" style="color: red" id="login-tip"></p>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> <input type="text"
									class="form-control" placeholder="请输入用户名或邮箱" name="username"
									id="login-username">
							</div>

							<div class="input-group input-group-lg">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span> <input type="password"
									class="form-control" name="password" placeholder="请输入登录密码"
									aria-describedby="pwd" id="login-password"> <span
									class="input-group-btn"> <a id="login-btn"
									class="btn btn-success" data-url="user/login">登 录</a>
								</span>
							</div>
						</form>
						<!-- <p class="">
							<a href="#" class="">忘记密码?</a>
						</p> -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!--注册模态框-->
		<div class="modal fade" id="registPane" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">注册</h4>
					</div>
					<div class="modal-body">
						<form>
							<p id="regist-tip" hidden="hidden" style="color: red;"></p>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> <input type="text"
									name="username" class="form-control" placeholder="请输入用户名"
									id="username">
							</div>
							<div class="alert alert-danger" hidden="hidden" id="nametip">
								<span class="glyphicon glyphicon-remove-sign"></span>&nbsp;<span
									id="name-cont"></span>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-envelope"></span></span> <input
									type="email" class="form-control" name="email"
									placeholder="请输入邮箱" aria-describedby="email" id="email">
							</div>
							<div class="alert alert-danger" id="emailtip" hidden="hidden">
								<span class="glyphicon glyphicon-remove-sign"></span>&nbsp;<span
									id="email-cont"></span>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span> <input type="password"
									name="password" class="form-control" placeholder="请输入密码"
									aria-describedby="pwd" id="password"> </span>
							</div>
							<div class="alert alert-danger" id="passtip" hidden="hidden">
								<span class="glyphicon glyphicon-remove-sign"></span>&nbsp;<span
									id="pwd-cont"></span>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span> <input type="password"
									name="password2" class="form-control" placeholder="请再次输入密码"
									aria-describedby="pwd" id="password2"> <span
									class="input-group-btn"> <a class="btn btn-success"
									type="submit" id="registBtn" data-url="user/regist">注
										册</a>
								</span>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<script>
$(document).ready(function() {
	/* ajax登录 */
	$("#login-btn").click(function(){
		var username = $("#login-username").val();
		var password = $("#login-password").val();
		if(username == ''){
			$("#login-tip").html("未输入用户名或邮箱！");
			$("#login-tip").show(300);
			return false;
		}else if(password == ""){
			$("#login-tip").html("未输入密码！");
			$("#login-tip").show(300);
			return false;
		}
		var url = $(this).data('url');

		$.post(url,
                {
                    "username": username,
                    "password":password,
                },
                function(data){
                	if(data['login']=='no'){
                		$("#login-tip").html(data['message']);
            			$("#login-tip").show(300);
            			return false;
                	}else{
                		window.location.reload();
                	}
            });
	});
	
	/* 注册表单验证 */
	var checkemail = function(){
		var email = $("#email").val();

        apos = email.indexOf("@");
        dotpos = email.lastIndexOf(".");
        if (apos < 1 || dotpos - apos < 2) {
            $("#email-cont").html('请输入一个正确的邮箱');
            $("#emailtip").show(300);
            return false;
        }else {
            $("#emailtip").hide(300);
            return true;
        }
	}
    $("#email").blur(function() {
    	checkemail();
    	
    });

    var checkPsd1 = function() {

        psd1 = $("#password").val();
        var flagZM = false;
        var flagSZ = false;
        var flagQT = false;
        if (psd1.length < 6 || psd1.length > 12) {
            $("#pwd-cont").html("请输入至少6位密码");
            $("#passtip").show(300);
            return false;
        } else {
            for (i = 0; i < psd1.length; i++) {
                if ((psd1.charAt(i) >= 'A' && psd1.charAt(i) <= 'Z') || (psd1.charAt(i) >= 'a' && psd1.charAt(i) <= 'z')) {
                    flagZM = true;
                } else if (psd1.charAt(i) >= '0' && psd1.charAt(i) <= '9') {
                    flagSZ = true;
                } else {
                    flagQT = true;
                }
            }
            if (!flagZM || !flagSZ || flagQT) {
                $("#pwd-cont").html("密码必须由 字母 和 数字 组成");
                $("#passtip").show(300);
                return false;
            } else {
                $("#passtip").hide(300);
            }
        }
        return true;
    };
    $("#password").blur(checkPsd1);
    
    var checkPsd2 = function() {
        var pwd = $("#password").val();
        var cpwd = $("#password2").val();
        if (pwd != cpwd) {
            $("#pwd-cont").html("两次密码不一致");
            $("#passtip").show(300);
            return false;
        } else {
            $("#passtip").hide(300);
        }
        return true;
        
    }
    $('#password2').blur(checkPsd2);
    $('#registBtn').click(function(){
    	var username = $("#username").val();
    	if(username == ""){
    		$("#name-cont").html("未输入用户名！");
    		$("#nametip").show(300);
    		return false;
    	}
    	if(checkemail() == false){
    		return false;
    	}
    	
		if(checkPsd1() == false){
			return false;
		}
		if(checkPsd2() == false){
			return false;
		}
		
		var username = $("#username").val();
		var email = $("#email").val();
		var password = $("#password").val();
		var password2 = $("#password2").val();
		var url = $(this).data('url');
		$.post(url,
				{
					"username":username,
					"email":email,
					"password":password,
					"password2":password2,
				},function(data){
					$("#regist-tip").html(data['message']);
					$("#regist-tip").show(300);
					if(data['valid'] == "yes"){
						setTimeout(function(){
							$("#regist-tip").html("自动登录中。。。。");
							$("#regist-tip").show(300);
							window.location.reload();
						},1000);
					}					
				});
    });
	
});

</script>
	

	


	<section id="main">
		<div>
			<aside class="col-sm-2 aside-menu" id="aside">
				<div>
					<h3>所有场地</h3>
				</div>
				<ul class="tree">
					<!-- <li><a href="">所有场地</a></li> -->

					<li><span>教学楼</span>
						<ul>
							
								<li><a href="#b25">教学楼1</a></li>
							
								<li><a href="#b26">体育馆</a></li>
							
								<li><a href="#b27">计算机教学楼</a></li>
							
						</ul></li>
					<li><span>实验楼</span>
						<ul>
							
								<li><a href="#b28">化工实验楼</a></li>
							
						</ul></li>
					<li><span>综合楼</span>
						<ul>
							
						</ul></li>
				</ul>
			</aside>

			<div class="col-sm-10 " id="space-list">
				<p class="apply-tip">
					申请须知：<br> 1.认证类型为班级，社团，教师，学院可申请普通教室;<br>
					2.认证类型为教师才能申请1实验室;<br> 3.认证类型为社团，学院才能申请综合楼；
				</p>
				
					
						<!-- 未登录 -->

						<div class="row">
							<!-- <div class="b-title">教学楼</div> -->
							
								<div class="building-div">
									<a class="target-fix" id="b25"></a> <span>教学楼1</span>
									<p>教学楼1</p>
								</div>
								<div class="row">
									
										<div class="col-sm-4">
											<div class="panel panel-warning">
												<div class="panel-heading">
													<span class="bui-name">教学楼1
														201</span>
														<!-- <span class="label label-success pull-right">可用</span> -->
												</div>
												<div class="panel-body">
													<p>
														<label>类型：</label>普通教室
													</p>
													<p>
														<label>容量：</label> 20座位
													</p>
													<p>
														<a class="btn btn-sm btn-info nologin">申请该场地</a>
														&nbsp;&nbsp;<a class="btn btn-sm btn-warning weekUse"
															data-id="32">未来一周的使用情况</a>
													</p>
												</div>
											</div>
										</div>
									
								</div>
							
								<div class="building-div">
									<a class="target-fix" id="b26"></a> <span>体育馆</span>
									<p>体育馆</p>
								</div>
								<div class="row">
									
								</div>
							
								<div class="building-div">
									<a class="target-fix" id="b27"></a> <span>计算机教学楼</span>
									<p>计算机学院</p>
								</div>
								<div class="row">
									
								</div>
							
						</div>
						<div class="row">
							<!-- <div class="b-title">实验楼</div> -->
							

								<div class="building-div">
									<a class="target-fix" id="b28"></a> <span>化工实验楼</span>
									<p>化学工程与工艺学院</p>
								</div>
								<div class="row">
									
								</div>
							
						</div>
						<div class="row">
							<!-- <div  class="b-title">综合楼</div> -->
							
						</div>

					

					
				
			</div>
		</div>
	</section>
	<br>

	<!-- 使用动态include指令导入底部版权栏 -->
	
<footer>
	<p>&copy; Copyright 2017&nbsp; 场地管理系统</p>
</footer>
<script>
	$(document).ready(function() {
		minHeight = $(window).height();
		$('#main').css("min-height", (minHeight-70) + "px");
	});
</script>

	<!-- 用户未登录提示框 -->
	<div class="modal fade" id="nologin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">温馨提示</h2>
				</div>
				<div class="modal-body">
					<h3>游客不能申请场地！ 请登录后再操作</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 表单弹出框 -->
	<div class="modal show " id="applyform" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">场地申请</h2>

				</div>
				<div class="modal-body">
					


<div id="form-div">
	<h2 class="form-title">场地申请表</h2>
	<p class="form-time" id="form-time"></p>
	<form method="post">
		<fieldset>
			<legend>申请者信息</legend>
			<p>
				<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <span>
					</span>
			</p>

			<p>
				<label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label> <span></span>
			</p>
			<p>
				<label>认证类型：</label> <span id="form-auth-type"></span>
			</p>
		</fieldset>
		<fieldset>
			<legend>场地信息</legend>
			<p>
				<label>场地编号：</label> <span id="form-room-id"></span>
			</p>
			<p>
				<label>场地类型：</label> <span id="form-room-type"></span>
			</p>
			<p>
				<label>容&nbsp;&nbsp;&nbsp;&nbsp;量：</label> <span id="form-capacity"></span>
			</p>
		</fieldset>
		<fieldset>
			<legend>填写表单</legend>
			<input type="text" hidden="hidden" id="form-buiId" name="buiId"
				value=""> <input type="text" hidden="hidden"
				id="form-roomId" name="roomId" value="">
			<p>
				<label>借用时间：</label><br /> <input type="datetime-local"
					id="form-start-time" name="startTime"> TO <input
					type="datetime-local" id="form-end-time" name="endTime">
			</p>
			<p>
				<label>借用事由：</label>
				<textarea placeholder="借用事由" name="reason" id="form-reason"></textarea>
			</p>
		</fieldset>
		<p id="submite-btn">
			<a id="app-btn" href="javascript:void(0);"
				data-url="apply/applyForm">提交申请</a>
		</p>
	</form>
</div>
<script>
	$(document).ready(
			function() {
				$("#app-btn").click(
						function() {

							var url = $(this).data("url");
							var buiId = $("#form-buiId").val();
							var roomId = $("#form-roomId").val();
							var startTime = $("#form-start-time").val();
							var endTime = $("#form-end-time").val();
							var reason = $("#form-reason").val();

							if (url == "" || buiId == "" || roomId == ""
									|| startTime == "" || endTime == ""
									|| reason == "") {
								$("#apply-message").html('表单未填完整！')
								$('#applyMSG').modal();
								return false;
							}

							var start = new Date(startTime);

							var end = new Date(endTime);

							if (start > end) {
								$("#apply-message").html('开始时间不能大于结束时间！')
								$('#applyMSG').modal();
								return false;
							}
							var now = new Date();
							if (now > start) {
								$("#apply-message").html('开始时间不能小于当前时间！')
								$('#applyMSG').modal();
								return false;
							}

							$.post(url, {
								"buiId" : buiId,
								"roomId" : roomId,
								"startTime" : startTime,
								"endTime" : endTime,
								"reason" : reason,
							}, function(data) {
								if (data['form'] == "no") {
									$("#apply-message").html('表单未填完整！')
									$('#applyMSG').modal();
								} else if (data["login"] == "no") {
									$("#apply-message").html('未登录，游客不可以申请场地！')
									$('#applyMSG').modal();
								} else if (data["auth"] == "no") {
									$("#apply-message").html('您还未认证，不可以申请场地')
									$('#applyMSG').modal();
								} else if (data["status"] == "no") {
									$("#apply-message").html(
											'您的认证申请暂未通过审核，不可以申请场地')
									$('#applyMSG').modal();
								} else if (data["canapply"] == "no") {
									$("#apply-message").html('您的认证类型不可以申请该场地');
									$('#applyMSG').modal();
								} else if (data["startTime"] == "no") {
									$("#apply-message").html('开始时间不能小于当前时间！')
									$('#applyMSG').modal();
								} else if (data["room"] == "no") {
									$("#apply-message").html('该场地不存在！')
									$('#applyMSG').modal();
								} else if (data["existApps"] == "error") {
									$("#apply-message").html('服务器发生了一些错误！')
									$('#applyMSG').modal();
								} else if (data["existApps"] == "no") {
									$("#apply-message").html('时间段与其他申请存在冲突！')
									$('#applyMSG').modal();
								} else if (data["app"] == "no") {
									$("#apply-message").html('服务器发生错误！')
									$('#applyMSG').modal();
								} else if (data['app'] == "yes") {
									$("#apply-message").html('恭喜，申请提交成功！')
									$('#applyMSG').modal();

									$("#form-buiId").val('');
									$("#form-roomId").val('');
									$("#form-start-time").val('');
									$("#form-end-time").val('');
									$("#form-reason").val('');
								}
							});
						});
			});
</script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 申请场所时信息提示 -->
	<div class="modal fade" id="applyMSG" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">温馨提示</h2>
				</div>
				<div class="modal-body">
					<h3 id="apply-message"></h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 未来一周申请情况的提示框 -->
	<div class="modal fade" id="app-week" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">未来一周场地使用的申请情况</h2>
				</div>
				<div class="modal-body">
					<table class="table table-striped" id="app-week-list">
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	

	<script src="js/jquery.treemenu.js"></script>
</body>
<script>
	$(function() {
		$(".tree").treemenu({
			delay : 300
		}).openActive();

	});
</script>
<script>
	$(document).ready(
			function() {
				minHeight = $(window).height();
				$('#aside,#space-list').css("height", (minHeight - 70) + "px");

				$('.nologin').click(function() {
					$('#nologin').modal();
				});
				applyform
				$('.applyform').click(
						function() {
							var obj = $(this);
							var canapplyurl = $(this).data('canapplyurl');
							var bid = $(this).data('bid');
							$.post(canapplyurl, {
								"canapplyurl" : canapplyurl,
								"bid" : bid,
							}, function(data) {

								if (data["logined"] == "no") {
									$('#nologin').modal();
								} else if (data["auth"] == "null") {
									$("#apply-message").html('您暂未认证，认证后才能申请场地')
									$('#applyMSG').modal();
								} else if (data["status"] == "no") {
									$("#apply-message").html(
											'您的认证申请暂未通过审核，不可以申请场地')
									$('#applyMSG').modal();
								} else if (data['canapply'] == "no") {
									$("#apply-message").html(
											'您的认证类型是：' + data['auth']
													+ ", 不可以申请该场地")
									$('#applyMSG').modal();
								} else if (data['canapply'] == "yes") {
									$('#form-auth-type').html(data['auth']);
									var buiName = obj.parent().parent().prev()
											.children('.bui-name').html();
									$("#form-room-id").html(buiName);
									var capacity = obj.parent().prev()
											.children('span').html();
									$('#form-capacity').html(capacity);
									var roomtype = obj.parent().prev().prev()
											.children('span').html();
									$('#form-room-type').html(roomtype);
									var now = nowtime();
									$("#form-time").html(now);
									var roomId = obj.data('roomid');
									$("#form-roomId").val(roomId);
									$("#form-buiId").val(bid);

									$('#applyform').modal();

								} else {

								}
							});

						});
				function nowtime() {//将当前时间转换成yyyymmdd格式
					var mydate = new Date();
					var str = "" + mydate.getFullYear();
					var mm = mydate.getMonth() + 1
					if (mydate.getMonth() > 9) {
						str = str + "-" + mm + "-";
					} else {
						str = str + "-" + "0" + mm + "-";
					}
					if (mydate.getDate() > 9) {
						str += mydate.getDate();
					} else {
						str += "0" + mydate.getDate();
					}
					return str;
				}

				/* 查看未来一周的使用情况 */
				$(".weekUse").click(function() {
					var id = $(this).data("id");
					var url = "apply/weekUse/";
					$.post(url, {
						"id" : id,
					}, function(data) {
						if(data['room']=="no"){
							
						}else if(data['apps']=="error"){
							
						}else{
							if(data['apps'].length == 0){
								$("#app-week-list").html("未来两周没有申请");
							}else{
								var tr = '<tr><th>序号</th><th>开始时间</th><th>结束时间</th></tr>';
			
								$.each(data['apps'],function(index,item){
								tr = tr +  '<tr><td>' + index + '</td><td>' 
									+ getMyDate(item['appStartTime']) + '</td><td>' + getMyDate(item['appEndTime']) + '</td></tr>';
								});
								$("#app-week-list").html(tr);
							}
							$("#app-week").modal();
						}
						
					});
				});
				
				/* 把后台传来的时间戳格式化 */
				//获得年月日      得到日期oTime  
		        function getMyDate(str){  
		            var oDate = new Date(str),  
		            oYear = oDate.getFullYear(),  
		            oMonth = oDate.getMonth()+1,  
		            oDay = oDate.getDate(),  
		            oHour = oDate.getHours(),  
		            oMin = oDate.getMinutes(),  
		            oSen = oDate.getSeconds(),  
		            oTime = oYear +'年'+ getzf(oMonth) +'月'+ getzf(oDay) +'日  '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
		            return oTime;  
		        };  
		        //补0操作  
		        function getzf(num){  
		            if(parseInt(num) < 10){  
		                num = '0'+num;  
		            }  
		            return num;  
		        }
			});
</script>

</html>