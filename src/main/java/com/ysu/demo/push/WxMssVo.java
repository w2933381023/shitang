package com.ysu.demo.push;

import com.alibaba.fastjson.JSONObject;
import lombok.*;

import java.util.Map;

/*
 * 小程序推送所需数据
 * 编程小石头
 * */
@Data
@Getter
@Setter
@NoArgsConstructor@AllArgsConstructor
public class WxMssVo {
    private String touser;//用户openid
    private String template_id;//订阅消息模版id
    private String page = "pages/index/index";//默认跳到小程序首页
    private JSONObject data;//推送文字
}