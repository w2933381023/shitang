package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Goods;
import com.ysu.demo.mapper.GoodsMapper;
import com.ysu.demo.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public void insertGoods(Goods goods) {
        goodsMapper.insertGoods(goods);
    }

    @Override
    public void deleteGoods(Integer goodsId) {
        goodsMapper.deleteGoods(goodsId);
    }

    @Override
    public List<Goods> queryAllGoods() {
        return goodsMapper.queryAllGoods();
    }

    @Override
    public Goods queryGoodsById(Integer goodsId) {
        return goodsMapper.queryGoodsById(goodsId);
    }

    @Override
    public List<Goods> queryGoodsByShopId(Integer shopId) {
        return goodsMapper.queryGoodsByShopId(shopId);
    }
}
