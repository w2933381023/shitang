package com.ysu.demo.bean;

import lombok.*;

import java.math.BigDecimal;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Shop {
    private Integer shopId;
    private String shopName;
    private String masterName;
    private String contactNumber;
    private String shopIntroduction;
    private Integer shopState;
    private Integer roleId;
    private Integer userId;
    private Integer sale;
    private String shopImage;
    private BigDecimal score;
}
