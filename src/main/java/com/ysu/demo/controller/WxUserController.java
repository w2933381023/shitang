package com.ysu.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ysu.demo.bean.OpenIdJson;
import com.ysu.demo.bean.WxUser;
import com.ysu.demo.service.WxUserService;
import com.ysu.demo.utils.HttpUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class WxUserController {

    private String appID = "wxc53cddcd31b3a812";
    private String appSecret = "187cd07141a4b23984ab65930e5eebe4";

    @Autowired
    private WxUserService wxUserService;

    @ResponseBody
    @RequestMapping("/getOpenId")
    private String getOpenId(@RequestParam("code") String code) throws Exception{
        String result = "";
        try{//请求微信服务器，用code换取openid。HttpUtil是工具类，后面会给出实现，Configure类是小程序配置信息，后面会给出代码
            result = HttpUtil.doGet(
                    "https://api.weixin.qq.com/sns/jscode2session?appid="
                            + this.appID + "&secret="
                            + this.appSecret + "&js_code="
                            + code
                            + "&grant_type=authorization_code", null);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        OpenIdJson openIdJson = mapper.readValue(result,OpenIdJson.class);
        System.out.println(result.toString());
        System.out.println(openIdJson.getOpenid());
        return result;
    }

    @ResponseBody
    @RequestMapping("/wxLogin")
    private WxUser wxLogin(@Param("openId")String openId, WxUser wxUser){
        WxUser wxUser1 = wxUserService.wxUserIsExist(openId);
        if (wxUser1==null){
            wxUser.setOpenId(openId);
            wxUserService.insertWxUser(wxUser);
            return wxUser;
        }else {
            return wxUser1;
        }

    }

    @ResponseBody
    @RequestMapping("/updateWxUser")
    private void updateWxUser(WxUser wxUser) {
        System.out.println(wxUser);
        wxUserService.updateWxUser(wxUser);
    }

    @ResponseBody
    @RequestMapping("/queryWxUserByOpenId")
    private WxUser queryWxUserByOpenId(@Param("openId")String openId) {
       return wxUserService.queryWxUserByOpenId(openId);
    }
    }

