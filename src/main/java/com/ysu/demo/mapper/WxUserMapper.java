package com.ysu.demo.mapper;


import com.ysu.demo.bean.WxUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface WxUserMapper {
    void insertWxUser(WxUser wxUser);
    WxUser wxUserIsExist(String openId);
    void updateWxUser(WxUser wxUser);
    WxUser queryWxUserByOpenId(String openId);

}
