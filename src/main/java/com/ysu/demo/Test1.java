package com.ysu.demo;

import com.ysu.demo.bean.Dishes;
import com.ysu.demo.mapper.DishesMapper;
import com.ysu.demo.service.DishesService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class Test1 {
@Autowired
private DishesMapper dishesMapper;
    @Test
    public void  t1(){
      dishesMapper.queryDishesBySnAndDn(1,"牛肉面");
    }
}
