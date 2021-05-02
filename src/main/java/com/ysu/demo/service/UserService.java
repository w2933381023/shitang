package com.ysu.demo.service;



import com.ysu.demo.bean.User;

import java.util.List;

public interface UserService {
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
