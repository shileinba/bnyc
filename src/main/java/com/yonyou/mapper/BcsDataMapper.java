package com.yonyou.mapper;

import com.yonyou.pojo.BcsData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BcsDataMapper {

    BcsData selectBcsRepeatData(@Param("tableName")String tableName, @Param("year") String year,@Param("orgCode")String orgCode,@Param("month")String month);

    void deleteBcsRepeatData(String tableName);

}
