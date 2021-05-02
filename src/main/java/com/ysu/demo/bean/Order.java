package com.ysu.demo.bean;

import lombok.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Order {
    private Integer orderId;
    private String orderTime;
    private String phoneNumber;
    private String userTrueName;
    private Integer shopId;
    private String shopName;
    private Integer orderState;
    private BigDecimal orderPrice;
    private String dishesName;
    private Integer dishesCount;
    private String orderExtra;
    private String qcTime;
    //订单号
    private String orderNumber;
    private String shopImage;
    private String userId;
    private List<Car> cars=new ArrayList<Car>();
}
