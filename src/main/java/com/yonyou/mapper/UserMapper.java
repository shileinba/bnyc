package com.yonyou.mapper;

import com.yonyou.pojo.BcsData;
import com.yonyou.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    List<User> selectall();
    User selectlogin();

    BcsData selectBcsData(String tableName);
}