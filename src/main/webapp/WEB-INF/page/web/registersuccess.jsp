<%--
  Created by IntelliJ IDEA.
  User: wohen
  Date: 2018/12/6
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!--<link rel="icon" href="../../favicon.ico">-->

	<title>申请激活</title>

	<link
			href="<%=request.getContextPath()%>/style/css/bootstrap.min.css"
			rel="stylesheet">
	<script src="<%=request.getContextPath()%>/style/js/jquery.min.js"></script>
	<script	src="<%=request.getContextPath()%>/style/js/bootstrap.min.js"></script>
	<link href="<%=request.getContextPath()%>/style/css/base.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/style/css/apply-index.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/style/css/apply-form.css" rel="stylesheet">
</head>

<body>

<div class="container">
<div class="row">
	<div class=" col-sm-push-4 col-md-4 " style="background: #ce8483;height:500px">
		<c:if test="${active}=='success'">

			<div>${massage}<</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default"><a href="<%=request.getContextPath()%>/web/spacelist"></a>
				</button>
			</div>
		</c:if>
		<c:if test="${active}=='error'">
			<div>${massage}<</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default"><a href="<%=request.getContextPath()%>/web/spacelist"></a>
				</button>
			</div>
		</c:if>
	</div>
</div>
</div>

</body>


</html>
