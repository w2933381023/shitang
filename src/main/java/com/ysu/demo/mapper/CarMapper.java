package com.ysu.demo.mapper;


import com.ysu.demo.bean.Car;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import java.util.List;
@Mapper
public interface CarMapper {
    void insertCar(Car car);
    void deleteCar(Integer carId);
    List<Car> queryAllCar();
    void saveOCRelation(@Param("orderId") Integer orderId, @Param("carId") Integer carId);
    Car queryCarById(Integer carId);
}
