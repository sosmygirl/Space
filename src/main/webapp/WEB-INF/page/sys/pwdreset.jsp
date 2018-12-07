<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<!-- Title and other stuffs -->
		<title>Index</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<jsp:include page="../commons/commoncssandjs.jsp"/>

	</head>
	<body>
	<jsp:include page="../commons/head.jsp"/>



	<div class="content">
		<jsp:include page="../commons/left.jsp"/>
			<!-- 内容 -->
			<div class="mainbar">

				<div class="page-head">
					<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
					<div class="bread-crumb pull-right">
						<a href="index.html"><i class="icon-home"></i> 首页</a>
						<span class="divider">/</span>
						<a href="#" class="bread-current">修改密码</a>
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
										<div class="pull-left">修改密码</div>
										<div class="clearfix"></div>
									</div>

									<div class="widget-content">
										<div class="padd">

											<!-- Form starts.  -->
											<form class="form-horizontal" role="form" method="post" >
												<div class="form-group text-center">
													<span id="toast_error"></span>
												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">旧密码</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="oldPwd" name="oldPwd" required="required" type="password" class="form-control" placeholder="旧密码">
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">新密码</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="password" type="password" required="required" class="form-control" placeholder="新密码">
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-4 col-md-4 col-xs-4 control-label">确认密码</label>
													<div class="col-lg-8 col-md-8 col-xs-8">
														<input id="newPwd" name="newPwd" required="required" type="password" class="form-control" placeholder="确认密码">
													</div>
												</div>

												<div class="form-group">
													<div class="col-lg-offset-1 col-lg-1 col-md-offset-1 col-md-1 col-xs-5">
														<button type="submit" class="btn btn-success" onclick="updatepwd()">确认修改</button>
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
	<jsp:include page="../commons/foot.jsp"/>
		<script type="text/javascript">
            function updatepwd() {
                var oldPwd = $("#oldPwd").val();
                var password = $("#password").val();
                var newPwd = $("#newPwd").val();
                $.ajax({
                    url:"updatePwd",
                    data:"oldPwd="+oldPwd+"&password="+password+"&newPwd="+newPwd+"",
                    success:function (data) {
                        if (data=="ok"){
                            alert("修改成功,即将退出登录");
                            window.location.href="logout";
                        }else
                        if (data=="error1"){
                            alert("两次输入的密码不一致");
                        }else
                        if (data=="error2"){
                            alert("旧密码不正确");
                        } else{
                            alert("密码不能为空");
                        }

                    },
                    error:function () {
                        alert("发生了错误");
                    }
                });
            }

		</script>

	</body>



</html>