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
    <link href="${pageContext.request.contextPath }/packages/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/packages/fullcalendar/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/packages/fullcalendar/fullcalendar.print.min.css" rel="stylesheet" media="print">
    <link href="${pageContext.request.contextPath }/packages/jquery-ui/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/packages/bootstrap/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/packages/fullcalendar/jquery-ui.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/packages/artDialog/ui-dialog.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/packages/wickedpicker/wickedpicker.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/packages/jquery-ui/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath }/packages/fullcalendar/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/fullcalendar/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/fullcalendar/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/fullcalendar/fullcalendar.js"></script>
    <script src="${pageContext.request.contextPath }/packages/jquery-ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/artDialog/dialog-min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/wickedpicker/wickedpicker.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/bootstrap/bootstrap-datepicker.min.js"></script>
    <script src="${pageContext.request.contextPath }/packages/bootstrap/bootstrap-datepicker.zh-CN.min.js"></script>
</head>
<body class="sidebar-fixed header-fixed" id="body">
<div class="content">
    <div class="container-fluid">
        <div id="calendar" >
        </div>
    </div>
</div>

</body>
</html>
<style>
    body{
        margin:40px 10px;
        padding:0;
        background:white;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }
    #calendar{
        width:900px;
        margin-top:100px;
        float: right;
    }
    .taxt{
        width:340px;
    }
    .time{
        width:100px;
    }
    .sear{
        width:85px;
    }
    .select{
        width:150px;
    }
    .textarea{
        width:300px;
    }
    .check{
        padding:8px;
    }
    .slidertext{
        padding-top:40px;
    }
    .timepicki{
        position:relative;
        z-index: 999;
    }
    #edit{
        position:relative;
        width:300px;
    }
    #edittitle{
        padding-bottom:10px;
        font-weight: bold;
        font-size: 18px;
    }
    #edittype{
        position:absolute;
        top:5px;
        right:5px;
        width:80px;
    }
</style>
<script>
    $(function(){
        $("#calendar").fullCalendar({
            theme: true,
            customButtons:{
                button1:{
                    text:"新建",
                    click:function(){
                        $(".datepicker").datepicker({
                            language:"zh-CN",
                            format:"yyyy-mm-dd",
                            todayHighlight:true,
                            autoclose:true,
                            weekStart:0
                        });
                        $(".timepicki").wickedpicker({
                            title:'',
                            showSeconds:true,
                            twentyFour:true
                        });
                        $("#isallday").click(function(){
                            if($("#isallday").prop("checked") == true){
                                $("#isallday").val("1");
                                $("#starttime,#endtime").hide();
                            }else{
                                $("#isallday").val("0");
                                $("#starttime,#endtime").show();
                            };
                        });
                        $("#end").click(function(){
                            if($("#end").prop("checked") == true){
                                $("#enddate").show();
                            }else{
                                $("#enddate").hide();
                            };
                        });
                        $("#repeat").click(function(){
                            if($("#repeat").prop("checked") == true){
                                $("#repeattype,#repeattime").show();
                            }else{
                                $("#repeattype,#repeattime").hide();
                            };
                        });
                        $("#repeatselect").change(function(){
                            switch($("#repeatselect").val()){
                                case "1":
                                    $("#repeatclock").show();
                                    $("#repeatmonth,#repeatweek,#repeatday").hide();
                                    break;
                                case "2":
                                    $("#repeatmonth,#repeatday").hide();
                                    $("#repeatweek,#repeatclock").show();
                                    break;
                                case "3":
                                    $("#repeatmonth,#repeatweek").hide();
                                    $("#repeatday,#repeatclock").show();
                                    break;
                                case "4":
                                    $("#repeatweek").hide();
                                    $("#repeatmonth,#repeatday,#repeatclock").show();
                                    break;
                                case "5":
                                    $("#repeatclock").show();
                                    $("#repeatmonth,#repeatweek,#repeatday").hide();
                                    break;
                            }
                        });
                        dialog({
                            title:"新建日程",
                            content:$("#dialog-form"),
                            okValue:"确定",
                            ok:function(){
                                var titledetail = $("#titledetail").val();
                                var startdate = $("#startdate").val();
                                var starttime = $("#starttime").val().split(" ").join("");
                                var enddate = $("#stopdate").val();
                                var endtime = $("#endtime").val().split(" ").join("");
                                var allDay = $("#isallday").val();
                                if(titledetail){
                                    $.ajax({
                                        url:'http://localhost/fullcalendar/detail.php',
                                        data:{title:titledetail,sdate:startdate,stime:starttime,edate:enddate,etime:endtime,allDay:allDay},
                                        type:'POST',
                                        dataType:'json',
                                        success:function(data){
                                            $("#calendar").fullCalendar("renderEvent",data,true);
                                        },
                                        error:function(){
                                            alert("Failed");
                                        }

                                    });
                                };
                            },
                            cancelValue:"关闭",
                            cancel:function(){
                                //$("#ui-datepicker-div").remove();
                            }
                        }).showModal();
                    }
                },
                button2:{
                    text:"查询",
                    click:function(){
                        $(".datepicker").datepicker({
                            language:"zh-CN",
                            format:"yyyy-mm-dd",
                            todayHighlight:true,
                            autoclose:true,
                            weekStart:0
                        });
                        dialog({
                            title:"查询",
                            content:$("#search"),
                            okValue:"查询",
                            ok:function(){
                                $("#ui-datepicker-div").remove();
                            },
                            button:[{
                                value:"打印"
                            }],
                            cancelValue:"返回",
                            cancel:function(){
                                $("#ui-datepicker-div").remove();
                            }
                        }).showModal();

                    }
                },
                button3:{
                    text:"设置",
                    click:function(){
                        $("#slider").slider({
                            range:true,
                            min:0,
                            max:24,
                            values:[8,18],
                            slide: function( event, ui ) {
                                $( "#amount" ).val(ui.values[ 0 ] + ":00 - " + ui.values[ 1 ]+":00");

                            }
                        });
                        $( "#amount" ).val($( "#slider" ).slider( "values", 0 ) +
                            ":00 - " + $( "#slider" ).slider( "values", 1 )+":00");
                        dialog({
                            title:"设置时间段",
                            content:$("#set"),
                            okValue:"确定",
                            ok:function(){
                                var minTime = $( "#slider" ).slider( "values", 0 )+":00:00";
                                var maxTime = $( "#slider" ).slider( "values", 1 )+":00:00";
                                $("#calendar").fullCalendar("option","minTime",minTime);
                                $("#calendar").fullCalendar("option","maxTime",maxTime);
                            },
                            cancelValue:"关闭",
                            cancel:function(){}
                        }).showModal();
                    }
                }
            },
            header: {
                left: 'prev,next today button3',
                center: 'title',
                right: 'button1 button2 month,agendaWeek,agendaDay,listMonth'
            },
            firstDay: 1,
            monthNames: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
            monthNamesShort: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
            dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
            dayNamesShort:["日","一","二","三","四","五","六"],
            buttonText:{
                today: "今天",
                month: "月",
                week: "周",
                day: "天",
                listMonth:"列表"
            },
            allDayDefault:false,
            slotLabelFormat:"H",
            businessHours: {
                dow:[1,2,3,4,5],
                start:"8:00",
                end:"17:00"
            },
            allDaySlot: true,
            allDayText: "全天",
            timeFormat: "HH:mm",//设置的是添加的具体的日程上显示的时间
            views:{
                month:{
                    titleFormat:"YYYY年M月"
                },
                week:{
                    titleFormat:"YYYY年M月D日",
                    columnFormat:"M.D dddd"
                },
                day:{
                    titleFormat:"YYYY年M月D日 dddd",
                    columnFormat:"M/D dddd"
                }
            },
            dayClick: function(date,allDay,jsEvent,view){
                var selDate = $.fullCalendar.formatDate(date,"YYYY-MM-DD");
                var d = dialog({
                    title:"新建事件",
                    content:"<textarea rows=5 class='taxt' placeholder='内容' id='eventall'></textarea><p>"+selDate+"</p>",
                    width:460,
                    button:[{
                        value:"完整编辑",
                        callback:function(){
                            $(".datepicker").datepicker({
                                language:"zh-CN",
                                format:"yyyy-mm-dd",
                                todayHighlight:true,
                                autoclose:true,
                                weekStart:0
                            });
                            $(".timepicki").wickedpicker({
                                title:'',
                                showSeconds:true,
                                twentyFour:true
                            });
                            $("#isallday").click(function(){
                                if($("#isallday").prop("checked") == true){
                                    $("#isallday").val("1");
                                    $("#starttime,#endtime").hide();
                                }else{
                                    $("#isallday").val("0");
                                    $("#starttime,#endtime").show();
                                };
                            });
                            $("#end").click(function(){
                                if($("#end").prop("checked") == true){
                                    $("#enddate").show();
                                }else{
                                    $("#enddate").hide();
                                };
                            });
                            $("#repeat").click(function(){
                                if($("#repeat").prop("checked") == true){
                                    $("#repeattype,#repeattime").show();
                                }else{
                                    $("#repeattype,#repeattime").hide();
                                };
                            });
                            $("#repeatselect").change(function(){
                                switch($("#repeatselect").val()){
                                    case "1":
                                        $("#repeatclock").show();
                                        $("#repeatmonth,#repeatweek,#repeatday").hide();
                                        break;
                                    case "2":
                                        $("#repeatmonth,#repeatday").hide();
                                        $("#repeatweek,#repeatclock").show();
                                        break;
                                    case "3":
                                        $("#repeatmonth,#repeatweek").hide();
                                        $("#repeatday,#repeatclock").show();
                                        break;
                                    case "4":
                                        $("#repeatweek").hide();
                                        $("#repeatmonth,#repeatday,#repeatclock").show();
                                        break;
                                    case "5":
                                        $("#repeatclock").show();
                                        $("#repeatmonth,#repeatweek,#repeatday").hide();
                                        break;
                                }
                            });
                            dialog({
                                title:"新建日程",
                                content:$("#dialog-form"),
                                okValue:"确定",
                                ok:function(){
                                    var titledetail = $("#titledetail").val();
                                    var startdate = $("#startdate").val();
                                    var starttime = $("#starttime").val().split(" ").join("");
                                    var enddate = $("#stopdate").val();
                                    var endtime = $("#endtime").val().split(" ").join("");
                                    var allDay = $("#isallday").val();
                                    if(titledetail){
                                        $.ajax({
                                            url:'http://localhost/fullcalendar/detail.php',
                                            data:{title:titledetail,sdate:startdate,stime:starttime,edate:enddate,etime:endtime,allDay:allDay},
                                            type:'POST',
                                            dataType:'json',
                                            success:function(data){
                                                $("#calendar").fullCalendar("renderEvent",data,true);
                                            },
                                            error:function(){
                                                alert("Failed");
                                            }

                                        });
                                    };
                                },
                                cancelValue:"关闭",
                                cancel:function(){}
                            }).showModal();
                        },
                    }],
                    okValue:"确定",
                    ok:function(){
                        var titleall = $("#eventall").val();
                        if(titleall){
                            $.ajax({
                                url:'http://localhost/fullcalendar/events.php',
                                data:{title:titleall, start:selDate},
                                type:'POST',
                                dataType:'json',
                                success:function(data){
                                    $("#calendar").fullCalendar("renderEvent",data,true);
                                },
                                error:function(){
                                    alert("Failed");
                                }

                            });
                        };
                    },
                    cancelValue:"取消",
                    cancel:function(){}
                });
                d.showModal();

            },
            eventClick:function(event,jsEvent,view){
                var editstarttime = $.fullCalendar.formatDate(event.start,"YYYY-MM-DD HH:mm:ss");
                $("#edittitle").html(event.title);
                var eventtitle = event.title;
                if(event.end){
                    var editendtime = $.fullCalendar.formatDate(event.end,"YYYY-MM-DD HH:mm:ss");
                    $("#edittime").html(editstarttime+"  至  "+editendtime);
                }else{
                    $("#edittime").html(editstarttime);
                };
                // var time = '19:00:00';
                dialog({
                    title:"编辑日程",
                    content:$("#edit"),
                    okValue:"编辑",
                    ok:function(){
                        $(".datepicker").datepicker({
                            language:"zh-CN",
                            format:"yyyy-mm-dd",
                            todayHighlight:true,
                            autoclose:true,
                            weekStart:0
                        });
                        $(".timepicki").wickedpicker({
                            // now: time,
                            title:'',
                            showSeconds:true,
                            twentyFour:true
                        });
                        $("#isallday").click(function(){
                            if($("#isallday").prop("checked") == true){
                                $("#isallday").val("1");
                                $("#starttime,#endtime").hide();
                            }else{
                                $("#isallday").val("0");
                                $("#starttime,#endtime").show();
                            };
                        });
                        $("#end").click(function(){
                            if($("#end").prop("checked") == true){
                                $("#enddate").show();
                            }else{
                                $("#enddate").hide();
                            };
                        });
                        $("#repeat").click(function(){
                            if($("#repeat").prop("checked") == true){
                                $("#repeattype,#repeattime").show();
                            }else{
                                $("#repeattype,#repeattime").hide();
                            };
                        });
                        $("#repeatselect").change(function(){
                            switch($("#repeatselect").val()){
                                case "1":
                                    $("#repeatclock").show();
                                    $("#repeatmonth,#repeatweek,#repeatday").hide();
                                    break;
                                case "2":
                                    $("#repeatmonth,#repeatday").hide();
                                    $("#repeatweek,#repeatclock").show();
                                    break;
                                case "3":
                                    $("#repeatmonth,#repeatweek").hide();
                                    $("#repeatday,#repeatclock").show();
                                    break;
                                case "4":
                                    $("#repeatweek").hide();
                                    $("#repeatmonth,#repeatday,#repeatclock").show();
                                    break;
                                case "5":
                                    $("#repeatclock").show();
                                    $("#repeatmonth,#repeatweek,#repeatday").hide();
                                    break;
                            }
                        });
                        dialog({
                            title:"新建日程",
                            content:$("#dialog-form"),
                            okValue:"确定",
                            ok:function(){
                                var titledetail = $("#titledetail").val();
                                var startdate = $("#startdate").val();
                                var starttime = $("#starttime").val().split(" ").join("");
                                var enddate = $("#stopdate").val();
                                var endtime = $("#endtime").val().split(" ").join("");
                                var allDay = $("#isallday").val();
                                if(titledetail){
                                    $.ajax({
                                        url:'http://localhost/fullcalendar/detail.php',
                                        data:{title:titledetail,sdate:startdate,stime:starttime,edate:enddate,etime:endtime,allDay:allDay},
                                        type:'POST',
                                        dataType:'json',
                                        success:function(data){
                                            $("#calendar").fullCalendar("renderEvent",data,true);
                                        },
                                        error:function(){
                                            alert("Failed");
                                        }

                                    });
                                };
                            },
                            cancelValue:"关闭",
                            cancel:function(){
                                //$("#ui-datepicker-div").remove();
                            }
                        }).showModal();
                        $("#calendar").fullCalendar("removeEvents",function(event){
                            if(event.title==eventtitle){
                                return true;
                            }else{
                                return false;
                            }
                        });
                    },
                    button:[{
                        value:"删除",
                        callback:function(){
                            $("#calendar").fullCalendar("removeEvents",function(event){
                                if(event.title==eventtitle){
                                    return true;
                                }else{
                                    return false;
                                }
                            });
                        }
                    }],
                    cancelValue:"取消",
                    cancel:function(){}
                }).showModal();
            }

        });
    });
</script>