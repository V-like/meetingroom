import com.alibaba.fastjson.JSONObject;
import com.bcsd.controller.MeetUserController;
import com.bcsd.dao.*;
import com.bcsd.entity.*;
import com.bcsd.service.*;
import com.sun.jmx.snmp.tasks.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-application.xml")
public class MyTest {

    @Autowired
    private MeetRoomService meetRoomService;

    @Autowired
    private MeetUserDao meetUserDao;

    @Autowired
    private ReMeetRoomDao remeetRoom;
    @Autowired
    private AppointmentMeetDao appointmentMeetDao;

    @Autowired
    private MeetDeptDao meetDeptDao;

    @Autowired
    private AppointmentMeetService appointmentMeetService;
    @Autowired
    private MeetUserService meetUserService;

    @Autowired
    private MeetUserController meetUserController;


    @Test
    public void Method(){
        List<HistoryMeet> list = appointmentMeetDao.findPageHistory(1,"12");
        System.out.println(list);
        //System.out.println(list.get(0));
        //Object roomname = list.get(0).get("meetroom");

        //System.out.println(roomname);
    }

    @Test
    public void Method1(){
        List<UserInternal> list = meetUserDao.findInternal( null, null);
        System.out.println(list);
    }

    @Test
    public void Method2(){
       // List<User> list = appointmentMeetDao.findHistoryUser(3);
//        List<User> list = appointmentMeetService.findHistoryUser(1,10,2);
//        System.out.println(list);
        UserInternal user = meetUserService.findOne(1);
        System.out.println(user);
    }

    @Test
    public void Method3(){
//        List<Remeet> list = appointmentMeetService.findPage(1, 10, "1");
//        System.out.println(list);
//        List<MeetRoom> list = meetRoomService.findAll(1, 5, "1M");
//        System.out.println(list);
//        List<MeetDept> list = meetDeptDao.findAll("人事");
//        System.out.println(list);
        List<MeetUser> list = meetUserService.findAll(1, 5, "a");
        System.out.println(list);
    }

    @Test
    public void Method4(){
        List<MeetRoom> roomName = meetRoomService.findRoomName("c5539aa3-af34-463d-9415-1a7f8ae42727", "YMTC-OS1", "5");
        System.out.println(roomName);
    }


    @Test
    public void Method5(){
        Remeet remeet = appointmentMeetService.findOne(6);
        System.out.println(remeet.getMeetDate());
        //处理时间
        String[] split = remeet.getMeetDate().split(" ");
        System.out.println(split[0]+"  "+split[1]);
    }

    @Autowired
    private ReMeetRoomService reMeetRoomService;

    @Test
    public void Method6(){
        String result = JSONObject.toJSONString(reMeetRoomService.findArea());
        System.out.println(result);
    }
    @Test
    public void Method7(){
        String result = JSONObject.toJSONString(reMeetRoomService.updateMeetRoom("0acdf108-9512-4527-b7cb-40b005d39a35","45#","3","00585598-6019-4C51-A881-A050CEBCF6CB"));
        System.out.println(result);
    }
    @Test
    public void Method8(){
        String []arr = {"星期日","星期一","星期二","星期三","星期四","星期五","星期六"};
        Calendar calendar = Calendar.getInstance();
        System.out.println("今天是："+arr[calendar.get(Calendar.DAY_OF_WEEK)-1]);
        //1.数组下标从0开始；2.老外的第一天是从星期日开始的
        System.out.println(calendar.get(Calendar.DAY_OF_WEEK)-1);
    }

    @Test
    public void Method9(){
//获取每个工作日
        List<Date> workDates = getWorkDates(2019, 6);

        //System.out.println(workDates.get(0));
        for (Date workDate : workDates) {
            String[] s = workDate.toString().split(" ");
            System.out.println(s[2]);
        }
    }
    @Autowired
    private TaskMeetingService taskMeetingService;
    @Test
    public void Method10(){
        List<RepeatMeeting> list = taskMeetingService.findMeeting(1,"每日");
        System.out.println(list);
    }

    public static List<Date> getWorkDates(int year, int month) {
                 List<Date> dates = new ArrayList<Date>();
                 Calendar cal = Calendar.getInstance();
                 cal.set(Calendar.YEAR, year);
                 cal.set(Calendar.MONTH, month - 1);
                cal.set(Calendar.DATE, 1);
                while (cal.get(Calendar.YEAR) == year &&
                                 cal.get(Calendar.MONTH) < month) {
                         int day = cal.get(Calendar.DAY_OF_WEEK);

                        if (!(day == Calendar.SUNDAY || day == Calendar.SATURDAY)) {
                                dates.add((Date) cal.getTime().clone());
                             }
                        cal.add(Calendar.DATE, 1);
                     }
                 return dates;
            }


    @Test
    public void Method11(){
        Integer status = 1;
        String repeatType="每日";
        //List<Remeet> list = appointmentMeetService.findMeeting(state ,repeatType);
        List<RepeatMeeting> list = taskMeetingService.findMeeting(status, repeatType);
        System.out.println(list);
    }

    @Test
    public void Method12() throws ParseException {
        Date date = new Date();

//        String date1 = "2018-08-21 10:20:16";
//        Date date3 = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String s = dateFormat.format(date);
        System.out.println(s);
        String[] split = s.split("-");

        //System.out.println(split[1]);
        //当前月工作日
        List<Date> workDates = getWorkDates(Integer.parseInt(split[0]), Integer.parseInt(split[1]));
        List workDay =new ArrayList();
        for (Date workDate : workDates) {
            String format = dateFormat.format(workDate);
            workDay.add(format);
        }
        boolean contains = workDay.contains(s);
        System.out.println(contains);
    }

    @Autowired
    private AddUserService addUserService;


    @Test
    public void Method13() throws ParseException {
        //查询状态为 1 且重复类型为 "每日"  的会议
        Integer status = 1;
        String repeatType="everydays";
        //List<Remeet> list = appointmentMeetService.findMeeting(state ,repeatType);
        //获取重复会议开始时间及结束时间  获取开会时刻
        List<RepeatMeeting> list = taskMeetingService.findMeeting(status, repeatType);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前时间
        Date date = new Date();
        String s = sf.format(date);
        //获取当月工作日
        String[] split = s.split("-");
        List<Date> workDates = getWorkDates(Integer.parseInt(split[0]), Integer.parseInt(split[1]));
        List workDay =new ArrayList();//当前工作日集合
        for (Date workDate : workDates) {
            String format = sf.format(workDate);
            workDay.add(format);
        }
        //处理所有循环会议
        for (RepeatMeeting repeatMeeting : list) {
            //解析开始时间
            Date createTime = sf.parse(repeatMeeting.getCreateTime());

            //结束时间
            Date endTime = sf.parse(repeatMeeting.getEndTime());
            //当前时间大于开始时间   &&   当前时间 小于结束时间   && 当前时间为工作日
            if (date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0 && workDay.contains(s)) {
                //将当前次会议添加到预定会议中
                //增加联系人
                List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(repeatMeeting.getId()));
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(sf.format(createTime)+ " " + repeatMeeting.getMeetTime());//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getRoomName());//会议室名
                remeet.setState(1);
                remeet.setUserId(repeatMeeting.getUserId());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
//                System.out.println(sf.format(createTime));
//                System.out.println(repeatMeeting.getLongTime());
//                System.out.println(repeatMeeting.getRoomId());
//                System.out.println(repeatMeeting.getRoomName());
                appointmentMeetService.appointmentMeet(remeet, user);//添加会议
            } /*else {
                //修改循环会议的状态为0
                taskMeetingService.update(repeatMeeting.getId());
            }*/

            boolean b = date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0 && workDay.contains(s);
            System.out.println(b);
        }
    }

    @Test
    public void Method14(){
        //Date date = new Date();
        //String weekOfDate = getWeekOfDate(date);
        //System.out.println(weekOfDate);
        List<RepeatMeeting> list = taskMeetingService.findMeeting(1, "everyweeks");
        String weeks = list.get(0).getWeeks();
        System.out.println(weeks);//星期一, 星期二, 星期三, 星期六, 星期日
        String[] split = weeks.split(",");
        List<String> strings = Arrays.asList(weeks);
        System.out.println(strings);//[星期一, 星期二, 星期三, 星期六, 星期日]
        List<String> strings1 = Arrays.asList(split);
        boolean b = strings1.contains("星期一");
        System.out.println(b);//false
    }
    /**
     * 判断当前日期是星期几<br>
     * <br>
     * @param pTime 修要判断的时间<br>
     * @return dayForWeek 判断结果<br>
     * @Exception 发生异常<br>
     */
    public  static  int  dayForWeek(String pTime) throws  Exception {
        SimpleDateFormat format = new  SimpleDateFormat("yyyy-MM-dd" );
        Calendar c = Calendar.getInstance();
        c.setTime(format.parse(pTime));
        int  dayForWeek = 0 ;
        if (c.get(Calendar.DAY_OF_WEEK) == 1 ){
            dayForWeek = 7 ;
        }else {
            dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1 ;
        }
        return  dayForWeek;
    }
    /**
     * 获取当前日期是星期几<br>
     * @param dt
     * @return 当前日期是星期几
     */
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);

        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        return weekDays[w];
    }
    
    
    @Test
    public void Method15(){
        List<RepeatMeeting> everyweeks = taskMeetingService.findMeeting(1, "everyweeks");
        System.out.println(everyweeks.size());
    }

    @Test
    public void Method16() throws ParseException {
        //查询状态为 1 且重复类型为 "每日"  的会议
        Integer status = 1;
        String repeatType = "everyweeks";
        List<RepeatMeeting> list = taskMeetingService.findMeeting(status, repeatType);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前时间
        Date date = new Date();
        //处理所有循环会议
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (RepeatMeeting repeatMeeting : list) {
            //解析开始时间
            Date createTime = format.parse(repeatMeeting.getCreateTime());
            //结束时间
            Date endTime = sf.parse(repeatMeeting.getEndTime());
            String week = repeatMeeting.getWeeks();
            String[] split = week.split(",");
            //获取重复会议  星期数组
            List<String> strings = Arrays.asList(split);
            //获取当前日期 星期几
            String weekOfDate = getWeekOfDate(date);

            //当前时间大于开始时间   &&   当前时间 小于结束时间   && 当前时间为工作日
            if (date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0&&strings.contains(weekOfDate)) {
                //将当前次会议添加到预定会议中
                //增加联系人
                List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(repeatMeeting.getId()));
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(format.format(createTime));//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getRoomName());//会议室名
                remeet.setState(1);
                remeet.setRepeatType(repeatMeeting.getRepeatType());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                remeet.setUserId(repeatMeeting.getUserId());
                //如果当前时间在结束时间之前,  发送邮件,添加到我的预定会议中
                appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                System.out.println("周循环会议添加成功");
            } else if (date.compareTo(createTime) < 0) {
                //跳过
                continue;
            }
            // 如果当前时间超过结束时间,修改会议状态(逻辑删除)
            //修改循环会议的状态为0
            if (date.compareTo(endTime)>0){
                taskMeetingService.update(repeatMeeting.getId());
            }
        }
    }


    @Test
    public void Method17(){
//        Calendar cal = Calendar.getInstance();
//        cal.set(2019,5,0);
//        int i = cal.get(Calendar.DAY_OF_MONTH);
//        System.out.println(i);
        //int dayOfMonth = getDayOfMonth();
        List dayListOfMonth = getDayListOfMonth();
        System.out.println(dayListOfMonth);
    }


    //java获取当前月的天数
    public int getDayOfMonth(){
        Calendar aCalendar = Calendar.getInstance(Locale.CHINA);
        int day=aCalendar.getActualMaximum(Calendar.DATE);
        return day;
    }


    //java获取当前月每天的日期

    public List getDayListOfMonth() {
        List list = new ArrayList();
        Calendar aCalendar = Calendar.getInstance(Locale.CHINA);
        int year = aCalendar.get(Calendar.YEAR);//年份
        int month = aCalendar.get(Calendar.MONTH) + 1;//月份
        int day = aCalendar.getActualMaximum(Calendar.DATE);
        for (int i = 1; i <= day; i++) {
            String aDate = String.valueOf(year)+"/"+month+"/"+i;
            list.add(aDate);
        }
        return list;
    }

    @Test
    public void Method18(){
        Calendar c = Calendar.getInstance();
        System.out.println(c.getTime().getDate());
    }

    @Test
    public void Method19() throws ParseException {
        Integer status = 1;
        String repeatType = "everymouths";
        List<RepeatMeeting> list = taskMeetingService.findMeeting(status, repeatType);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前时间
        Date date = new Date();
        //处理所有循环会议
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (RepeatMeeting repeatMeeting : list) {
            //解析开始时间
            Date createTime = format.parse(repeatMeeting.getCreateTime());
            //结束时间
            Date endTime = sf.parse(repeatMeeting.getEndTime());
            //获取预定日
            int repeatDay = Integer.parseInt(repeatMeeting.getWeeks());
            //获取当月天数
            int dayNum = getDayOfMonth();
            //获取今天多少号
            int today = Calendar.getInstance().getTime().getDate();

            //当前时间大于开始时间   &&   当前时间 小于结束时间
            //当月要包含预定日  -->预定日<=当月天数       当前日期<=预定日
            if (date.compareTo(createTime) > 0 && date.compareTo(endTime) < 0 && repeatDay<=dayNum && today<= repeatDay) {
                //将当前次会议添加到预定会议中
                //增加联系人
                List<UserInternal> user = addUserService.findUserByMeetId(String.valueOf(repeatMeeting.getId()));
                //添加会议数据
                Remeet remeet = new Remeet();
                remeet.setMeetName(repeatMeeting.getMeetName());//设置会议名
                remeet.setMeetDate(format.format(createTime));//设置当前会议时间
                remeet.setMeetDescription(repeatMeeting.getDescription());//描述
                remeet.setMeetLaber("重复会议");
                remeet.setMeetType("循环会议");
                remeet.setMeetRoomId(repeatMeeting.getRoomId());//会议室id
                remeet.setMeetRoomName(repeatMeeting.getRoomName());//会议室名
                remeet.setState(1);
                remeet.setRepeatType(repeatMeeting.getRepeatType());
                remeet.setMeetTime(repeatMeeting.getMeetTime());//时长
                remeet.setUserId(repeatMeeting.getUserId());
                //如果当前时间在结束时间之前,  发送邮件,添加到我的预定会议中
                appointmentMeetService.appointmentMeet(remeet, user);//添加会议
                System.out.println("月循环会议添加成功");
            } else if (date.compareTo(createTime) < 0) {
                //跳过
                continue;
            }
            // 如果当前时间超过结束时间,修改会议状态(逻辑删除)
            //修改循环会议的状态为0
            if (date.compareTo(endTime)>0){
                taskMeetingService.update(repeatMeeting.getId());
            }
        }
    }

    @Autowired
    private TaskMeetingDao taskMeetingDao;
    @Test
    public void Method20(){
        List<RepeatMeeting> repeatMeeting = taskMeetingService.findRepeatMeeting(1, 10, "");
        //List<RepeatMeeting> repeatMeeting = taskMeetingDao.findRepeatMeeting("");
        System.out.println(repeatMeeting);
    }
}
