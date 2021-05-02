package com.ysu.demo.service;



import com.ysu.demo.bean.Shop;

import java.util.List;

public interface ShopService {
    void insertShop(Shop shop);
    void deleteShop(int shopId);
    void updateShop(Shop shop);
    List<Shop> queryAllShop();
    Shop queryShopById(Integer shopId);
    List<Shop> queryShopByName(String shopName);
    Shop shopIsExist(Shop shop);
    List<Shop> shopSales();
}
