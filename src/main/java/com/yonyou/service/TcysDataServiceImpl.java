package com.yonyou.service;

import com.yonyou.mapper.BcsDataMapper;
import com.yonyou.mapper.TcysDataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TcysDataServiceImpl implements TcysDataService {

    @Autowired
    TcysDataMapper tcysDataMapper;

    @Override
    public String selectTcysDataGt2() {
        String hc = tcysDataMapper.selectTcysDataGt2();
        return hc;
    }
}
