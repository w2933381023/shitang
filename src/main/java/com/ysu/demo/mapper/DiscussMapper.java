package com.ysu.demo.mapper;


import com.ysu.demo.bean.Discuss;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface DiscussMapper {
    void insertDiscuss(Discuss discuss);
//    void deleteDiscuss(Integer discussId);
//    void updateDiscuss(Discuss discuss);
//    List<Discuss> queryAllDiscuss();
//    Discuss queryDiscussById(Integer discussId);
//    List<Discuss> queryDiscussByDishesId(Integer dishesId);
//    List<Discuss> queryDiscussByDishesName(String dishesName);
}
