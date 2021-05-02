package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Qucan;
import com.ysu.demo.mapper.QucanMapper;
import com.ysu.demo.service.QucanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class QucanServiceImpl implements QucanService {
    @Autowired
    private QucanMapper qucanMapper;
    @Override
    public void insertQucan(Qucan qucan) {
        qucanMapper.insertQucan(qucan);
    }

    @Override
    public void deleteQucan(Integer qucanId) {
        qucanMapper.deleteQucan(qucanId);
    }

    @Override
    public void updateQucan(Qucan qucan) {
        qucanMapper.updateQucan(qucan);

    }

    @Override
    public List<Qucan> queryAllQucan() {
        return qucanMapper.queryAllQucan();
    }

    @Override
    public List<Qucan> queryQucanByUserId(String userId) {
        return qucanMapper.queryQucanByUserId(userId);
    }
}
