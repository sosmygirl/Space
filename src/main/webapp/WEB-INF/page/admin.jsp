<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<!-- Title and other stuffs -->
		<title>首页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<jsp:include page="commons/commoncssandjs.jsp"/>

	</head>
	<body>

		



<jsp:include page="commons/head.jsp" />

		<div class="content">

			<!-- 左边菜单 -->
			<jsp:include page="commons/left.jsp" />

			<!-- 内容 -->
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

								<div class="widget">
									<div class="widget-head">
										<div class="pull-left">未来7天使用信息</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<table class="table table-striped table-bordered table-hover" style="table-layout: fixed;">
											<thead>
												<tr>
													
														<th class="text-center">
															2018-03-14
														</th>
													
														<th class="text-center">
															2018-03-15
														</th>
													
														<th class="text-center">
															2018-03-16
														</th>
													
														<th class="text-center">
															2018-03-17
														</th>
													
														<th class="text-center">
															2018-03-18
														</th>
													
														<th class="text-center">
															2018-03-19
														</th>
													
														<th class="text-center">
															2018-03-20
														</th>
													
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														
													</td>
													<td>
														
													</td>
													<td>
														
													</td>
													<td>
														
															<div class="well">
																<h4>地点:教学楼、教学楼1、201</h4>
																<h4>申请人:(认证名)qqq</h4>
																<h4>使用时间:</h4>
																<h4>
																	2018-03-17
																 <br>至<br> 
																 	2018-03-18
																 </h4>
															</div>
														
													</td>
													<td>
														
															<div class="well">
																<h4>地点:教学楼、教学楼1、201</h4>
																<h4>申请人:(认证名)qqq</h4>
																<h4>使用时间:</h4>
																<h4>
																	2018-03-17
																 <br>至<br> 
																 	2018-03-18
																 </h4>
															</div>
														
													</td>
													<td>
														
													</td>
													<td>
														
													</td>
												</tr>
											</tbody>
										</table>
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
<jsp:include page="commons/foot.jsp" />


	</body>

</html>