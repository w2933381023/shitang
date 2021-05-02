package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Shop;
import com.ysu.demo.mapper.ShopMapper;
import com.ysu.demo.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopMapper shopMapper;
    @Override
    public void insertShop(Shop shop) {
        shopMapper.insertShop(shop);
    }

    @Override
    public void deleteShop(int shopId) {
        shopMapper.deleteShop(shopId);

    }

    @Override
    public void updateShop(Shop shop) {
        shopMapper.updateShop(shop);
    }

    @Override
    public List<Shop> queryAllShop() {
        return shopMapper.queryAllShop();
    }

    @Override
    public Shop queryShopById(Integer shopId) {
        return shopMapper.queryShopById(shopId);
    }

    @Override
    public List<Shop> queryShopByName(String shopName) {
        return shopMapper.queryShopByName(shopName);
    }

    @Override
    public Shop shopIsExist(Shop shop) {
        return shopMapper.shopIsExist(shop);
    }

    @Override
    public List<Shop> shopSales() {
        return shopMapper.shopSales();
    }
}
