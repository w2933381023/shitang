package com.ysu.demo.controller;

import com.ysu.demo.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class CarController {
    @Autowired
    private CarService carService;

    @ResponseBody
    @RequestMapping("/test")
    public void test(@RequestParam("file") MultipartFile file){
        System.out.println("123");
       System.out.println(file.getOriginalFilename());
        File file1=new File("C:\\Users\\29333\\Desktop\\image\\1.jpg");
        try {
            file.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
