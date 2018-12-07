<%--
  Created by IntelliJ IDEA.
  User: wohen
  Date: 2018/12/3
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- 左边菜单 -->
<div class="sidebar">
	<div class="sidebar-dropdown">
		<a href="#">导航</a>
	</div>

	<ul id="nav">
		<li>


			<a href="<%=request.getContextPath()%>/admin" class="open"><i class="icon-home"></i> 首页</a>



		</li>
		<li class="has_sub">



			<a href="#"><i class="icon-credit-card"></i> 认证管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
			<ul>


				<li>
					<a href="http://localhost:8080/Space/admin/authentication/list?aType=1">班级认证&nbsp;&nbsp;&nbsp;

					</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/authentication/list?aType=2">教师认证 &nbsp;&nbsp;&nbsp;

					</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/authentication/list?aType=3">社团认证&nbsp;&nbsp;&nbsp;

					</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/authentication/list?aType=4">学院认证&nbsp;&nbsp;&nbsp;

					</a>
				</li>
			</ul>
		</li>
		<li class="has_sub">




			<a href="#"><i class="icon-envelope-alt"></i> 申请管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
			<ul>


				<li>
					<a href="http://localhost:8080/Space/admin/application/list?buildingType=0">教室 申请&nbsp;&nbsp;&nbsp;

					</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/application/list?buildingType=1">实验室申请&nbsp;&nbsp;&nbsp;

					</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/application/list?buildingType=2">综合楼申请&nbsp;&nbsp;&nbsp;

					</a>
				</li>
			</ul>
		</li>
		<li class="has_sub">



			<a href="#"><i class="icon-building"></i> 场地管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
			<ul id="buildingtype">


			<%--	<li>
					<a href="<%=request.getContextPath()%>/sys/buildinglist?type=0">教学楼</a>
				</li>
				<li>
					<a href="">实验楼</a>
				</li>
				<li>
					<a href="">综合楼</a>
				</li>--%>
			</ul>
		</li>
		<li class="has_sub">



			<a href="#"><i class="icon-group"></i> 活动管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
			<ul>



				<li>
					<a href="http://localhost:8080/Space/admin/activity/list">查看全部活动</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/comment/list">查看一级评论</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/reply/list">查看二级评论</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/activity/toAddActivityPage">发布活动</a>
				</li>
			</ul>
		</li>

		<li class="has_sub">



			<a href="#"><i class="icon-group"></i> 公告管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
			<ul>




				<li>
					<a href="http://localhost:8080/Space/admin/notice/list">查看公告</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/notice/toPulishPage">发布公告</a>
				</li>

			</ul>
		</li>

		<li>



			<a href="<%=request.getContextPath()%>/sys/userlist"><i class="icon-user"></i>用户管理</a>



		</li>

		<!--
		<li class="has_sub">



					<a href="#"><i class="icon-file-alt"></i> 查看日志 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>




				<li>

					<a href="http://localhost:8080/Space/admin/log/list?type=0">普通日志</a>
				</li>
				<li>
					<a href="http://localhost:8080/Space/admin/log/list?type=1">错误日志</a>
				</li>
			</ul>
		</li>
		-->

		<li>



			<a href="http://localhost:8080/Space/admin/setting"><i class="icon-wrench"></i>基本设置</a>


		</li>
	</ul>
</div>
<script type="text/javascript">
	$(function () {
		$.ajax({
			url:"<%=request.getContextPath()%>/space/alltype",
			success:function (data) {
				var lihtml="";
				for (var i=0;i<data.length;i++){
				    lihtml+='<li><a href="<%=request.getContextPath()%>/space/findbuildingtypebypage?typeid='+data[i].id+'&currentpage=1&pagesize=3">'+data[i].typename+'</a></li>';
				}
                $("#buildingtype").html(lihtml);
            },
            error: function () {
                alert("请求失败");

            }

		});
    })
	
</script>

