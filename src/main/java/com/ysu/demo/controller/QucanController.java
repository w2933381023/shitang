package com.ysu.demo.controller;


import com.ysu.demo.bean.Qucan;
import com.ysu.demo.service.QucanService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class QucanController {
    @Autowired
    private QucanService qucanService;

    @ResponseBody
    @GetMapping(value = "/insertQucan")
    public void insertQucan(@RequestParam("name") String name, @RequestParam("phone") String phone, @Param("userId")String userId) {
        Qucan qucan = new Qucan(null, name, phone,userId);
        qucanService.insertQucan(qucan);
    }

    @ResponseBody
    @GetMapping(value = "/queryAllQucan")
    public List<Qucan> queryAllQucan() {
        List<Qucan> qucans=new ArrayList<>();
        qucans=qucanService.queryAllQucan();
        return qucans;
    }
    @ResponseBody
    @GetMapping(value = "/deleteQucan")
    public void deleteQucan(@RequestParam("qucanId") Integer qucanId) {
        System.out.println(qucanId);
        qucanService.deleteQucan(qucanId);
    }

    @ResponseBody
    @GetMapping(value = "/queryQucanByUserId")
    public List<Qucan> queryQucanByUserId(@Param("userId")String userId) {
        List<Qucan> qucans = qucanService.queryQucanByUserId(userId);
        return qucans;
    }
}
