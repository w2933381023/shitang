package com.ysu.demo.service.impl;



import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.ysu.demo.bean.User;
import com.ysu.demo.mapper.UserMapper;
import com.ysu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);

    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);

    }

    @Override
    public void deleteUser(int userId) {
        userMapper.deleteUser(userId);
    }

    @Override
    public User userIsLogin(User user) {
        System.out.println("111");
        return userMapper.userIsLogin(user);
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public User queryUserById(int userId) {
        return userMapper.queryUserById(userId);
    }

    @Override
    public List<User> queryUserByName(String userName) {
        return userMapper.queryUserByName(userName);
    }

    @Override
    public User userIsExist(User user) {
        return userMapper.userIsExist(user);
    }

    @Override
    public void userSafe(User user){
        userMapper.userSafe(user);
    }

}

