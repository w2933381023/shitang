package com.ysu.demo.bean;

import lombok.*;

import java.math.BigDecimal;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Dishes {
    private Integer dishesId;
    private String dishesName;
    private Integer dishesSellNumber;
    private String dishesIntroduction;
    private Integer dishesState;
    private BigDecimal dishesPrice;
    private Integer shopId;
    private String shopName;
    private Integer count;
    private Integer goodsId;
    private String dishesImage;
}
