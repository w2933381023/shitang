package com.ysu.demo.service;


import com.ysu.demo.bean.WxUser;

public interface WxUserService {
    void insertWxUser(WxUser wxUser);
    WxUser wxUserIsExist(String openId);
    void updateWxUser(WxUser wxUser);
    WxUser queryWxUserByOpenId(String openId);
}
