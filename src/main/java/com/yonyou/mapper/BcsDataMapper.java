package com.yonyou.mapper;

import com.yonyou.pojo.BcsData;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BcsDataMapper {

    BcsData selectBcsRepeatData(String tableName);

    void deleteBcsRepeatData(String tableName);

}
