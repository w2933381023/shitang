package com.ysu.demo.service;


import com.ysu.demo.bean.Goods;

import java.util.List;

public interface GoodsService {
    void insertGoods(Goods goods);
    void deleteGoods(Integer goodsId);
    List<Goods> queryAllGoods();
    Goods queryGoodsById(Integer goodsId);
    List<Goods> queryGoodsByShopId(Integer shopId);
}
