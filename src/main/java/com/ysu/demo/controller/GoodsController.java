package com.ysu.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ysu.demo.bean.Goods;
import com.ysu.demo.service.GoodsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;


    @RequestMapping("/insertGoods")
    public String insertGoods(@Param("shopId") Integer shopId, @Param("goodsName")String goodsName){
        Goods goods = new Goods(null, shopId,goodsName,null);
        goodsService.insertGoods(goods);
        return "redirect:/queryGoodsByPage3?shopId="+shopId;
    }

    @ResponseBody
    @GetMapping("/queryAllGoods")
    public List<Goods> queryAllGoods(){
        return  goodsService.queryAllGoods();
    }

    @ResponseBody
    @GetMapping("/deleteGoods")
    public void deleteGoods(@Param("goodsId")Integer goodsId){
        System.out.println(goodsId);
       goodsService.deleteGoods(goodsId);
    }

    @ResponseBody
    @GetMapping("/queryGoodsByShopId")
    public List<Goods> queryGoodsByShopId(@Param("shopId") Integer shopId){
        return goodsService.queryGoodsByShopId(shopId);
    }

    @RequestMapping(value = "/queryGoodsByPage3")
    public String queryGoodsByPage3(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model,@Param("shopId")Integer shopId) {
        PageHelper.startPage(pn,10);
        List<Goods> goods = goodsService.queryGoodsByShopId(shopId);
        PageInfo pageInfo=new PageInfo(goods,5);
        model.addAttribute("pageinfo", pageInfo);
        return "goods";
    }

    @RequestMapping(value = "/queryGoodsByShopId2")
    public String queryGoodsByShopId2(@RequestParam(value = "pn",defaultValue = "1") Integer pn, @Param("shopId")Integer shopId, HttpSession session){
        List<Goods> goods = goodsService.queryGoodsByShopId(shopId);
        session.setAttribute("goods",goods);
        return "adddishes";
    }

}
