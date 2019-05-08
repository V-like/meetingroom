<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/chart.js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/carbon.js"></script>
    <script src="${pageContext.request.contextPath }/js/demo.js"></script>


</head>
<body class="sidebar-fixed header-fixed">
<div class="content">
    <div class="container-fluid">
        <div class="card-header bg-light">
           <div class="text-left">
               <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                   href="#">会议室管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室维护</a>

              <%-- <button class="btn btn-primary" style="float: right;margin-right: 10px" id="delSelected">删除选中</button>--%>
               <a href="${pageContext.request.contextPath }/page/meet_management/meet_manager_add.jsp"
               class="btn btn-primary" style="float: right;margin-right: 10px">添加会议室</a>
           </div>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath }/meet/findAll" method="post">
                        <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索" name="roomName" value="${roomName}">
                        <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>
                    </form>
                    <form method="post" action="${pageContext.request.contextPath}/meet/deletes">
                       <%-- <a class="btn btn-primary" href="javascript:void(0);" id="delSelected" style="width: 100px;float: right;margin: 5px">删除选中</a>
                        <a href="${pageContext.request.contextPath }/page/meet_management/meet_manager_add.jsp"
                        class="btn btn-primary" style="width: 100px;float: right;margin: 5px">添加会议室</a>--%>
                       <%-- <button class="btn btn-primary" id="delSelected">删除选中</button>--%>
                         <%-- <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索">
                          <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>--%>
                        <table class="table table-bordered" id="meetRoomList">
                            <tr class="active">
                                <th class="active text-center" style="width: 50px">
                                    <input type="checkbox" id="firstCb"/>
                                </th>
                                <th class="text-center">名称</th>
                                <th class="text-center">类型</th>
                                <th class="text-center">容纳人数</th>
                                <th class="text-center">地址</th>
                                <th class="text-center">呼叫地址</th>
                                <th class="text-center">管理员</th>
                                <th class="text-center">是否启用</th>
                                <th class="text-center">操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="list">
                                <tr class="active">
                                    <td class="active text-center" style="width: 50px">
                                        <input type="checkbox" name="roomId" value="${list.roomId}"/>
                                    </td>
                                    <td class="text-center">${list.roomName}</td>
                                    <td class="text-center">${list.roomType}</td>
                                    <td class="text-center">${list.personCount}</td>
                                    <td class="text-center">${list.roomAreaName}</td>
                                    <td class="text-center">${list.callIp}</td>
                                    <td class="text-center">${list.manager}</td>
                                        <%-- <td class="text-center">${list.isStart}</td>--%>
                                    <c:if test="${list.isStart == '1'}">
                                        <td class="text-center">启用</td>
                                    </c:if>

                                    <c:if test="${list.isStart == '0'}">
                                        <td class="text-center">禁用</td>
                                    </c:if>
                                    <!--<td>xx</td>-->
                                    <td class="text-center">
                                        <form class="navbar-form">
                                            <a href="${pageContext.request.contextPath}/meet/findOne?roomId=${list.roomId}"
                                               class="btn btn-default">修改</a>
                                            <%--不能写成调方法--%>
                                            <a href="${pageContext.request.contextPath}/meet/delete?roomId=${list.roomId}"
                                               class="btn btn-danger">删除</a>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </form>
                    <%--分页查询--%>
                    <div class="form-group form-inline">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                        </div>&nbsp;&nbsp;
                        <ul class="pagination ">
                            <li>
                                <a href="${pageContext.request.contextPath}/meet/findAll?page=1&size=${pageInfo.pageSize}"
                                   aria-label="Previous">首页</a>
                                <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                            </li>
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                </li>
                            </c:if>

                            <li>
                                <a href="${pageContext.request.contextPath}/meet/findAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                   aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function deleteRoom(id) {
        //alert(1);
        //用户安全提示
        if (confirm("您确定要删除吗？")) {
            //访问路径
            location.href = "${pageContext.request.contextPath}/meet/delete?roomId=" + id;
        }
    }

    window.onload = function () {
        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").onclick = function () {
            if (confirm("您确定要删除选中条目吗？")) {

                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("roomId");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        //alert(cbs[i]);
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if (flag) {//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                }
            }
        };
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function () {
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("roomId");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;
            }
        };

    }
</script>
<%--页面刷新停留在原来的位置--%>
<%--<script type="text/javascript">
    $(function () {
        window.scrollTo(0, $("#hdnvalue").val());

        $("#rdoBusinessDriver,#rdoDangerPrac,#ddlPracTypeSmallCatelog").click(function () {
            $("#hdnvalue").val(document.documentElement.scrollTop);
        });
    });
</script>--%>
</html>
