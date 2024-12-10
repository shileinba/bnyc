package com.yonyou.controller;

import com.yonyou.pojo.BcsData;
import com.yonyou.service.BcsDataService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

@Tag(name = "BCS数据管理",description = "")
@RestController
public class BcsDataController {

    @Autowired
    private BcsDataService bcsDataService;

    @Operation(summary = "查询有重复数据的BCS表",description = "查询有重复数据的BCS表")
    @GetMapping("/getBcsRepeatTable")
    public JSONObject getBcsRepeatTable(@RequestParam String year,@RequestParam String orgCode,@RequestParam String month) {
        List<BcsData> bcsDataList = bcsDataService.getBcsRepeatDataTableList(year,orgCode,month);
        JSONObject jsonObject = new JSONObject();
        if(bcsDataList != null && bcsDataList.size() > 0) {
            jsonObject.put("info", "success");
            jsonObject.put("data", bcsDataList);
        }else{
            jsonObject.put("info", "no data return.");
        }
        return jsonObject;
    }

    @Operation(summary = "删除有重复数据的BCS表",description = "删除有重复数据的BCS表")
    @DeleteMapping("/delBcsRepeatTable")
    public JSONObject delBcsRepeatTable(@RequestParam String year,@RequestParam String orgCode,@RequestParam String month){
        List<BcsData> bcsDataList = bcsDataService.getBcsRepeatDataTableList(year,orgCode,month);
        JSONObject jsonObject = new JSONObject();
        if(bcsDataList != null && bcsDataList.size() > 0){
            bcsDataService.deleteBCSRepeat(bcsDataList);
            jsonObject.put("info", "删除成功");
        }else{
            jsonObject.put("info", "没有要删除的重复数据表");
        }
        return jsonObject;
    }
}
