package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Car;
import com.ysu.demo.mapper.CarMapper;
import com.ysu.demo.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;
    @Override
    public void insertCar(Car car) {
        carMapper.insertCar(car);
    }

    @Override
    public void deleteCar(Integer carId) {
        carMapper.deleteCar(carId);

    }

    @Override
    public List<Car> queryAllCar() {
        return carMapper.queryAllCar();
    }

    @Override
    public void saveOCRelation(Integer orderId, Integer carId) {
        carMapper.saveOCRelation(orderId,carId);

    }

    @Override
    public Car queryCarById(Integer carId) {
        return carMapper.queryCarById(carId);
    }
}
