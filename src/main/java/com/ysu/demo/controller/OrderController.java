package com.ysu.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ysu.demo.bean.Car;
import com.ysu.demo.bean.Dishes;
import com.ysu.demo.bean.Order;
import com.ysu.demo.service.CarService;
import com.ysu.demo.service.DishesService;
import com.ysu.demo.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.sound.midi.Soundbank;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CarService carService;
    @Autowired
    private DishesService dishesService;

    @ResponseBody
    @GetMapping(value = "/insertOrder")

    public void insertOrder(@RequestParam("phoneNumber") String phoneNumber, @RequestParam("userTrueName") String userTrueName, @RequestParam("shopId") Integer shopId, @RequestParam("shopName") String shopName, @RequestParam("orderPrice") BigDecimal orderPrice, @RequestParam("dishesName") String dishesName, @RequestParam("dishesCount") Integer dishesCount, @RequestParam("shopCar") String shopCar, @RequestParam("orderExtra") String orderExtra, @RequestParam("qcTime") String qctime, @Param("shopImage") String shopImage, @Param("userId") String userId,@Param("orderState")Integer orderState) {
        System.out.println("success");
        List<Car> cars = new ArrayList<>();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String format = sf.format(date);
        //小程序传来的对象数组获取其中的数据并封装
        if (StringUtils.isNotEmpty(shopCar)) {
            JSONArray createArray = JSONArray.parseArray(shopCar);
            for (int i = 0; i < createArray.size(); i++) {
                Integer num = JSONObject.parseObject(JSONObject.toJSONString(createArray.get(i))).getInteger("num");
                String name = JSONObject.parseObject(JSONObject.toJSONString(createArray.get(i))).getString("name");
                BigDecimal price = JSONObject.parseObject(JSONObject.toJSONString(createArray.get(i))).getBigDecimal("price");
                String image = JSONObject.parseObject(JSONObject.toJSONString(createArray.get(i))).getString("image");
                Dishes dishes = dishesService.queryDishesBySnAndDn(shopId, dishesName);
                Car car = new Car(null, num, dishes.getDishesId(), name, price, image);
                carService.insertCar(car);
                cars.add(car);
            }
        }
        Order order = new Order(null, format, phoneNumber, userTrueName, shopId, shopName,orderState, orderPrice, dishesName, dishesCount, orderExtra, qctime, null, shopImage, userId, cars);
        System.out.println(order);
        orderService.insertOrder(order);
    }

    @ResponseBody
    @GetMapping("/queryAllOrder")
    public List<Order> queryAllOrder() {
        return orderService.queryAllOrder();
    }

    @RequestMapping(value = "/queryOrderByPage")
    public String queryOrderByPage(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryAllOrder();
        PageInfo pageInfo = new PageInfo(orders, 5);
        model.addAttribute("pageinfo", pageInfo);
        return "orders";
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(@RequestParam("orderId") Integer orderId) {
        orderService.deleteOrder(orderId);
        return "redirect:queryOrderByPage.action";
    }

    @RequestMapping(value = "/queryOrderByPage2")
    public String queryOrderByPage2(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @Param("shopName") String shopName) {
        System.out.println("查询分页");
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryOrderByShopName(shopName);
        System.out.println(orders);
        PageInfo pageInfo = new PageInfo(orders, 5);
        model.addAttribute("pageinfo", pageInfo);
        return "orders";
    }

    @RequestMapping(value = "/queryOrderByPage3")
    public String queryOrderByPage3(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryOrderByShopName("1号店");
        PageInfo pageInfo = new PageInfo(orders, 5);
        model.addAttribute("pageinfo", pageInfo);
        return "myorders";
    }
    //订单号+店铺id查询订单
    @RequestMapping(value = "/queryShopOrder")
    public String queryShopOrder(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,@Param("shopId")Integer shopId,@Param("orderNumber")Integer orderNumber) {
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryShopOrder(shopId, orderNumber);
        PageInfo pageInfo = new PageInfo(orders, 5);
        model.addAttribute("pageinfo", pageInfo);
        return "myorders";
    }

    @ResponseBody
    @GetMapping(value = "/queryOrderById")
    public Order queryOrderById(@RequestParam("orderId") Integer orderId) {
        System.out.println("succ111");
        Order order = orderService.queryOrderById(orderId);
        System.out.println(order);
        return order;
    }

    @ResponseBody
    @GetMapping(value = "/queryOrderByOpenId")
    public List<Order> queryOrderByOpenId(@RequestParam("userId") String userId) {
        List<Order> orders = orderService.queryOrderByOpenId(userId);
        return orders;
    }

    @RequestMapping(value = "/queryOrderByShopId2")
    public String queryOrderByShopId2(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @Param("shopId") Integer shopId, @Param("orderState") Integer orderState) {
        System.out.println("shopid==="+shopId);
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryOrderByShopId2(shopId, orderState);
            PageInfo pageInfo = new PageInfo(orders, 5);
            System.out.println(orders);
            model.addAttribute("pageinfo", pageInfo);
            return "jiedan";
    }

    @RequestMapping(value = "/queryOrderByShopId3")
    public String queryOrderByShopId3(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @Param("shopId") Integer shopId) {
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryOrderByShopId3(shopId);
        PageInfo pageInfo = new PageInfo(orders, 5);
        model.addAttribute("pageinfo", pageInfo);
            return "zhizuo";
    }
    @RequestMapping(value = "/queryOrderByShopId4")
    public String queryOrderByShopId4(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, @Param("shopId") Integer shopId) {
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.queryOrderByShopId4(shopId);
        PageInfo pageInfo = new PageInfo(orders, 5);
        model.addAttribute("pageinfo", pageInfo);
        return "myorders";
    }
    //用户取消订单
    @ResponseBody
    @RequestMapping(value = "/cancelOrder")
    public void cancelOrder(@Param("orderId") Integer orderId) {
          orderService.cancelOrder(orderId);
    }

    //订单状态改变
    @RequestMapping(value = "/updateOrderState")
    @ResponseBody
    public String updateOrderState(@Param("orderId") Integer orderId,@Param("orderState") Integer orderState) {
        System.out.println(orderId+orderState);
        orderService.updateOrderState(orderId,orderState);
        return "";
    }


}


