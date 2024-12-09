package com.yonyou.controller;

import com.yonyou.pojo.BcsData;
import com.yonyou.service.BcsDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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

    @RequestMapping("/delBcsRepeatTable")
    public String delBcsRepeatTable(){
        List<BcsData> bcsDataList = bcsDataService.getBcsRepeatDataTableList();
        if(bcsDataList != null && bcsDataList.size() > 0){
            bcsDataService.deleteBCSRepeat(bcsDataList);
            return "删除成功！";
        }else{
            return " 没有要删除的重复数据表！";
        }
    }
}
