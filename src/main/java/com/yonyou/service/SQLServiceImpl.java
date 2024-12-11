package com.yonyou.service;


import com.yonyou.mapper.BcsDataMapper;
import com.yonyou.mapper.SQLMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SQLServiceImpl implements SQLService {

    @Autowired
    SQLMapper sqlMapper;

    @Override
    public void executeBudgetSQL() {
        sqlMapper.executeMultipleStatements();
    }
}
