<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: wohen
  Date: 2018/12/6
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

				<shiro:guest>
					<li><a href="" data-toggle="modal" data-target="#loginPane">登录</a>
					</li>
					<li><a href="" data-toggle="modal" data-target="#registPane">注册</a>
					</li>
				</shiro:guest>
				<shiro:user>
					<li><a href="#">
						<shiro:principal ></shiro:principal>

					</a>
					</li>
					<li><a href="<%=request.getContextPath()%>/logout">注销</a>
					</li>
				</shiro:user>
			</ul>
		</div>
	</div>
</nav>

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
									class="btn btn-success" data-url="<%=request.getContextPath()%>/user/login">登 录</a>
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
									type="submit" id="registBtn" data-url="<%=request.getContextPath()%>/user/regist">注
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


		$.ajax({
            url: url,
			data:{
                "email": username,
                "password":password},
                success: function (data) {
	                if (data == "ok") {
	                    if ($("#tourl").val()=='spacelist'){
	                        window.location.href="<%=request.getContextPath()%>/web/spacelist";
	                    }
	                    if ($("#tourl").val()=='index') {
	                        window.location.href="<%=request.getContextPath()%>/index";
	                    }

	                }else {
	                    $("#login-tip").html("登录失败");
	                    $("#login-tip").show(300);
	                }
            },
            error: function () {
                $("#login-tip").html("登录失败");
                $("#login-tip").show(300);

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
        $("#regist-tip").html("正在注册中，请稍等...");
        $("#regist-tip").show(300);
		$.ajax({
			url:url,
			data:{"username":username,
                "email":email,
                "password":password},
			success:function (data) {
				if(data=="success"){
                    $("#regist-tip").html("注册成功，激活邮件已发送");
                    $("#regist-tip").show(300);
                    alert("请登录");
                    window.location.reload();
				}else if(data=="error") {
                    $("#regist-tip").html("注册失败，该邮箱或用户名已存在，请重新注册");
                    $("#regist-tip").show(300);
				}else{
                    $("#regist-tip").html("注册失败");
                    $("#regist-tip").show(300);
				}
            }
		});
    });

});

</script>
