package com.ysu.demo.push;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.gson.Gson;
import com.ysu.demo.bean.Order;
import com.ysu.demo.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 作者：编程小石头
 * 发送小程序订阅消息
 */
@Controller
@Slf4j
public class SendWxMessage {
    @Autowired
    private OrderService orderService;
    private String appID = "wxc53cddcd31b3a812";
    private String appSecret = "187cd07141a4b23984ab65930e5eebe4";
    //发送订阅消息
    @ResponseBody
    @GetMapping("/qucan")
    public String qucan(@Param("orderId")Integer orderId) throws JsonProcessingException {
        Order order = orderService.queryOrderById(orderId);
        orderService.updateOrderState(orderId,3);
        System.out.println("1313");
        RestTemplate restTemplate = new RestTemplate();
        //这里简单起见我们每次都获取最新的access_token（时间开发中，应该在access_token快过期时再重新获取）
        String url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + getAccessToken();
        //拼接推送的模版
        WxMssVo wxMssVo = new WxMssVo();
        wxMssVo.setTouser(order.getUserId());//用户的openid（要发送给那个用户，通常这里应该动态传进来的）
        wxMssVo.setTemplate_id("T6G6Y7WncqKMIHz67KvLZm-j3qmJOjMvGP5SZDVCJko");//订阅消息模板id
        wxMssVo.setPage("pages/index/index");
        //封装模板消息内容。必须和你申请的小程序模板格式一模一样。
        JSONObject jsonObject= new JSONObject();
        TemplateData value=new TemplateData();
        TemplateData value2=new TemplateData();
        TemplateData value3=new TemplateData();
        value.setValue("您的商品已制作完成，请尽快到店来取。");
        value2.setValue("C"+order.getOrderId());
        value3.setValue(order.getShopName());
        jsonObject.put("character_string1",value2);
        jsonObject.put("thing5",value);
        jsonObject.put("thing3",value3);
        System.out.println(jsonObject.toString());
        wxMssVo.setData(jsonObject);
        System.out.println(wxMssVo);
        ResponseEntity<String> responseEntity =
                restTemplate.postForEntity(url, wxMssVo, String.class);
        log.info("推送返回的信息 ={}", responseEntity.getBody());
        return responseEntity.getBody();
    }
    @ResponseBody
    @GetMapping("/tuidan")
    public String tuidan(@Param("orderId")Integer orderId) throws JsonProcessingException {
        Order order = orderService.queryOrderById(orderId);
        orderService.updateOrderState(orderId,5);
        RestTemplate restTemplate = new RestTemplate();
        //这里简单起见我们每次都获取最新的access_token（时间开发中，应该在access_token快过期时再重新获取）
        String url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + getAccessToken();
        //拼接推送的模版
        WxMssVo wxMssVo = new WxMssVo();
        wxMssVo.setTouser(order.getUserId());//用户的openid（要发送给那个用户，通常这里应该动态传进来的）
        wxMssVo.setTemplate_id("o8pWZcUUcREoPf-LestWiqYtOkYo8w34oyA8E8p5e54");//订阅消息模板id
        wxMssVo.setPage("pages/index/index");
        //封装模板消息内容。必须和你申请的小程序模板格式一模一样。
        JSONObject jsonObject= new JSONObject();
        TemplateData value=new TemplateData();
        TemplateData value2=new TemplateData();
        value.setValue(order.getShopName());
        value2.setValue("抱歉，由于特殊原因，商家已取消订单");
        jsonObject.put("thing1",value);
        jsonObject.put("thing2",value2);
        System.out.println(jsonObject.toString());
        wxMssVo.setData(jsonObject);
        System.out.println(wxMssVo);
        ResponseEntity<String> responseEntity =
                restTemplate.postForEntity(url, wxMssVo, String.class);
        log.info("推送返回的信息 ={}", responseEntity.getBody());
        return responseEntity.getBody();
    }
    //获取AccessToken
    public String getAccessToken() {
        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = new HashMap<>();
        params.put("APPID", appID);  //这里替换成你的appid
        params.put("APPSECRET", appSecret);  //这里替换成你的appsecret
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={APPID}&secret={APPSECRET}", String.class, params);
        String body = responseEntity.getBody();
        AccessToken object = new Gson().fromJson(body, AccessToken.class);
        log.info("返回的AccessToken={}", object);
        String Access_Token = object.getAccess_token();
        return Access_Token;
    }
}