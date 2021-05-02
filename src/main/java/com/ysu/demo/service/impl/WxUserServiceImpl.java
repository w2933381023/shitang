package com.ysu.demo.service.impl;


import com.ysu.demo.bean.WxUser;
import com.ysu.demo.mapper.WxUserMapper;
import com.ysu.demo.service.WxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WxUserServiceImpl implements WxUserService {
    @Autowired
    private WxUserMapper wxUserMapper;
    @Override
    public void insertWxUser(WxUser wxUser) {
        wxUserMapper.insertWxUser(wxUser);
    }

    @Override
    public WxUser wxUserIsExist(String openId) {
        return wxUserMapper.wxUserIsExist(openId);
    }

    @Override
    public void updateWxUser(WxUser wxUser) {
        wxUserMapper.updateWxUser(wxUser);
    }

    @Override
    public WxUser queryWxUserByOpenId(String openId) {
        return wxUserMapper.queryWxUserByOpenId(openId);
    }
}
