package com.ysu.demo.mapper;



import com.ysu.demo.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface UserMapper {
     void insertUser(User user);
     void updateUser(User user);
     void deleteUser(int userId);
     User userIsLogin(User user);
     List<User> queryAllUser();
     User queryUserById(int userId);
     List<User> queryUserByName(String userName);
     User userIsExist(User user);
     void userSafe(User user);
}
