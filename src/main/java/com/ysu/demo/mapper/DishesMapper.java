package com.ysu.demo.mapper;


import com.ysu.demo.bean.Dishes;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface DishesMapper {
    void insertDishes(Dishes dishes);
    void deleteDishes(int dishesId);
    void updateDishes(Dishes dishes);
    List<Dishes> queryAllDishes();
    Dishes queryDishesById(Integer dishesId);
    List<Dishes> queryDishesByName(String dishesName);
    Dishes dishesIsExist(Dishes dishes);
    List<Dishes> queryDishesByShopId(Integer shopId);
    List<Dishes> queryDishesByGoodsId(Integer goodsId);
    List<Dishes> queryDishesByState(Integer dishesState);
    List<Dishes> queryDishesByShopName1(String shopName);
    List<Dishes> queryDishesByShopName2(@Param("shopName") String shopName, @Param("dishesState") Integer dishesState);
    //店名加菜品名查询菜品
    Dishes queryDishesBySnAndDn(@Param("shopId")Integer shopId, @Param("dishesName") String dishesName);

}
