import com.alibaba.fastjson.JSONObject;
import com.bcsd.controller.MeetUserController;
import com.bcsd.dao.*;
import com.bcsd.entity.*;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.MeetRoomService;
import com.bcsd.service.MeetUserService;
import com.bcsd.service.ReMeetRoomService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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

        List<Date> workDates = getWorkDates(2019, 5);

        //System.out.println(workDates.get(0));
        for (Date workDate : workDates) {
            String[] s = workDate.toString().split(" ");
            System.out.println(s[2]);
        }
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
}
