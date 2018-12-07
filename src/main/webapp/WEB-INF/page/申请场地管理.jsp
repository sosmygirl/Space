<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>






<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<title>审查申请信息</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- 导入公共样式及js -->
		




<!-- 公共样式 -->
<link href="admin/style/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="admin/style/font-awesome.css">
<link href="admin/style/style.css" rel="stylesheet">

<!-- 公共js -->
<!--  <script type="text/javascript" src="admin/js/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript" src="admin/js/jquery.js"></script>
<script src="admin/js/bootstrap.js"></script>
<script type="text/javascript" src=""></script>
<script src="admin/js/custom.js"></script>


		<!-- 导入jq toast插件样式及js -->
		<link href="css/jquery.toast.min.css" rel="stylesheet">
		<script src="js/jquery.toast.min.js"></script>

	</head>
	<body>
		<!-- 头部 -->
		



<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
	<div class="conjtainer">
		<!-- 导航开始 -->
		<nav class="collapse navbar-collapse bs-navbar-collapse"
			role="navigation">

			<ul class="nav navbar-nav pull-right">
				<li class="dropdown pull-right">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-user"></i> admin<b class="caret"></b></a>

					<ul class="dropdown-menu">
					<li><a href="admin/toAddAdmin"><i class="icon-edit"></i> 添加管理员</a></li>
						<li><a href="admin/toPwdReset"><i class="icon-key"></i> 修改密码</a></li>
						<li><a href="admin/logout"><i class="icon-off"></i> 退出</a></li>
					</ul>
				</li>
			</ul>
		</nav>

	</div>
</div>

<!-- Header 开始 -->
<header>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="logo">
					<h1>
						<a href="#">Space<span class="bold"></span></a>
					</h1>
					<p class="meta">后台管理系统</p>
				</div>
			</div>

			<!-- Button section -->
			<div class="col-md-5">

				<!-- Buttons -->
				<ul class="nav nav-pills">
					
					<li class="dropdown dropdown-big"><a class="dropdown-toggle"
						href="#"> <i class="icon-comments"></i> 认证申请 <span
							class="label label-info">0</span>
					</a></li>

					<li class="dropdown dropdown-big"><a class="dropdown-toggle"
						href="#"> <i class="icon-envelope-alt"></i> 申请场地 <span
							class="label label-primary">0</span>
					</a></li>

					<li class="dropdown dropdown-big"><a class="dropdown-toggle"
						href="#"> <i class="icon-user"></i> 留言 <span
							class="label label-success">0</span>
					</a></li>

				</ul>

			</div>
			<!-- Data section -->

			<div class="col-md-3">
				<div class="header-data">

					<!-- Traffic data -->
					<div class="hdata">
						<div class="mcol-left">
							<!-- Icon with red background -->
							<i class="icon-signal bred"></i>
						</div>
						<div class="mcol-right">
							<!-- Number of visitors -->
							<p>
								<a href="#">31</a> <em>历史</em>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<!-- Members data -->
					<div class="hdata">
						<div class="mcol-left">
							<i class="icon-user bblue"></i>
						</div>
						<div class="mcol-right">
							<p>
								<a href="#">0</a> <em>今天</em>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>

		</div>
	</div>
</header>
		<div class="content">
			<!-- 菜单 -->
			
				
			



<div class="sidebar">
	<div class="sidebar-dropdown">
		<a href="#">导航</a>
	</div>

	<ul id="nav">
		<li>
			
				
				
					<a href="admin"><i class="icon-home"></i> 首页</a>
				
			
		</li>
		<li class="has_sub">
			
				
				
					<a href="#"><i class="icon-credit-card"></i> 认证管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>
				
			
				<li>
					<a href="admin/authentication/list?aType=1">班级认证&nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
				<li>
					<a href="admin/authentication/list?aType=2">教师认证 &nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
				<li>
					<a href="admin/authentication/list?aType=3">社团认证&nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
				<li>
					<a href="admin/authentication/list?aType=4">学院认证&nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
			</ul>
		</li>
		<li class="has_sub">
			
			
				
					<a href="#" class="subdrop"><i class="icon-envelope-alt"></i> 申请管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul style="display: block;">
				
				
			
				<li>
					<a href="admin/application/list?buildingType=0">教室 申请&nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
				<li>
					<a href="admin/application/list?buildingType=1">实验室申请&nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
				<li>
					<a href="admin/application/list?buildingType=2">综合楼申请&nbsp;&nbsp;&nbsp;
					
					</a>
				</li>
			</ul>
		</li>
		<li class="has_sub">
			
				
				
					<a href="#"><i class="icon-building"></i> 场地管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>
				
			
				<li>
					<a href="admin/building/list?type=0">教学楼</a>
				</li>
				<li>
					<a href="admin/building/list?type=1">实验楼</a>
				</li>
				<li>
					<a href="admin/building/list?type=2">综合楼</a>
				</li>
			</ul>
		</li>
		<li class="has_sub">
			
				
				
					<a href="#"><i class="icon-group"></i> 活动管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>
				
			
			
				<li>
					<a href="admin/activity/list">查看全部活动</a>
				</li>
				<li>
					<a href="admin/comment/list">查看一级评论</a>
				</li>
				<li>
					<a href="admin/reply/list">查看二级评论</a>
				</li>
				<li>
					<a href="admin/activity/toAddActivityPage">发布活动</a>
				</li>
			</ul>
		</li>
		
		<li class="has_sub">
			
				
				
					<a href="#"><i class="icon-group"></i> 公告管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>
				
			
			
			
				<li>
					<a href="admin/notice/list">查看公告</a>
				</li>
				<li>
					<a href="admin/notice/toPulishPage">发布公告</a>
				</li>

			</ul>
		</li>

		<li>
			
				
				
					<a href="admin/user/list"><i class="icon-user"></i>用户管理</a>
				
			
			
		</li>
		
		<!--  
		<li class="has_sub">
			
				
				
					<a href="#"><i class="icon-file-alt"></i> 查看日志 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>
				
			
			
			
				<li>
					
					<a href="admin/log/list?type=0">普通日志</a>
				</li>
				<li>
					<a href="admin/log/list?type=1">错误日志</a>
				</li>
			</ul>
		</li>
		-->
		
		<li>
			
				
				
					<a href="admin/setting"><i class="icon-wrench"></i>基本设置</a>
				
			
			
		</li>
	</ul>
</div>

			<div class="mainbar">
				<div class="page-head">
					<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
					<div class="bread-crumb pull-right">
						<a href="index.html"><i class="icon-home"></i> 首页</a>
						<!-- Divider -->
						<span class="divider">/</span>
						<a href="#" class="bread-current">申请管理</a>
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
												<form class="form-horizontal" method="post" action="admin/application/list">
													<input type="hidden" name="buildingType" value="1">
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
										<div class="pull-left">场地申请管理</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>申请人</th>
													<th>申请用途</th>
													<th>申请场地</th>
													<th>开始使用时间</th>
													<th>结束使用时间</th>
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
						<a href="admin/application/list?type=0&retrieval=&page=1" class="btn btn-active" >1</a>
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

		<!-- 底部 -->
		
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Copyright info -->
				<p class="copy">Copyright &copy; 2017 |
					<a href="#">理工学院</a>
				</p>
			</div>
		</div>
	</div>
</footer>
<!-- 快速回到顶部 -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>
		
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
								<label for="lastname" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input type="text" name="content" class="form-control" id="content" 
										   placeholder="备注">
								</div>
							</div>
							
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			                <button type="button" id="refuse" class="btn btn-primary" onclick="refuseApplication()">提交更改</button>
			            </div>
		           </form>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>

	</body>
	<script type="text/javascript">
		function updateApplication(element, id, status, content) {
			$.post("update",
					{
						"id": id,
						"status": status,
						"content":content,
					},
					function (data) {
						if (data['status'] == 'TRUE') {
							$(element).parent().parent().remove();
							$.toast({
		    				    heading: '操作结果',
		    				    text: '操作成功',
		    				    showHideTransition: 'slide',
		    				    icon: 'success'
		    				})
						} else {
							$.toast({
								heading: '操作结果',
		    				    text: '操作失败!' + data['tip'],
							    showHideTransition: 'fade',
							    icon: 'error'
							})
						}
					});
		}
		function refuseApplication() {
			var btnId = $("#a_id").val();
			var btn =$("#" + btnId);
			var content = $("#content").val();
			$('#myModal').modal('hide');
			updateApplication(btn, btnId, 1, content);
			
		}
		function showModal(id) {
			$("#a_id").val(id);
			$('#myModal').modal('show');
		}
		
	</script>
	

</html>