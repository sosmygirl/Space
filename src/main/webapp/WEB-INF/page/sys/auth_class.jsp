<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<title>审查认证信息</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<jsp:include page="../commons/commoncssandjs.jsp"/>


		
		
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/admin/style/authentication.css" />
        
        <!-- 导入jq toast插件样式及js -->
		<link href="<%=request.getContextPath()%>/style/css/jquery.toast.min.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/style/js/jquery.toast.min.js"></script>

	</head>

	<body>
	<jsp:include page="../commons/head.jsp"/>
	<jsp:include page="../commons/left.jsp"/>

			
			<div class="mainbar">
				<div class="page-head">
					<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
					<div class="bread-crumb pull-right">
						<a href="index.html"><i class="icon-home"></i> 首页</a>
						<!-- Divider -->
						<span class="divider">/</span>
						<a href="#" class="bread-current">认证管理</a>
					</div>
					<div class="clearfix"></div>
				</div>

				<!-- 内容主体 -->
				<div class="matter">
					<div class="container">
					
                    	<!-- 搜索框 -->
						<div class="row">
							<div class="col-md-12">
								<div class="widget">
									<div class="widget-head">
										<div class="pull-left">快速搜索</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="padd">
											<div class="form quick-post">
												<!-- Edit profile form (not working)-->
												<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/admin/authentication/list">
													<input type="hidden" name="aType" value="1">
													<div class="form-group">
														<div class="col-lg-8 col-md-6 col-sm-10 col-xs-8" style="margin-bottom: 10px;">
															<input name="retrieval" type="text" class="form-control" id="title" placeholder="搜索姓名/名称" value="">
														</div>
														<div class="col-lg-2 col-md-3 col-sm-10 col-xs-8">
															<select name="type" class="form-control">
																
																	
																		<option selected="selected" value="0">未处理</option>
																		<option value="1">已通过</option>
																		<option value="2">未通过</option>
																	
																	
																	
																
															</select>
														</div>
														<div class="col-lg-1 col-md-3 col-sm-2 col-xs-4">
															<button type="submit" class="btn btn-success">搜索</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								
								</div>
							</div>
							
						</div>


						<div class="row">
							<div class="col-md-12">
								<div class="widget">
									<div class="widget-head">
										<div class="pull-left">认证申请</div>
										<div class="clearfix"></div>
									</div>

									<div class="widget-content">

										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>邮箱</th>
													<th>姓名/名称</th>
													<th>认证照片</th>
													<th>介绍</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
											
											


											</tbody>
										</table>

										<div class="widget-foot">
											
												
											

<!-- 使用此分页需要两个属性space.admin.vo.Page page 和 url  -->

<ul class="pagination pull-right">
	

	
	

	
		
			
				
					<li>
						<a href="<%=request.getContextPath()%>/admin/authentication/list?atype=&type=0&retrieval=&page=1" class="btn btn-active" >1</a>
					</li>
				
				
			
		
	
	
</ul>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Matter ends -->
			</div>

			<!-- Mainbar ends -->
			<div class="clearfix"></div>

		</div>
		<!-- Content ends -->

		<!-- Footer starts -->
	<jsp:include page="../commons/foot.jsp"/>

		<!-- Footer ends -->
		
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		        <div class="modal-content">
		        
		        	<form action="" class="form-horizontal" role="form">
		        		<input type="hidden" name="a_id" id="a_id">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">请输入不通过申请理由</h4>
			            </div>
			            
							<div class="form-group" style="margin-top: 20px">
								<label for="content" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" name="content" class="form-control" id="content" 
										   placeholder="备注">
								</div>
							</div>
							
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			                <button type="button" id="refuse" class="btn btn-primary" onclick="refuseAuthentication()">提交更改</button>
			            </div>
		           </form>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>

	</body>
	<script type="text/javascript">
		function updateAuthentication(element, id, status, content) {
			$.post("update",
					{
						"id": id,
						"status": status,
						"content": content,
					},
					function (data) {
						if (data['status'] == 'TRUE') {
							$(element).parent().parent().remove();
							$.toast({
		    				    heading: '操作结果',
		    				    text: '处理成功',
		    				    showHideTransition: 'slide',
		    				    icon: 'success'
		    				})
						} else {
							$.toast({
								heading: '操作结果',
		    				    text: '处理失败',
							    showHideTransition: 'fade',
							    icon: 'error'
							})
						}
					});
		}
		function refuseAuthentication() {
			var btnId = $("#a_id").val();
			var btn =$("#" + btnId);
			var content = $("#content").val();
			$('#myModal').modal('hide');
			updateAuthentication(btn, btnId, 1, content);
			
		}
		function showModal(id) {
			$("#a_id").val(id);
			$('#myModal').modal('show');
		}
	</script>

</html>