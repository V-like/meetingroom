<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../page/common.jsp" %>
<body>
<%@ include file="../page/top.jsp" %>
<%--<div class="layui-body-header">
    <span class="layui-body-header-title">菜单管理</span>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table id="demo" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<div class="layui-row">
    <%@ include file="../page/nav.jsp" %>
    <div class="layui-col-md10 main-bg-color">
        <div class="layui-row block-bg-color block-border-top">
            <div class="layui-col-md12 block-padding-around">
					<span class="layui-breadcrumb"> <a href="/">首页</a> <a><cite>会议室管理</cite></a>
					</span>
            </div>
            <div class="layui-col-md12 block-padding-around">
                <h2 class="block-bot-left">会议室维护</h2>
                <div class="block-bot-right">
                    <button class="layui-btn layui-btn-sm layui-btn-normal">
                        <i class="layui-icon layui-icon-add-1"></i> 添加会议室
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-fluid">
            <div class="layui-row block-bg-color block-margin-both">
                <div class="layui-col-md12 block-padding-around">
                    <h3>会议室详情一览</h3>
                   <%-- <input type="text" style="float: right" value="搜索">--%>
                </div>
                <hr/>
                <div class="layui-col-md12 block-padding-around">
                    <table id="demo" lay-filter="test"></table>
                </div>
            </div>
        </div>
       <%-- <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-sm12 layui-col-md12 layui-col-lg12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <table id="demo" lay-filter="test"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: 330
            , url: '${pageContext.request.contextPath }/meet/findAll' //数据接口
            , page: true //开启分页
            //,toolbar: 'default'  //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                , {field: 'roomId', title: 'ID', width: 100, fixed: 'left'}
                , {field: 'roomName', title: '名称', width: 100}
                , {field: 'roomType', title: '类型', width: 100}
                , {field: 'personCount', title: '容纳人数', width: 80}
                , {field: 'roomAreaName', title: '地址', width: 80}
                , {field: 'callIp', title: '呼叫地址', width: 120}
                , {field: 'manager', title: '管理员', width: 80}
                , {field: 'isStart', title: '是否启用', width: 80}
                , {fixed: 'right',title: '操作', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
            , done: function (res, curr, count) {
                $("[data-field='isStart']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text("启用")
                    } else if ($(this).text() == '0') {
                        $(this).text("禁用")
                    }
                });
            }
        });
    });
</script>
</body>
</html>