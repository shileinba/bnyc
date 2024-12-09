package com.yonyou.test.mybatis;

import com.yonyou.mapper.UserMapper;
import com.yonyou.pojo.BcsData;
import com.yonyou.pojo.User;
import com.yonyou.test.tools.BCSDataProcessor;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//import javax.annotation.Resources;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class TestMybatis {

    public static SqlSession sqlSession;

    public static void main(String[] args) throws IOException {
        // 定义资源文件名
        String resource = "mybatis_conf.xml";
//        String resource = "application.yml";

        // 通过Resources类获取资源文件的输入流
        InputStream inputStream = Resources.getResourceAsStream(resource);

        // 使用SqlSessionFactoryBuilder构建SqlSessionFactory对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        // 打开一个新的SqlSession
        sqlSession = sqlSessionFactory.openSession();


        TestMybatis tb = new TestMybatis();

        // 2024-12-09 ： 获取bcs11月出现重复数据的表。
        BCSDataProcessor bcsDataProcessor = new BCSDataProcessor();
        List<String> repeatTables = bcsDataProcessor.getBCSRepeat(sqlSession);

//        sqlSession = sqlSessionFactory.openSession();
//        bcsDataProcessor.deleteBCSRepeat(sqlSession,repeatTables);

//        sqlSession = sqlSessionFactory.openSession();
//        bcsDataProcessor.testDeleteBCSData(sqlSession);
    }

    public void selectUser(){
//         获取userMapper接口的实现类对象
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        // 调用login方法查询名为"id=1"的用户信息
        List<User> users = userMapper.selectall();
        // 将查询结果转换为字符串
        String s = users.toString();
        // 打印查询结果
        System.out.println(s);
    }


}
