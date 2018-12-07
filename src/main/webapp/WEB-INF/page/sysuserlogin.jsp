<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>登录</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="<%=request.getContextPath() %>/style/admin/style/font-awesome.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/style/admin/style/font-awesome.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/style/admin/style/bootstrap.css" />
	<link href="<%=request.getContextPath() %>/style/admin/css/login.css" rel="stylesheet" type="text/css">
</head>

<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">Space后台管理系统登录界面</h1>
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form"  method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper" style="text-align: center; padding: 0;">
							
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper">
							<label for="email" class="control-label fa-label"><i class="fa fa-user fa-medium icon-user"></i></label>
							<input type="email" class="form-control" id="email" name="email" placeholder="Email">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium icon-lock"></i></label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Password">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<input type="button" value="Log in" onclick="dologin()" class="btn btn-info">
							
						</div>
					</div>
				</div>
				<hr>

			</form>
			<div class="text-center">
				<a href="" class="templatemo-create-new">首页<i class="fa fa-arrow-circle-o-right"></i></a>
			</div>
		</div>
	</div>
		<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">消息</h4>
            </div>
            <div class="modal-body" id="modalcontent"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
               
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/style/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/style/js/bootstrap.min.js"></script>
<script type="text/javascript">
function dologin(){
	var email =$("#email").val();
	var password =$("#password").val();
	$.ajax({
		url:"dologin",
		data:{"email":email,"password":password},
		success:function(data){
				if(data=="error"){
					$("#modalcontent").html("用户密码或账号错误，请重新登录！");
					$('#myModal').modal('show');
				}else{
					window.location.href="admin";
				}
		},
		error:function(){
			
		}
	});
	
}
</script>

</html>