package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Dishes;
import com.ysu.demo.mapper.DishesMapper;
import com.ysu.demo.service.DishesService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
@Service
public class DishesServiceImpl implements DishesService {
    @Autowired
    private DishesMapper dishesMapper;
    @Override
    public void insertDishes(Dishes dishes) {
        dishesMapper.insertDishes(dishes);
    }

    @Override
    public void deleteDishes(Integer dishesId) {
        dishesMapper.deleteDishes(dishesId);

    }

    @Override
    public List<Dishes> queryAllDishes() {
        return dishesMapper.queryAllDishes();
    }

    @Override
    public Dishes queryDishesById(Integer dishesId) {
        return dishesMapper.queryDishesById(dishesId);
    }

    @Override
    public List<Dishes> queryDishesByName(String dishesName) {
        return dishesMapper.queryDishesByName(dishesName);
    }

    @Override
    public void updateDishes(Dishes dishes) {
        dishesMapper.updateDishes(dishes);
    }

    @Override
    public Dishes dishesIsExist(Dishes dishes) {
        return dishesMapper.dishesIsExist(dishes);
    }


    @Override
    public List<Dishes> queryDishesByShopId(Integer shopId) {
        return dishesMapper.queryDishesByShopId(shopId);
    }

    @Override
    public List<Dishes> queryDishesByGoodsId(Integer goodsId) {
        return dishesMapper.queryDishesByGoodsId(goodsId);
    }

    @Override
    public List<Dishes> queryDishesByState(Integer dishesState) {
        return dishesMapper.queryDishesByState(dishesState);
    }

    @Override
    public List<Dishes> queryDishesByShopName1(String shopName) {
        return dishesMapper.queryDishesByShopName1(shopName);
    }

    @Override
    public List<Dishes> queryDishesByShopName2(String shopName, Integer dishesState) {
        return dishesMapper.queryDishesByShopName2(shopName,dishesState);
    }

    @Override
    public Dishes queryDishesBySnAndDn(Integer shopId, String dishesName) {
        System.out.println("...123");
        return dishesMapper.queryDishesBySnAndDn(shopId,dishesName);
    }
}
