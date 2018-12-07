<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

<title>场地管理系统</title>

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
	<!-- 使用动态include指令导入头部 -->
	
<jsp:include page="../commons/webhead.jsp"/>
	<input id="tourl" class="hidden" value="spacelist" >

<!-- 消息提示 -->

	<section id="main">
		<div>
			<aside class="col-sm-2 aside-menu" id="aside">
				<div>
					<h3>所有场地</h3>
				</div>
				<ul class="tree" id="alltype">
					<!-- <li><a href="">所有场地</a></li> -->
				</ul>
			</aside>

			<div class="col-sm-10 " id="space-list">
				<p class="apply-tip">
					申请须知：<br> 1.认证类型为班级，社团，教师，学院可申请普通教室;<br>
					2.认证类型为教师才能申请1实验室;<br> 3.认证类型为社团，学院才能申请综合楼；
				</p>
				
					
						<!-- 未登录 -->

						<div class="row">
								<c:forEach items="${buildings}" var="building">
								<div class="building-div">
									<a class="target-fix " id="b_${building.id}"></a>
									<span>${building.name}</span>
									<p>${building.describe}</p>

								</div>
								<div class="row">
									<c:forEach items="${building.spaces}" var="space">
										<div class="col-sm-4">
											<div class="panel panel-warning">
												<div class="panel-heading">
													<span class="bui-name">${space.name}</span>
														<!-- <span class="label label-success pull-right">可用</span> -->
												</div>
												<div class="panel-body">
													<p>
														<label>类型：</label>${space.describe}
													</p>
													<p>
														<label>容量：</label> ${space.vol}座位
													</p>
													<p>
														<shiro:guest>
															<input id="state" type="hidden" value="0"/>
														</shiro:guest>
														<shiro:user>
															<input  id="state" type="hidden" value="1"/>
														</shiro:user>
														<input type="hidden" value="${space.describe}" id="space_desc_${space.id}">
														<input type="hidden" value="${space.vol}" id="space_vol_${space.id}">
														<input type="hidden" value="${space.name}" id="space_name_${space.id}" >
														<input type="hidden" value="${building.type.id}" id="${space.id}">
														<a class="btn btn-sm btn-info nologin">申请该场地</a>
														&nbsp;&nbsp;<a class="btn btn-sm btn-warning weekUse"
															data-id="32">未来一周的使用情况</a>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

								</c:forEach>
							
						</div>


					

					
				
			</div>
		</div>
	</section>
	<br>

	<!-- 使用动态include指令导入底部版权栏 -->
	
<footer>
	<p>&copy; Copyright 2017&nbsp; 场地管理系统</p>
</footer>
<script>
	$(document).ready(function() {
		minHeight = $(window).height();
		$('#main').css("min-height", (minHeight-70) + "px");
	});
</script>

	<!-- 用户未登录提示框 -->
	<div class="modal fade" id="nologin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">温馨提示</h2>
				</div>
				<div class="modal-body">
					<h3>游客不能申请场地！ 请登录后再操作</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 表单弹出框 -->
	<div class="modal hidden " id="applyform" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">场地申请</h2>

				</div>
				<div class="modal-body">
					


<div id="form-div">
	<h2 class="form-title">场地申请表</h2>
	<p class="form-time" id="form-time"></p>
	<form method="post">
		<fieldset>
			<legend>申请者信息</legend>
			<p>
				<label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label> <span>
					</span>
			</p>

			<p>
				<label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label> <span></span>
			</p>
			<p>
				<label>认证类型：</label> <span id="form-auth-type"></span>
			</p>
		</fieldset>
		<fieldset>
			<legend>场地信息</legend>
			<p>
				<label>场地编号：</label> <span id="form-room-id"></span>
			</p>
			<p>
				<label>场地类型：</label> <span id="form-room-type"></span>
			</p>
			<p>
				<label>容&nbsp;&nbsp;&nbsp;&nbsp;量：</label> <span id="form-capacity"></span>
			</p>
		</fieldset>
		<fieldset>
			<legend>填写表单</legend>
			<input type="text" hidden="hidden" id="form-buiId" name="buiId"
				value=""> <input type="text" hidden="hidden"
				id="form-roomId" name="roomId" value="">
			<p>
				<label>借用时间：</label><br /> <input type="datetime-local"
					id="form-start-time" name="startTime"> TO <input
					type="datetime-local" id="form-end-time" name="endTime">
			</p>
			<p>
				<label>借用事由：</label>
				<textarea placeholder="借用事由" name="reason" id="form-reason"></textarea>
			</p>
		</fieldset>
		<p id="submite-btn">
			<a id="app-btn" href="javascript:void(0);"
				data-url="apply/applyForm">提交申请</a>
		</p>
	</form>
</div>
<script>
	$(document).ready(
			function() {
				$("#app-btn").click(
						function() {

							var url = $(this).data("url");
							var buiId = $("#form-buiId").val();
							var roomId = $("#form-roomId").val();
							var startTime = $("#form-start-time").val();
							var endTime = $("#form-end-time").val();
							var reason = $("#form-reason").val();

							if (url == "" || buiId == "" || roomId == ""
									|| startTime == "" || endTime == ""
									|| reason == "") {
								$("#apply-message").html('表单未填完整！')
								$('#applyMSG').modal();
								return false;
							}

							var start = new Date(startTime);

							var end = new Date(endTime);

							if (start > end) {
								$("#apply-message").html('开始时间不能大于结束时间！')
								$('#applyMSG').modal();
								return false;
							}
							var now = new Date();
							if (now > start) {
								$("#apply-message").html('开始时间不能小于当前时间！')
								$('#applyMSG').modal();
								return false;
							}

							$.post(url, {
								"buiId" : buiId,
								"roomId" : roomId,
								"startTime" : startTime,
								"endTime" : endTime,
								"reason" : reason,
							}, function(data) {
								if (data['form'] == "no") {
									$("#apply-message").html('表单未填完整！')
									$('#applyMSG').modal();
								} else if (data["login"] == "no") {
									$("#apply-message").html('未登录，游客不可以申请场地！')
									$('#applyMSG').modal();
								} else if (data["auth"] == "no") {
									$("#apply-message").html('您还未认证，不可以申请场地')
									$('#applyMSG').modal();
								} else if (data["status"] == "no") {
									$("#apply-message").html(
											'您的认证申请暂未通过审核，不可以申请场地')
									$('#applyMSG').modal();
								} else if (data["canapply"] == "no") {
									$("#apply-message").html('您的认证类型不可以申请该场地');
									$('#applyMSG').modal();
								} else if (data["startTime"] == "no") {
									$("#apply-message").html('开始时间不能小于当前时间！')
									$('#applyMSG').modal();
								} else if (data["room"] == "no") {
									$("#apply-message").html('该场地不存在！')
									$('#applyMSG').modal();
								} else if (data["existApps"] == "error") {
									$("#apply-message").html('服务器发生了一些错误！')
									$('#applyMSG').modal();
								} else if (data["existApps"] == "no") {
									$("#apply-message").html('时间段与其他申请存在冲突！')
									$('#applyMSG').modal();
								} else if (data["app"] == "no") {
									$("#apply-message").html('服务器发生错误！')
									$('#applyMSG').modal();
								} else if (data['app'] == "yes") {
									$("#apply-message").html('恭喜，申请提交成功！')
									$('#applyMSG').modal();

									$("#form-buiId").val('');
									$("#form-roomId").val('');
									$("#form-start-time").val('');
									$("#form-end-time").val('');
									$("#form-reason").val('');
								}
							});
						});
			});
</script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 申请场所时信息提示 -->
	<div class="modal fade" id="applyMSG" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">温馨提示</h2>
				</div>
				<div class="modal-body">
					<h3 id="apply-message"></h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 未来一周申请情况的提示框 -->
	<div class="modal fade" id="app-week" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">未来一周场地使用的申请情况</h2>
				</div>
				<div class="modal-body">
					<table class="table table-striped" id="app-week-list">
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	

	<script src="<%=request.getContextPath()%>/style/js/jquery.treemenu.js"></script>
</body>
<script>

    $(function () {
        $.ajax({
            url:"<%=request.getContextPath()%>/web/findBuildingTypes",
            dataType:"json",
            async:false,
            success:function (data) {
                for (var i = 0; i <data.length; i++) {
                    var html='<li><span>'+data[i].typename+'</span><ul>';
                    for (var j = 0; j <data[i].buildings.length ; j++) {
						html+="<li><a href=#b_"+data[i].buildings[j].id+">"+data[i].buildings[j].name+"</a></li>";
                    }
                    html+='</ul></li>';
                    $("#alltype").append(html);
                }
            }
        });
    });

	$(function() {
		$(".tree").treemenu({
			delay : 300
		}).openActive();

	});
</script>
<script>
	$(document).ready(
			function() {
				minHeight = $(window).height();
				$('#aside,#space-list').css("height", (minHeight - 70) + "px");

				$('.nologin').click(function() {
					var state = $("#state").val();
					if(state==0){
                        $('#nologin').modal();
					}else{
                        var typeid = $(this).prev().val();
                        var spaceid = $(this).prev().attr("id");
                        var vol=$("#space_vol_"+spaceid).val();
                        var spacename=$("#space_name_"+spaceid).val();
                        var spacetype=$("#space_desc_"+spaceid).val();
                        $.ajax({
	                        url:"<%=request.getContextPath()%>/web/validate",
	                        data:"typeid="+typeid,
                            success: function (data) {
                                if (data=="success"){
                                    $('#applyform').removeClass("hidden");//登录后加载
                                    $('#applyform').addClass("show");
                                    $('#form-room-id').html(spacename);
                                    $('#form-capacity').html(vol);
                                    $("#form-room-type").html(spacetype);

                                }else {
                                    alert("对不起你没有该权限");

                                }
                            },
	                        error:function () {
		                        alert("error")
                            }
                        });
					}

				});
				$('.applyform').click(
						function() {
							var obj = $(this);
							var canapplyurl = $(this).data('canapplyurl');
							var bid = $(this).data('bid');
							$.post(canapplyurl, {
								"canapplyurl" : canapplyurl,
								"bid" : bid,
							}, function(data) {

								if (data["logined"] == "no") {
									$('#nologin').modal();
								} else if (data["auth"] == "null") {
									$("#apply-message").html('您暂未认证，认证后才能申请场地');
									$('#applyMSG').modal();
								} else if (data["status"] == "no") {
									$("#apply-message").html(
											'您的认证申请暂未通过审核，不可以申请场地');
									$('#applyMSG').modal();
								} else if (data['canapply'] == "no") {
									$("#apply-message").html(
											'您的认证类型是：' + data['auth']
													+ ", 不可以申请该场地");
									$('#applyMSG').modal();
								} else if (data['canapply'] == "yes") {
									$('#form-auth-type').html(data['auth']);
									var buiName = obj.parent().parent().prev()
											.children('.bui-name').html();
									$("#form-room-id").html(buiName);
									var capacity = obj.parent().prev()
											.children('span').html();
									$('#form-capacity').html(capacity);
									var roomtype = obj.parent().prev().prev()
											.children('span').html();
									$('#form-room-type').html(roomtype);
									var now = nowtime();
									$("#form-time").html(now);
									var roomId = obj.data('roomid');
									$("#form-roomId").val(roomId);
									$("#form-buiId").val(bid);

									$('#applyform').modal();

								} else {

								}
							});

						});
				function nowtime() {//将当前时间转换成yyyymmdd格式
					var mydate = new Date();
					var str = "" + mydate.getFullYear();
					var mm = mydate.getMonth() + 1;
					if (mydate.getMonth() > 9) {
						str = str + "-" + mm + "-";
					} else {
						str = str + "-" + "0" + mm + "-";
					}
					if (mydate.getDate() > 9) {
						str += mydate.getDate();
					} else {
						str += "0" + mydate.getDate();
					}
					return str;
				}

				/* 查看未来一周的使用情况 */
				$(".weekUse").click(function() {
					var id = $(this).data("id");
					var url = "apply/weekUse/";
					$.post(url, {
						"id" : id
					}, function(data) {
						if(data['room']=="no"){
							
						}else if(data['apps']=="error"){
							
						}else{
							if(data['apps'].length == 0){
								$("#app-week-list").html("未来两周没有申请");
							}else{
								var tr = '<tr><th>序号</th><th>开始时间</th><th>结束时间</th></tr>';
			
								$.each(data['apps'],function(index,item){
								tr = tr +  '<tr><td>' + index + '</td><td>' 
									+ getMyDate(item['appStartTime']) + '</td><td>' + getMyDate(item['appEndTime']) + '</td></tr>';
								});
								$("#app-week-list").html(tr);
							}
							$("#app-week").modal();
						}
						
					});
				});
				
				/* 把后台传来的时间戳格式化 */
				//获得年月日      得到日期oTime  
		        function getMyDate(str){  
		            var oDate = new Date(str),  
		            oYear = oDate.getFullYear(),  
		            oMonth = oDate.getMonth()+1,  
		            oDay = oDate.getDate(),  
		            oHour = oDate.getHours(),  
		            oMin = oDate.getMinutes(),  
		            oSen = oDate.getSeconds(),  
		            oTime = oYear +'年'+ getzf(oMonth) +'月'+ getzf(oDay) +'日  '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
		            return oTime;  
		        };  
		        //补0操作  
		        function getzf(num){  
		            if(parseInt(num) < 10){  
		                num = '0'+num;  
		            }  
		            return num;  
		        }
			});



</script>

</html>