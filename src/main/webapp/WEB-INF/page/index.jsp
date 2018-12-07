<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



s
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

<link href="<%=request.getContextPath() %>/style/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/style/js/jquery.min.js"></script>
<script	src="<%=request.getContextPath() %>/style/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/style/js/index.js"></script>
<link href="<%=request.getContextPath() %>/style/css/base.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/style/css/index.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/style/css/animate.css">
<link href="<%=request.getContextPath() %>/style/css/jquery.toast.min.css" rel="stylesheet">
<!-- <link href="css/slide.css" rel="stylesheet" type="text/css" /> -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/style/css/slideshows.css" />
    <script src="<%=request.getContextPath() %>/style/js/jquery.cycle.all.js"></script>
    <script src="<%=request.getContextPath() %>/style/js/jquery.easing.1.3.js"></script>
</head>

    <script>
    $(function() {
        $('#slideshow_2').cycle({

            fx: 'fade',

            speed: 900,

            timeout: 3000,

            pager: '.ss2_wrapper .slideshow_paging',

            prev: '.ss2_wrapper .slideshow_prev',

            next: '.ss2_wrapper .slideshow_next',

            before: function(currSlideElement, nextSlideElement) {

                var data = $('.data', $(nextSlideElement)).html();

                $('.ss2_wrapper .slideshow_box').stop(true, true).animate({
                    bottom: '-110px'
                }, 400, function() {

                    $('.ss2_wrapper .slideshow_box .data').html(data);

                });

                $('.ss2_wrapper .slideshow_box').delay(100).animate({
                    bottom: '0'
                }, 400);

            }

        });

        $('.ss2_wrapper').mouseenter(function() {

            $('#slideshow_2').cycle('pause');

            $('.ss2_wrapper .slideshow_prev').stop(true, true).animate({
                left: '20px'
            }, 200);

            $('.ss2_wrapper .slideshow_next').stop(true, true).animate({
                right: '20px'
            }, 200);

        }).mouseleave(function() {

            $('#slideshow_2').cycle('resume');

            $('.ss2_wrapper .slideshow_prev').stop(true, true).animate({
                left: '-40px'
            }, 200);

            $('.ss2_wrapper .slideshow_next').stop(true, true).animate({
                right: '-40px'
            }, 200);

        });

        function pager_create(id, slide) {

            var thumb = $('.thumb', $(slide)).html();

            var title = $('h4 a', $(slide)).html();

            var add_first = (id == 0) ? ' class="first"' : '';

            return '<li><a href="#" title="' + title + '"' + add_first + '>' + thumb + '</a></li>';
        };
        $('a[href="#"]').click(function(event) {
            event.preventDefault(); // for this demo disable all links that point to "#"
        });
    });
    </script>

<body>
	<!-- 使用动态include指令导入头部 -->
	

	<jsp:include page="commons/webhead.jsp"/>
	<input type="hidden" id="tourl" value="index">
<!-- 消息提示 -->

<div id="main">

	<div class="container" >
		<div class="row ">
			<div class="col-xs-12 col-sm-9">
				<!-- 新的图片轮播 -->
				<div class="ss2_wrapper row animated jello" >
                    <a href="#" class="slideshow_prev"><span
								class="glyphicon glyphicon-chevron-left"></span></a>
                    <a href="#" class="slideshow_next"><span
								class="glyphicon glyphicon-chevron-right"></span></a>
                    <div class="slideshow_paging"></div>
                    <div class="slideshow_box">
                        <div class="data"></div>
                    </div>
                    <div id="slideshow_2" class="slideshow">
                        <div class="slideshow_item">
                            <div class="image">
                                <a href="#"><img src="<%=request.getContextPath() %>/style/images/c3f83903c51244499fc40a5b8ca8fd1a.jpg" height="400" /></a>
                            </div>
                            <div class="data">
                                <h4>活动预告</h4>
                                <p>即将开始的活动，快来参与！</p>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
				
				
				<!--往期活动-->
				<br>
				
				<span class="h2">往期活动回顾</span>
				<!-- 所有活动 -->
				<span class="pull-right "><a href="act/actList" class="view-all-act">更多》</a></span>
				<hr>
				

			</div>

			<div class="col-xs-12 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="applybtn">
					<a href="<%=request.getContextPath()%>/web/spacelist">申请场地 - 入口</a>
				</div>
				<div class="noticePane" >
						<h3 class="text-center">
						公告栏
						</h3>
						<div id="noticeList">
						
							<div class="panel panel-info animated zoomInRight">
								<div class="panel-heading">
									<h3 class="panel-title">测试公告</h3>
								</div>
								<div class="panel-body">
									测试公告
								</div>
							</div>
						
							<div class="panel panel-info animated zoomInRight">
								<div class="panel-heading">
									<h3 class="panel-title">最新公告</h3>
								</div>
								<div class="panel-body">
									最新公告
								</div>
							</div>
						
						</div>
						
				</div>
			</div>
		</div>
	</div>
	<br>
</div>
	
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

	
	<script src="<%=request.getContextPath()%>/style/js/jquery.toast.min.js"></script>
	
	<!-- 系统消息 -->
	
</body>
		<script>
			$(function() {

				/*小屏幕导航点击关闭菜单*/
				$('.navbar-collapse a').click(function() {
					$('.navbar-collapse').collapse('hide');
				});
				
				var message = $('#message').text();
				if(message != ''){
					$.toast({
					    heading: '系统消息',
					    text: message,
					    showHideTransition: 'fade',
					    icon: 'info'
					})
				}
				
				
				$("#moreNotice").click(function(){
					var url = $("#moreNotice").data('url');
					
					$.get(url,function(data,status){
						if(data == null){
							alert('没有更多通知了')
						}else{
							$.each( data, function(index, item){ 
								$('#noticeList').append(
									'<div class="panel panel-info animated zoomInRight">' +
										'<div class="panel-heading"><h3 class="panel-title">'+
										item['noticeTitle']+'</h3></div><div class="panel-body">'+
										item['noticeContent']+'</div>'
								);
						 	});
						}
						
					});
				});
				
			})
		</script>
</html>