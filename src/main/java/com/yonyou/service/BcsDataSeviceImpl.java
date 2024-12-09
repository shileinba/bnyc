package com.yonyou.service;

import com.yonyou.mapper.BcsDataMapper;
import com.yonyou.pojo.BcsData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BcsDataSeviceImpl implements BcsDataService {

    private String[] tableNames = {
            "ybsr009__zybsr009_01",
            "ybcb008__zybcb008",
            "ybzc031__zybzc031",
            "ybzc031__zybzc031_1",
            "ybcb020__zybcb020_01",
            "ybcb021__zybcb021_01",
            "ygl0105__zygl0105",
            "ybgl017__zybgl017",
            "ybcb023__zybcb023",
            "ybcb010__zybcb010",
            "ybcb022__zybcb022",
            "ybcb026__zybcb026",
            "ybcb040__zybcb040",
            "ybcb013__zybcb013",
            "ygl0027__zygl0027",
            "ybfz007__zybfz007",
            "ybcb009__zybcb009",
            "ybcb019__zybcb019_01",
            "yzb0002__zyzb0002",
            "ybzb002__zybzb002",
            "ybcb039__zybcb039",
            "ybcb016__zybcb016",
            "ygl0071__zygl0071",
            "ybzc010__zybzc010",
            "ygl0100__zygl0100",
            "ygl0078__zygl0078",
            "yzb0003__zyzb0003",
            "ygl0072__zygl0072",
            "ygl0106__zygl0106",
            "ybzc022__zybzc022",
            "ygl0070__zygl0070",
            "yzb0102__zyzb0102",
            "ybzb003__zybzb003",
            "ygl0083__zygl0083"
    };

    @Autowired
    BcsDataMapper bcsDataMapper;

    @Override
    public List<BcsData> getBcsRepeatDataTableList() {
        List<BcsData> bcsDataList = new ArrayList<BcsData>();
        for(String tableName : tableNames){
            BcsData bcsData = bcsDataMapper.selectBcsRepeatData(tableName);
            bcsDataList.add(bcsData);
        }

        return bcsDataList;
    }

    @Override
    public String deleteBCSRepeat(List<String> tableNameList){
        List<BcsData> bcsDataList = new ArrayList<BcsData>();
        for(String tableName : tableNames){
            BcsData bcsData = bcsDataMapper.selectBcsRepeatData(tableName);
            bcsDataList.add(bcsData);
        }

        for (BcsData bcsData : bcsDataList) {
            String deleteTableName = bcsData.getTableName();
            System.out.println("[WARNING] : DELETE REPEAT TABLE NAME IS " + deleteTableName);
            bcsDataMapper.deleteBcsRepeatData(deleteTableName);
        }

        return "success";
    }
}
