package com.yonyou.controller;

import com.yonyou.pojo.User;
import com.yonyou.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//@Tag(name = "用户查询")
//@RestController
public class UserController {

    //@Autowired
    private UserService userService;

    @GetMapping("/")
    public List getUserLis(){
        List<User> userList = userService.getUserList();

        return userList;
    }
}
