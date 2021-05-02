package com.ysu.demo.service;


import com.ysu.demo.bean.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarService {
    void insertCar(Car car);
    void deleteCar(Integer carId);
    List<Car> queryAllCar();
    void saveOCRelation(@Param("orderId") Integer orderId, @Param("carId") Integer carId);
    Car queryCarById(Integer carId);
}
