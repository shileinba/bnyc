package com.yonyou.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TcysDataMapper {

    String selectTcysDataGt2();

}
