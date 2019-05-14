<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp"%>
<body>
	<%@ include file="../page/top.jsp"%>
	<div class="layui-row">
		<%@ include file="../page/nav.jsp"%>
		<div class="layui-col-md10 main-bg-color">
			<div class="layui-row block-bg-color block-border-top">
				<div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>我的会议</cite></a>
					</span>
				</div>
				<div class="layui-col-md12 block-padding-around">
					<h2 class="block-bot-left">会议室预定</h2>
					<div class="block-bot-right">
						<button class="layui-btn layui-btn-sm layui-btn-normal">
							<i class="layui-icon layui-icon-add-1"></i> 添加
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;

			//…
		});
	</script>
</body>
</html>