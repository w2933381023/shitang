package com.ysu.demo.bean;

import lombok.*;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OpenIdJson {
    private String openid;
    private String session_key;
    private String errcode;
    private String errmsg;
}
