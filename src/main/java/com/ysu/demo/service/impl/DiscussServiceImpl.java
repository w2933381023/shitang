package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Discuss;
import com.ysu.demo.mapper.DiscussMapper;
import com.ysu.demo.service.DiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DiscussServiceImpl implements DiscussService {
    @Autowired
    private DiscussMapper discussMapper;
    @Override
    public void insertDiscuss(Discuss discuss) {
        discussMapper.insertDiscuss(discuss);
    }

//    @Override
//    public void deleteDiscuss(Integer discussId) {
//        discussMapper.deleteDiscuss(discussId);
//
//    }
//
//    @Override
//    public void updateDiscuss(Discuss discuss) {
//        discussMapper.updateDiscuss(discuss);
//    }
//
//    @Override
//    public List<Discuss> queryAllDiscuss() {
//        return discussMapper.queryAllDiscuss();
//    }
//
//    @Override
//    public Discuss queryDiscussById(Integer discussId) {
//        return discussMapper.queryDiscussById(discussId);
//    }
//
//    @Override
//    public List<Discuss> queryDiscussByDishesId(Integer dishesId) {
//        return discussMapper.queryDiscussByDishesId(dishesId);
//    }
//
//    @Override
//    public List<Discuss> queryDiscussByDishesName(String dishesName) {
//        return discussMapper.queryDiscussByDishesName(dishesName);
//    }
}
