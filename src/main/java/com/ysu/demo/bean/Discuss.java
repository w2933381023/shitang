package com.ysu.demo.bean;

import lombok.*;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Discuss {
    private Integer discussId;
    private String discussContent;
    private String discussTime;
    private Integer shopId;
    private
    //商家实体类
    private Shop shop;
    //微信用户实体类
    private WxUser wxUser;
    //菜品实体类
    private Dishes dishes;
}
