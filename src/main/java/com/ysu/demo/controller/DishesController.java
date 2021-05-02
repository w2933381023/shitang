package com.ysu.demo.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ysu.demo.bean.Dishes;
import com.ysu.demo.service.DishesService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class DishesController {
    @Autowired
    private DishesService dishesService;
    @RequestMapping(value = "/insertDishes")
    public String insertDishes(Dishes dishes, HttpSession session, HttpServletRequest request, @RequestParam("multipartFile") MultipartFile multipartFile){
        Dishes dishes1 = dishesService.dishesIsExist(dishes);
        if(dishes1==null){
            String a="d_"+new Date().getTime()+".jpg";
            try {
                this.inputStreamToFile((FileInputStream) multipartFile.getInputStream(), new File("D:\\IDEAProject\\shitang\\src\\main\\webapp\\images\\"+a));
            } catch (IOException e) {
                e.printStackTrace();
            }
            dishes.setDishesImage(a);
            dishes.setDishesState(0);
            System.out.println("successs!!!!!!!!!!!!!");
            dishesService.insertDishes(dishes);
            return "adddishes";
        }else
            return "adddishes";
    }
    public void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/deleteDishes")
    public String deleteDishes(Integer dishesId) {
        dishesService.deleteDishes(dishesId);
        return "redirect:queryDishesByPage2.action";
    }

    @RequestMapping(value = "/queryDishesByPage")
    public String queryDishesByPage(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model, Dishes dishes) {
        List<Dishes> dishesArrayList=new ArrayList<>();
        PageHelper.startPage(pn,10);
        dishesArrayList=dishesService.queryAllDishes();
        PageInfo pageInfo=new PageInfo(dishesArrayList,5);
        model.addAttribute("pageinfo", pageInfo);
        return "dishes";
    }
    @RequestMapping(value = "/queryDishesByPage2")
    public String queryDishesByPage2(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model, Dishes dishes) {
        List<Dishes> dishesArrayList=new ArrayList<>();
        PageHelper.startPage(pn,10);
        dishesArrayList=dishesService.queryDishesByName(dishes.getDishesName());
        PageInfo pageInfo=new PageInfo(dishesArrayList,5);
        model.addAttribute("pageinfo", pageInfo);
        return "dishes";
    }
    @RequestMapping(value = "/queryDishesByPage3")
    public String queryDishesByPage3(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model,@Param("shopId")Integer shopId) {
        PageHelper.startPage(pn,10);
        List<Dishes> dishes = dishesService.queryDishesByShopId(shopId);
        PageInfo pageInfo=new PageInfo(dishes,5);
        model.addAttribute("pageinfo", pageInfo);
        return "mydishes";
    }
    @RequestMapping(value = "/updateDishes")
    public String updateDishes(Dishes dishes){
        dishesService.updateDishes(dishes);
        return "redirect:queryDishesByPage2.action";
    }

   @ResponseBody
    @GetMapping(value = "/queryDishesByShopId")
    public List<Dishes> queryDishesByShopId(@RequestParam("shopId") Integer shopId){
      List<Dishes> dishes = dishesService.queryDishesByShopId(shopId);
      return dishes;
  }

    @ResponseBody
    @GetMapping(value = "/queryDishesById")
    public Dishes queryDishesById(@RequestParam("dishesId") Integer dishesId){
        Dishes dishes = dishesService.queryDishesById(dishesId);
        return dishes;
    }

    @RequestMapping(value = "/queryDishesByState")
    public String queryDishesByState(@RequestParam("dishesState") Integer dishesState,Model model,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        List<Dishes> dishes = dishesService.queryDishesByState(dishesState);
        PageHelper.startPage(pn,10);
        PageInfo pageInfo=new PageInfo(dishes,5);
        model.addAttribute("pageinfo", pageInfo);
        return "verifyDishes";
    }

    @RequestMapping(value = "/queryDishesByShopName1")
    public String queryDishesByShopName1(@RequestParam("shopName") String shopName,Model model,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        List<Dishes> dishes = dishesService.queryDishesByShopName1(shopName);
        PageHelper.startPage(pn,10);
        PageInfo pageInfo=new PageInfo(dishes,5);
        model.addAttribute("pageinfo", pageInfo);
        return "verifyDishes";
    }

    @RequestMapping(value = "/queryDishesByShopName2")
    public String queryDishesByShopName2(@RequestParam("shopName") String shopName, @Param("dishesState") Integer dishesState, Model model, @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        System.out.println(dishesState);
        List<Dishes> dishes = dishesService.queryDishesByShopName2(shopName,dishesState);
        PageHelper.startPage(pn,10);
        PageInfo pageInfo=new PageInfo(dishes,5);
        model.addAttribute("pageinfo", pageInfo);
        return "verifyDishes";
    }

    @RequestMapping(value = "/updateDishesState")
    public String updateDishesState(@Param("dishesId")Integer dishesId,@Param("dishesState")Integer dishesState){
        System.out.println(dishesId+dishesState);
        Dishes dishes = dishesService.queryDishesById(dishesId);
        dishes.setDishesState(dishesState);
        dishesService.updateDishes(dishes);
        System.out.println("123");
        System.out.println(dishesService.queryDishesById(dishesId));
        return "redirect:queryDishesByState?dishesState=0";
    }
    @ResponseBody
    @RequestMapping(value = "/updateDishesState1")
    public Integer updateDishesState1(@Param("dishesId")Integer dishesId,@Param("dishesState")Integer dishesState){
        System.out.println(dishesId+dishesState);
        Dishes dishes = dishesService.queryDishesById(dishesId);
        dishes.setDishesState(dishesState);
        dishesService.updateDishes(dishes);
        System.out.println("123");
        System.out.println(dishesService.queryDishesById(dishesId));
        return 1;
    }

    @ResponseBody
    @GetMapping("/queryDishesByName")
    public List<Dishes> queryDishesByName(@Param("dishesName")String dishesName){
        System.out.println(dishesName);
        List<Dishes> dishes = dishesService.queryDishesByName(dishesName);
        System.out.println(dishes);
        return dishes;
    }
}
