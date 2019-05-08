package com.bcsd.controller;

import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetRoomService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 会议室管理功能
 */

@Controller
@RequestMapping("/meet")
public class MeetRoomController {

    private String PREFIX = "page/meet_management";

    @Autowired
    @Qualifier("meetRoomService")
    private MeetRoomService meetRoomService;


    /**
     * 查询所有会议室
     * @param
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(Integer page,Integer size,String roomName){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }
        System.out.println("查询所有会议室");
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll(page,size,roomName);
        PageInfo pageInfo=new PageInfo<MeetRoom>(meetRoomList);
        vm.addObject("pageInfo",pageInfo);
        if (roomName!=null||roomName!=""){
            vm.addObject("roomName",roomName);
        }
        vm.setViewName(PREFIX);
        return vm;
    }

    /**
     * 查询所有会议室
     * @param
     * @return
     */
    @RequestMapping("/findAllRoom")
    public ModelAndView findAllRoom(Integer page,Integer size,String roomName){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }
        System.out.println("查询所有会议室");
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll(page,size,roomName);
        PageInfo pageInfo=new PageInfo<MeetRoom>(meetRoomList);
        vm.addObject("pageInfo",pageInfo);
        if (roomName!=null||roomName!=""){
            vm.addObject("roomName",roomName);
        }
        vm.setViewName("page/meeting/meeting_list");
        return vm;
    }


    /**
     * 查询会议室信息
     * @param
     * @return
     */
    @RequestMapping("/findOne")
    public ModelAndView findOne(@RequestParam(value="roomId") String roomId){
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom = meetRoomService.findOne(roomId);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName(PREFIX+"/meet_manager_update");
        return vm;
    }

    /**
     * 添加会议室
     * @param meetRoom
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    public String add(MeetRoom meetRoom) throws Exception {
        //ModelAndView vm=new ModelAndView();
        meetRoomService.add(meetRoom);
        //vm.addObject("addInfo","success");
        System.out.println("添加成功!");
        return "redirect:findAll";
    }

    /**
     * 修改会议室信息
     * @param meetRoom
     * @return
     */
    @RequestMapping("/update")
    public String update(MeetRoom meetRoom){
        meetRoomService.update(meetRoom);
        return "redirect:findAll";
    }

    /**
     * 删除会议室
     * @param roomId
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="roomId") String roomId){
       // System.out.println(roomId);
        ModelAndView vm=new ModelAndView();
        meetRoomService.delete(roomId);
      /*  vm.addObject("deleteInfo","success");
        System.out.println("删除成功!");
        vm.setViewName("page/meet_management");*/
        return "redirect:findAll";
    }

    /**
     * 删除会议室
     * @param
     * @return
     */
    @RequestMapping("/deletes")
    public String deletes(HttpServletRequest request){
        String[] ids = request.getParameterValues("roomId");
        System.out.println(ids);
        for (String roomId : ids) {
            meetRoomService.delete(roomId);
        }
        return "redirect:findAll";
    }

    @RequestMapping("/findRoom")
    public void findRoomByCondition(){

    }

}
