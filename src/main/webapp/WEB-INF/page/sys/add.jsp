<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<!-- Title and other stuffs -->
		<title>添加管理员</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<jsp:include page="../commons/commoncssandjs.jsp"/>

	</head>
	<body>
	<jsp:include page="../commons/head.jsp"/>

	<div class="content">
		<jsp:include page="../commons/left.jsp"/>
		<!--内容-->
		<div class="mainbar">
				<div class="page-head">
					<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
					<div class="bread-crumb pull-right">
						<a href="index.html"><i class="icon-home"></i> 首页</a>
						<span class="divider">/</span>
						<a href="#" class="bread-current">控制台</a>
					</div>
					<div class="clearfix"></div>
				</div>

				<!-- Matter -->
				<div class="matter">
					<div class="container">
						
						<div class="row">
							<div class="col-md-12">

								<div class="widget wgreen">

									<div class="widget-head">
										<div class="pull-left">添加管理员</div>
										<div class="clearfix"></div>
									</div>

									<div class="widget-content">
										<div class="padd">

											<!-- Form starts.  -->

											<form class="form-horizontal" role="form" method="post" >
												<div class="form-group text-center">

												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">用户名</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="name" name="username" type="text" value="" class="form-control" placeholder="用户名">
													</div>
													<span id="validatoru"></span>
												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">邮箱</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="email" name="email" type="email" required="required" value=""  class="form-control" placeholder="邮箱">
													</div>
													<span id="validatore"></span>
												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">密码</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="password"  name="password" type="password" required="required" class="form-control" placeholder="密码">
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">确认密码</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="pwd" name="password" required="required" type="password" class="form-control" placeholder="确认密码">
													</div>
												</div>

												<div class="form-group">
													<div class="col-lg-offset-1 col-lg-1 col-md-offset-1 col-md-1 col-xs-5">
														<button type="button" class="btn btn-success" onclick="registerbutton()">确认添加</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>


	<!-- 底部 -->
	<jsp:include page="../commons/foot.jsp" />


	</body>
	<script type="text/javascript">



		// var flag=false;
        // var flag2=false;
		// function validatoru(){
		// 	var username=$("#name").val();
		// 	$.ajax({
		// 		url:"valu",
		// 		data:{"username":username},
		// 		success:function(data){
		// 			if(data=="exist"){
        //                 flag=false;
		// 				$("#validatoru").css("color","red").html("用户名已被注册");
		// 			}else if(data=="ok"){
		// 				$("#validatoru").css("color","green").html("用户名未被注册");
        //                 flag=true;
		// 			}else{
		// 				$("#validatoru").css("color","red").html("用户名不能为空");
        //                 flag=false;
		// 			}
		// 		},
		// 		error:function(){
		// 			alert("sorry,出错了");
        //             flag=false;
		// 		}
		// 	});
		// }
		
	/* 	validator email */

        function check() {
            /*if (flag2==false||flag==false) {
                $("#fail_reg").show();
            }else{
                $("#success_reg").show();
            }*/

            var password = $("#password").val();
            var pwd = $("#pwd").val();
            if ($("#name").val() == "") {
                alert("用户名不能为空!");
                return false;
            } else
            if ($("#email").val() == "") {
                alert("邮箱不能为空!");
                return false;
            } else if  (pwd != password) {
                alert("输入的两次密码不一致!");
                return false;
            } else {
                return true;
            }

        }
	
	function registerbutton(){
        if (check()) {
            var email=$("#email").val();
            var username=$("#name").val();
            var password=$("#password").val();
            $.ajax({
                url:"addsysuser",
                data:{"email":email,"username":username,"password":password},
                success:function(data){
                    if(data=="error"){
                        alert("用户名或邮箱已存在");
                    }else if(data=="ok"){
                        alert("注册成功");
                    }else alert("注册失败")

                },
                error:function(){
                    alert("sorry,出错了");
                    flag2=false;
                }
            });
        }
    }


        /*	function registerbutton() {
				if(flag==true&&flag2==true){
						return true;
				}else {
					return false;
				}
			}*/

	
	
	</script>

</html>