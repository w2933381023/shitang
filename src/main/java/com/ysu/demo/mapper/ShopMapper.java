package com.ysu.demo.mapper;



import com.ysu.demo.bean.Shop;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface ShopMapper {
    void insertShop(Shop shop);
    void deleteShop(int shopId);
    void updateShop(Shop shop);
    List<Shop> queryAllShop();
    Shop queryShopById(Integer shopId);
    List<Shop> queryShopByName(String shopName);
    Shop shopIsExist(Shop shop);
    List<Shop> shopSales();
}
