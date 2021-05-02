package com.ysu.demo.mapper;



import com.ysu.demo.bean.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface GoodsMapper {
    void insertGoods(Goods goods);
    void deleteGoods(Integer goodsId);
    List<Goods> queryAllGoods();
    Goods queryGoodsById(Integer goodsId);
    List<Goods> queryGoodsByShopId(Integer shopId);

}
