<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<!-- Title and other stuffs -->
		<title>添加建筑</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<jsp:include page="../commons/commoncssandjs.jsp"/>


	</head>

	<body>
<jsp:include page="../commons/head.jsp"/>

		<div class="content">

			<jsp:include page="../commons/left.jsp"/>


			<!-- Main bar -->
			<div class="mainbar">
				<div class="page-head">
					<h2 class="pull-left"><i class="icon-home"></i> 发布活动</h2>
					<div class="bread-crumb pull-right">
						<a href="index.html"><i class="icon-home"></i> 首页</a>
						<span class="divider">/</span>
						<a href="<%=request.getContextPath()%>/space/addspace" class="bread-current">新增建筑</a>
					</div>
					<div class="clearfix"></div>
				</div>


				<div class="matter">
					<div class="container">
						
						<div class="row">
							<div class="col-md-12">
								<div class="widget wgreen">
									<div class="widget-head">
										<div class="pull-left">填写表单</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="padd">

											<!-- Form starts.  -->
											<form class="form-horizontal" role="form">
												<div class="form-group text-center">
													
												</div>
												<div class="form-group">
													<label class="col-lg-4 control-label">建筑名称</label>
													<div class="col-lg-8">
														<input id="name" name="name" type="text" value="" required="required" class="form-control" placeholder="建筑名称">
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">建筑介绍</label>
													<div class="col-lg-8">
														<textarea id="describe" name="describe"  required="required" class="form-control" rows="3" placeholder="建筑介绍"></textarea>
													</div>
												</div>


												<div class="form-group">
													<label class="col-lg-4 col-md-6 control-label">建筑类型</label>
													<div class="col-lg-2 col-md-2">
														
														<select name="type" class="form-control" id="selectoption">
															<c:forEach items="${buildingType}" var="buildingType">
																<option  value="${buildingType.id}">${buildingType.typename}</option>
															</c:forEach>

														</select>
													</div>
												</div>
												
												<div class="form-group">
													<div class="col-lg-offset-1 col-lg-1 col-md-offset-1 col-md-1 col-xs-5">
														<button type="button" class="btn btn-default" onclick="addbuilding()">确认新增</button>
													</div>
													<div class="col-lg-offset-1 col-lg-1 col-md-offset-1 col-md-1 col-xs-5">
														<a class="btn btn-default" href="<%=request.getContextPath()%>/admin">结束新增</a>
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
				<div class="clearfix"></div>
			</div>

		</div>
<jsp:include page="../commons/foot.jsp"/>


	<script type="text/javascript">
		function addbuilding() {
            var name = $("#name").val();
            var describe = $("#describe").val();
            var typeid = $("#selectoption").val();

			$.ajax({
				url:"<%=request.getContextPath()%>/space/doaddbuilding",
				data:{"name":name,"describe":describe,"typeid":typeid},
				success:function (data) {
				    if(data==="ok"){
                        alert("新增成功");
				    }else if(data=="error"){
				        alert("新增失败");
				    }else{
				        alert("新增教学楼已存在");
				    }
                },
                error: function () {
                    alert("发生错误");

                }
			});
        }

	</script>
	</body>
</html>