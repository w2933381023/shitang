package com.ysu.demo.service;


import com.ysu.demo.bean.Qucan;
import org.springframework.stereotype.Service;

import java.util.List;

public interface QucanService {
    void insertQucan(Qucan qucan);
    void deleteQucan(Integer qucanId);
    void updateQucan(Qucan qucan);
    List<Qucan> queryAllQucan();
    List<Qucan> queryQucanByUserId(String userId);
}
