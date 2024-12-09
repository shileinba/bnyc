package com.yonyou.service;

import com.yonyou.pojo.BcsData;
import com.yonyou.pojo.User;

import java.util.List;

public interface BcsDataService {

    List<BcsData> getBcsRepeatDataTableList();

    String deleteBCSRepeat(List<BcsData> bcsDataList);

}
