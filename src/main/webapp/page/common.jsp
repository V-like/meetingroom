<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
<title>会议管理系统</title>
</head>
<style type="text/css">
body {
	background-color: #393D49
}

.main-bg-color {
	background-color: #C0C0C0
}

.block-bg-color {
	background-color: #fff
}

.block-margin-top {
	margin: 5px 0 0 0
}

.block-margin-both {
	margin: 12px 0 12px 0
}

.block-margin-both-15 {
	margin: 17px 0 15px 0
}

.block-border-top {
	border-top: 1px solid grey
}

.block-padding-around {
	padding: 7px 12px 7px 12px
}

.block-bot-left {
	float: left
}

.block-bot-right {
	float: right
}
</style>
<script>
	$(function() {
		layui.use([ 'element' ], function() {
			var element = layui.element;
		});
		var url = window.location.pathname;
		var ths = $("[href='${pageContext.request.contextPath}"
				+ url
				+ "']:not([href='${config.rootPath}/message/list']),[data-set*='"
				+ url + "']");
		ths.addClass("layui-this");
		ths.parents(".layui-nav-item").addClass("layui-nav-itemed");
	});

	//浏览器后退时刷新页面
	$(document).ready(function() {
		if (window.history && window.history.pushState) {
			$(window).on('popstate', function() {
				window.history.pushState('forward', null, '');
				window.history.forward(1);
				location.replace(document.referrer);//刷新
			});
		}
		window.history.pushState('forward', null, ''); //在IE中必须得有这两行  
		window.history.forward(1);
	});
</script>