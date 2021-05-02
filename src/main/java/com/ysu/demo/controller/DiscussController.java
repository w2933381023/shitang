package com.ysu.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ysu.demo.bean.*;
import com.ysu.demo.service.DiscussService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class DiscussController {
    @Autowired
    private DiscussService discussService;


    @ResponseBody
    @GetMapping("/insertDiscuss")
    public void insertDiscuss(@Param("discussContent") String discussContent, Dishes dishes, Order order,WxUser wxUser, Shop shop){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(order);
        Date date = new Date();
        String format = sf.format(date);
        Discuss discuss = new Discuss(null,discussContent,format,shop,wxUser,dishes);
        discussService.insertDiscuss(discuss);
    }

//    @ResponseBody
//    @GetMapping("/queryAllDiscuss")
//    public List<Discuss> queryAllDiscuss(){
//
//        return  discussService.queryAllDiscuss();
//    }
//
//    @ResponseBody
//    @GetMapping("/queryDiscussByDishesId")
//    public List<Discuss> queryDiscussByDishesId(@Param("dishesId") Integer dishesId){
//        return  discussService.queryDiscussByDishesId(dishesId);
//    }
//
//    @ResponseBody
//    @GetMapping("/updateDiscuss")
//    public void updateDiscuss(Discuss discuss){
//        discussService.updateDiscuss(discuss);
//    }
//
//    @ResponseBody
//    @GetMapping("/queryDiscussById")
//    public Discuss queryDiscussById(Integer discussId){
//        return  discussService.queryDiscussById(discussId);
//    }
//
//    @GetMapping("/deleteDiscuss")
//    public String deleteDiscuss(@Param("discussId")Integer discussId){
//        System.out.println(discussId);
//        discussService.deleteDiscuss(discussId);
//        return "redirect:queryDiscussByPage.action";
//    }
//
//    @RequestMapping(value = "/queryDiscussByPage")
//    public String queryDiscussByPage(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model) {
//        List<Discuss> discussArrayList=new ArrayList<>();
//        PageHelper.startPage(pn,10);
//        discussArrayList=discussService.queryAllDiscuss();
//        PageInfo pageInfo=new PageInfo(discussArrayList,5);
//        model.addAttribute("pageinfo", pageInfo);
//        return "discuss";
//    }
//
//    @RequestMapping(value = "/queryDiscussByPage2")
//    public String queryDiscussByPage2(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model,String dishesName) {
//        List<Discuss> discussArrayList=new ArrayList<>();
//        PageHelper.startPage(pn,10);
//        discussArrayList=discussService.queryDiscussByDishesName(dishesName);
//        PageInfo pageInfo=new PageInfo(discussArrayList,5);
//        model.addAttribute("pageinfo", pageInfo);
//        return "discuss";
//    }


//    @RequestMapping(value = "/queryDiscussByPage2")
//    public String queryDiscussByPage2(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model, Discuss Discuss) {
//        List<Discuss> discussArrayList=new ArrayList<>();
//        PageHelper.startPage(pn,10);
//        discussArrayList=DiscussService.queryDiscussByName(Discuss.getDiscussName());
//        PageInfo pageInfo=new PageInfo(DiscussArrayList,5);
//        model.addAttribute("pageinfo", pageInfo);
//        return "Discuss";
//    }
}
