package com.yonyou.service;

import com.yonyou.pojo.BcsData;
import java.util.List;

public interface BcsDataService {

    List<BcsData> getBcsRepeatDataTableList(String year,String orgCode,String month);

    String deleteBCSRepeat(List<BcsData> bcsDataList);

}
