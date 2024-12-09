package com.yonyou.controller;

import com.yonyou.pojo.BcsData;
import com.yonyou.pojo.User;
import com.yonyou.service.BcsDataService;
import com.yonyou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class BcsDataController {

    @Autowired
    private BcsDataService bcsDataService;

    @RequestMapping("/getBcsRepeatTable")
    public List getBcsRepeatTable(){

        List<BcsData> bcsDataList = bcsDataService.getBcsRepeatDataTableList();

        return bcsDataList;
    }

}
