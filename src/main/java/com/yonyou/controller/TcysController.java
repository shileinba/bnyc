package com.yonyou.controller;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.pojo.BcsData;
import com.yonyou.service.BcsDataService;
import com.yonyou.service.TcysDataService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "剔除因素管理",description = "")
@RestController
public class TcysController {

    @Autowired
    private TcysDataService tcysDataService;

    @Operation(summary = "查询有大于一条数据的剔除因素",description = "查询有大于一条数据的剔除因素")
    @GetMapping("/getTcysDataGt2")
    public JSONObject getTcysDataGt2(){
        String hc = tcysDataService.selectTcysDataGt2();
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("info", "success");
        jsonObject.put("index_code", hc);

        return jsonObject;
    }
}
