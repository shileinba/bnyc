package com.yonyou.service;

import com.yonyou.mapper.UserMapper;
import com.yonyou.pojo.User;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> getUserList() {
        List<User> userList = userMapper.selectall();
        return userList;
    }
}
