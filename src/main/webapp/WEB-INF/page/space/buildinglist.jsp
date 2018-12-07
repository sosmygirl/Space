<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wohen
  Date: 2018/12/4
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<!-- Title and other stuffs -->
	<title>场地管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="../commons/commoncssandjs.jsp"/>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/admin/style/building.css" />

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
				<span class="divider">/</span>
				<a href="#" class="bread-current">场地管理</a>
			</div>
			<div class="clearfix"></div>
		</div>

		<div class="matter">
			<div class="container">

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
										<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid=${typeid}&currentpage=1&pagesize=3" >
											<!-- Title -->
											<div class="form-group">
												<input type="hidden" name="type" value="0">
												<div class="col-lg-6 col-md-8 col-sm-10 col-xs-8">
													<input id="keyword" type="text" name="keyword" class="form-control"  value="${keyword}" placeholder="搜索">
												</div>
												<div class="col-lg-1 col-md-4 col-sm-2 col-xs-4">
													<button type="submit" class="btn btn-success">搜索</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">

						<div class="well" style="margin-top: 50px; font-size: 18px; font-weight: bold; line-height: 50px; padding: 0;">
							<a href="<%=request.getContextPath()%>/space/addspace" style="color: black; margin: 0; padding: 12px; display: block;"><img style="height: 50px; width: 50px;" src="<%=request.getContextPath()%>/style/images/icon_building.png" /> <span style="padding-left: 20px;">添加建筑</span> <span class="pull-right"><i class="icon-plus-sign-alt"></i></span></a>
						</div>

					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="widget">
							<div class="widget-head">
								<div class="pull-left">
									<c:forEach items="${buildings}" var="building" begin="1" end="1">
										${building.type.typename}
									</c:forEach>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="widget-content">
								<div class="padd statement">

									<div class="row">

										<c:forEach items="${buildings}" var="building">
										<div class="col-md-4">
											<div class="well">
												<a href="<%=request.getContextPath()%>/space/buildingspace?buildingid=${building.id}&currentpage=1&pagesize=3" style="display: block; padding: 10px 15px;">
													<h2>建筑名称:${building.name}</h2>
													<h3>介绍:${building.describe}</h3>
													<h4>类型:${building.type.typename}</h4>
												</a>
											</div>
										</div>
										</c:forEach>

									</div>

								</div>

								<div class="widget-foot">





									<!-- 使用此分页需要两个属性space.admin.vo.Page page 和 url  -->

									<ul class="pagination pull-right">









										<li>
											<a href="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid=${typeid}&currentpage=1&pagesize=3" class="btn btn-active alink" >首页</a>
										</li>
										<c:if test="${page.hasPreviousPage}">
											<li>
												<a href="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid=${typeid}&currentpage=${page.prePage}&pagesize=3" class="btn btn-active alink" >上一页</a>
											</li>
										</c:if>
										<c:forEach items="${page.navigatepageNums}" var="i" >
											<li>
												<a href="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid=${typeid}&currentpage=${i}&pagesize=3" class="btn btn-active alink" >${i}</a>
											</li>
										</c:forEach>

										<c:if test="${page.hasNextPage}">
											<li>
												<a href="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid=${typeid}&currentpage=${page.nextPage}&pagesize=3" class="btn btn-active alink" >下一页</a>
											</li>
										</c:if>
										<li>
											<a href="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid=${typeid}&currentpage=${page.pages}&pagesize=3" class="btn btn-active alink" >尾页</a>
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
<jsp:include page="../commons/foot.jsp"/>

<script type="text/javascript">
    var keyword = $("#keyword").val();
    $(function () {
        var link = Array();
            if(keyword!=""){
                $(".alink").each(function (i) {
                    link[i] = $(this).attr("href");
                    var mlink = link[i] +"&keyword=" + keyword;
                    $(this).attr("href", mlink);
                })
            }

        })


</script>

</body>
</html>
