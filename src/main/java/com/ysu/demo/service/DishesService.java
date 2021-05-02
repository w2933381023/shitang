package com.ysu.demo.service;

import com.ysu.demo.bean.Dishes;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface DishesService {
    void insertDishes(Dishes dishes);
    void deleteDishes(Integer dishesId);
    List<Dishes> queryAllDishes();
    Dishes queryDishesById(Integer dishesId);
    List<Dishes> queryDishesByName(String dishesName);
    void updateDishes(Dishes dishes);
    Dishes dishesIsExist(Dishes dishes);
    List<Dishes> queryDishesByShopId(Integer shopId);
    List<Dishes> queryDishesByGoodsId(Integer goodsId);
    List<Dishes> queryDishesByState(Integer dishesState);
    List<Dishes> queryDishesByShopName1(String shopName);
    List<Dishes> queryDishesByShopName2(@Param("shopName") String shopName, @Param("dishesState") Integer dishesState);
    //店名加菜品名查询菜品
    Dishes queryDishesBySnAndDn(@Param("shopId") Integer shopId, @Param("dishesName") String dishesName);
}
