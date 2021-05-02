package com.ysu.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ysu.demo.bean.Shop;
import com.ysu.demo.bean.User;
import com.ysu.demo.service.ShopService;
import com.ysu.demo.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ShopController {
    @Autowired
    private ShopService shopService;
    @Autowired
    private UserService userService;


    @RequestMapping("/insertShop")
    public String insertShop(Shop shop, HttpSession session, @RequestParam("multipartFile") MultipartFile multipartFile, User user) {
        System.out.println("insertShop进来了");
        Shop shop1 = shopService.shopIsExist(shop);
        User user1 = userService.userIsExist(user);
        if (shop1 == null&&user1==null) {
                user.setRoleId(0);
                userService.insertUser(user);
                String a = "s_" + new Date().getTime() + ".jpg";
                try {
                    this.inputStreamToFile((FileInputStream) multipartFile.getInputStream(), new File("D:\\IDEAProject\\shitang\\src\\main\\webapp\\images\\" + a));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                User user2 = userService.userIsExist(user);
                shop.setSale(0);
                shop.setScore(new BigDecimal(0.0));
                shop.setUserId(user2.getUserId());
                shop.setShopImage(a);
                System.out.println(shop);
                System.out.println("successs!!!!!!!!!!!!!");
                shopService.insertShop(shop);
                return "addshop";
        } else
            return "addshop";
    }
    public void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/updateShop")
    public String updateShop(Shop shop, HttpSession session){
      /*  User user1 = (User) session.getAttribute("user");
        shop.setUserId(user1.getUserId());*/
        shopService.updateShop(shop);
        return "redirect:queryShopByPage.action";
    }

    @RequestMapping(value = "/queryShopByPage")
    public String queryShopByPage(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model, Shop shop) {
        List<Shop> shopArrayList=new ArrayList<>();
        PageHelper.startPage(pn,10);
        shopArrayList=shopService.queryAllShop();
        PageInfo pageInfo=new PageInfo(shopArrayList,5);
        model.addAttribute("pageinfo", pageInfo);
        return "shop";
    }

    @RequestMapping(value = "/queryShopByPage2")
    public String queryShopByPage2(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model, Shop shop) {
        List<Shop> shopArrayList=new ArrayList<>();
        PageHelper.startPage(pn,10);
       shopArrayList=shopService.queryShopByName(shop.getShopName());
        PageInfo pageInfo=new PageInfo(shopArrayList,5);
        model.addAttribute("pageinfo", pageInfo);
        return "shop";
    }
    @ResponseBody
    @GetMapping(value = "/queryShopByName")
    public List<Shop> queryShopByName(@RequestParam("shopName") String shopName) {
        System.out.println(shopName);
        List<Shop> shopArrayList=new ArrayList<>();
        shopArrayList=shopService.queryShopByName(shopName);
        return shopArrayList;
    }

    @ResponseBody
    @PostMapping(value = "/queryAllShop")
    public List<Shop> queryAllShop() {
        List<Shop> shopArrayList=new ArrayList<>();
        shopArrayList=shopService.queryAllShop();
        return shopArrayList;
    }

    @RequestMapping(value = "/deleteShop")
    public String deleteShop(Integer shopId) {
        shopService.deleteShop(shopId);
        return "redirect:queryShopByPage2.action";
    }

    @ResponseBody
    @GetMapping(value = "/queryShopById")
    public Shop queryShopById(@RequestParam("shopId") Integer shopId) {
        Shop shop = shopService.queryShopById(shopId);
        return shop;
    }


    @RequestMapping(value = "/queryShopById1")
    public String queryShopById1(Model model,@Param("shopId") Integer shopId) {
        Shop shop = shopService.queryShopById(shopId);
        model.addAttribute("shop", shop);
        return "myshop";
    }

    @RequestMapping(value = "/shopSales")
    public String shopSales(Model model) {
        List<Shop> shops = shopService.shopSales();
        model.addAttribute("shop", shops);
        return "shopsale";
    }

}
