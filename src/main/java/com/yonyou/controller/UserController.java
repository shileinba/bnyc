package com.yonyou.controller;

import com.yonyou.pojo.User;
import com.yonyou.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public List index(){
        List<User> userList = userService.getUserList();

        return userList;
    }
}
