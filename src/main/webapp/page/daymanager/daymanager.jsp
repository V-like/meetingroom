<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet" href=""/>
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
<body class="sidebar-fixed header-fixed" id="body">
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <h1 style="font-size: 24px; margin: 0;" class="">日程管理</h1>
            </div>
            <div class="form-group">
                <input id="date" type="date" class="form-control" value="2019-05-1">
            </div>
        </div>
        <div class="row" style="padding-top: 15px;">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-body">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>

        <div id="myModal">
            <div>
                <div>
                    <form>
                        <table class="table table-bordered">
                            <tr class="active">
                                <th class="active text-center" style="width: 20px">
                                    <input type="checkbox" id="firstCb"/>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">08</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">09</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">10</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">11</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">12</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">13</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">14</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">15</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">16</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">17</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                                <th style="width: 100px;border: 1px solid #0c87eb">
                                    <div style="margin: 0px">18</div>
                                    <table style="margin: 0px">
                                        <span style="border: 1px solid #af8c38;margin-left: 0px">00</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">15</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">30</span>
                                        <span style="border: 1px solid #af8c38;margin: 0px">45</span>
                                    </table>
                                </th>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(".modelokclose").click(function () {
        $('#myModal').modal('hide');
    });

    $(document).ready(function () {

        var date = new Date();

        var d = date.getDate();

        var m = date.getMonth();

        var y = date.getFullYear();

        $('#calendar').fullCalendar({
            buttonText: {
                today: '今天',
                month: '月',
                week: '周',
                day: '天'
            },
            allDayText: '全天',
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
            dayNames: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
            dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay'
            },

            /* dayClick: function(date, allDay, jsEvent, view) {
                $('#myModal').modal('show');
            }, */

            eventClick: function (event) {
                var title = event.title;
                var starttime = dateformat(event.start);
                var endtime = dateformat(event.end);
                var username = event.user;
                var des = event.des;
                var typeid = event.rctype;
                console.log(typeid);
                var typename;
                if (typeid == '44') {
                    typename = '日程提醒';
                } else if (typeid == '45') {
                    typename = '假日安排';
                }

                $('#myModal .rctitle').html(title);
                $('#myModal .rcusername').html(username);
                $('#myModal .rctype').html(typename);
                $('#myModal .rcstarttime').html(starttime);
                $('#myModal .rcendtime').html(endtime);
                $('#myModal .rcdescription').html(des);

                $('#myModal').modal('show');
                console.log(event.id);
            },

            editable: false,

            /* events: [{

                title: 'Long Event',

                start: new Date(y, m, d - 5),

                backgroundColor: 'red',

                borderColor: 'red',

                end: new Date(y, m, d - 2)

            }, ]  */

            events: function (start, end, callback) {
                $.ajax({
                    url: "mycalendarload",
                    cache: false,
                    datatype: 'json',

                    success: function (data) {
                        var events = [];
                        $.each(data, function (i, item) {
                            console.log(item);
                            var color;
                            var starttime = dateformat(new Date(item.startTime));
                            var endtime = dateformat(new Date(item.endTime));
                            if (item.statusId == '27') {
                                color = "#00c0ef";
                            }
                            if (item.statusId == '28') {
                                color = "#f0ad4e";
                            }
                            if (item.statusId == '29') {
                                color = "#dd4b39";
                            }
                            events.push({
                                title: item.title,

                                start: starttime,

                                backgroundColor: color,

                                borderColor: color,

                                end: endtime,

                                id: item.rcId,

                                user: item.username,

                                des: item.describe,

                                rctype: item.typeId
                            });
                        });
                        callback(events);
                    }
                })

            },

        });
    });
    var dateformat = function (a) {
        return a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate() + " " + a.getHours() + ":" + a.getMinutes() + ":" + a.getSeconds();
    };
</script>
</div>
</div>
</body>
</html>
