<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<title>用户管理</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<jsp:include page="../commons/commoncssandjs.jsp"/>



	</head>

	<body>
	<jsp:include page="../commons/head.jsp"/>


		<div class="content">
			<jsp:include page="../commons/left.jsp"/>
			
			<div class="mainbar">
				<div class="page-head">
					<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
					<div class="bread-crumb pull-right">
						<a href="index.html"><i class="icon-home"></i> 首页</a>
						<!-- Divider -->
						<span class="divider">/</span>
						<a href="#" class="bread-current">用户管理</a>
					</div>
					<div class="clearfix"></div>
				</div>

				<!-- 内容主体 -->
				<div class="matter">
					<div class="container">
					
                    	<!-- 搜索框 -->
						<div class="row">
							<div class="col-md-8">
								<div class="widget">
									<div class="widget-head">
										<div class="pull-left">快速搜索</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="padd">
											<div class="form quick-post">
												<!-- Edit profile form (not working)-->
												<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/sys/userlist?currenpage=1&pagesize=5">
													<div class="form-group">
														<div class="col-lg-8 col-md-6 col-sm-10 col-xs-8" style="margin-bottom: 10px;">
															<input name="keyword" type="text" class="form-control" placeholder="用户名搜索" id="keyword" value="${keyword}">
														</div>
														<div class="col-lg-2 col-md-3 col-sm-10 col-xs-8">
															<select name="type" class="form-control">
																
																	
																		<option selected="selected" value="0">全部</option>
																		<option value="1">学生</option>
																		<option value="2">老师</option>
																		<option value="3">社团</option>
																		<option value="4">学院</option>
																	
																	
																	
																	
																	
																
															</select>
														</div>
														<div class="col-lg-1 col-md-3 col-sm-2 col-xs-4">
															<button type="submit" class="btn btn-success"<%-- onclick="return check()"--%>>搜索</button>
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
										<div class="pull-left">用户管理</div>
										<div class="clearfix"></div>
									</div>

									<div class="widget-content">

										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>用户名</th>
													<th>邮箱</th>
													<th>认证状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
											

												<c:forEach items="${list}" var="user">
													<tr>
														<td>${user.id}</td>
														<td>${user.username}</td>
														<td>${user.email}</td>
														<td></td>
														<td></td>
													</tr>

												</c:forEach>
											
														
											</tbody>
										</table>

										<div class="widget-foot">
											
												
											

<!-- 使用此分页需要两个属性space.admin.vo.Page page 和 url  -->
<style>
.pagination li{
width:25px;
clear: both;
}
</style>
<ul class="pagination ">





	<li>
		<a href="<%=request.getContextPath()%>/sys/userlist?currentpage=1&pagesize=5" class="btn btn-active alink" >首页</a>
	</li>
	<c:if test="${page.hasPreviousPage}">
		<li>
			<a href="<%=request.getContextPath()%>/sys/userlist?currentpage=${page.prePage}&pagesize=5" class="btn btn-active alink" >上一页</a>
		</li>
	</c:if>
	<c:forEach items="${page.navigatepageNums}" var="i" >
		<li>
			<a href="<%=request.getContextPath()%>/sys/userlist?currentpage=${i}&pagesize=5" class="btn btn-active alink" >${i}</a>
		</li>
	</c:forEach>

	<c:if test="${page.hasNextPage}">
		<li>
			<a href="<%=request.getContextPath()%>/sys/userlist?currentpage=${page.nextPage}&pagesize=5" class="btn btn-active alink" >下一页</a>
		</li>
	</c:if>
	<li>
	<a href="<%=request.getContextPath()%>/sys/userlist?currentpage=${page.pages}&pagesize=5" class="btn btn-active alink" >尾页</a>
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
	<script type="text/javascript">
		/*function check() {
            if ($("#searchname").val() == "") {
                alert("用户名不能为空!");
                return false;
            }

        }*/

        var keyword = $("#keyword").val();
		$(function () {
		    if (keyword!==""){
                var links = Array();
                $(".alink").each(function (i) {
                    links[i] = $(this).attr("href");
                    var eachlink = links[i]+"&keyword="+keyword;
                    $(this).attr("href", eachlink);
                })
		    }
        })
		
	</script>
	
	
		<!-- Footer ends -->

	
	
	</body>

</html>