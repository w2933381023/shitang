package com.ysu.demo.bean;

import lombok.*;

import java.util.List;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Goods {
    private Integer goodsId;
    private Integer shopId;
    private String goodsName;
    private List<Dishes> dishesList;
}
