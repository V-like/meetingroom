<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp"%>
<body style="background-color: #393D49">
	<div class="layui-row" style="background-color: #fff;">
		<div class="layui-col-md2" style="text-align: center; font-size: 20px; padding: 20px 0 20px 0; background-color: #393D49; color: #fff">会议管理系统</div>
		<div class="layui-col-md10" style="padding: 2px 0 0 0">
			<ul class="layui-nav">
				<li class="layui-nav-item" style="float: right;"><a href="javascript:;" style="color: #000"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">修改信息</a>
						</dd>
						<dd>
							<a href="javascript:;">安全管理</a>
						</dd>
						<dd>
							<a href="javascript:;">退了</a>
						</dd>
					</dl></li>
			</ul>
		</div>
	</div>
	<div class="layui-row">
		<div class="layui-col-md2">
			<ul class="layui-nav layui-nav-tree" style="width: 100%">
				<li class="layui-nav-item"><a href="javascript:;">我的会议</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">会议室预定</a>
						</dd>
						<dd>
							<a href="">后台模版</a>
						</dd>
						<dd>
							<a href="">电商平台</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item layui-this"><a href="">产品</a></li>
				<li class="layui-nav-item"><a href="">大数据</a></li>
				<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
					<dl class="layui-nav-child">
						<!-- 二级菜单 -->
						<dd>
							<a href="">移动模块</a>
						</dd>
						<dd>
							<a href="">后台模版</a>
						</dd>
						<dd>
							<a href="">电商平台</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">社区</a></li>
			</ul>
		</div>
		<div class="layui-col-md10" style="background-color: #C0C0C0">
			<iframe width="100%" id="iframe" name="iframe" frameborder="no" border="0" src="${pageContext.request.contextPath }/meetroom/remeetroom"></iframe>
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