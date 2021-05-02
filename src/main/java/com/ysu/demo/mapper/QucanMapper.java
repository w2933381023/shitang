package com.ysu.demo.mapper;



import com.ysu.demo.bean.Qucan;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface QucanMapper {
  void insertQucan(Qucan qucan);
  void deleteQucan(Integer qucanId);
  void updateQucan(Qucan qucan);
  List<Qucan> queryAllQucan();
  List<Qucan> queryQucanByUserId(String userId);
}
