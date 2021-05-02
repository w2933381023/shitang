package com.ysu.demo.bean;

import lombok.*;
import java.math.BigDecimal;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Car {
    private Integer carId;
    private Integer dishesNumber;
    private Integer dishesId;
    private String dishesName;
    private BigDecimal dishesPrice;
    private String dishesImage;
}
