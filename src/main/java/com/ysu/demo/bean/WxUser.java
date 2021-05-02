package com.ysu.demo.bean;

import lombok.*;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class WxUser {
    private Integer wxId;
    private String openId;
    private String userName;
    private String phoneNumber;
}
