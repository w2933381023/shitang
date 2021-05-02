package com.ysu.demo.push;

import lombok.*;

/*
 * 编程小石头
 * 用来封装订阅消息内容
 * */
@Data
@Setter
@Getter
@NoArgsConstructor
public class TemplateData {
    private String value;//
    public TemplateData(String value) {
        this.value = value;
    }

}