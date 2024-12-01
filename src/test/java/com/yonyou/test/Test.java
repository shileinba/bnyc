package com.yonyou.test;

import com.yonyou.mapper.UserMapper;
import com.yonyou.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.annotation.Resources;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class Test {
    public static void main(String[] args) throws IOException {
        // 定义资源文件名
        String resource = "Mybatis-conf.xml";

        // 通过Resources类获取资源文件的输入流
        InputStream inputStream = Resources.getResourceAsStream(resource);

        // 使用SqlSessionFactoryBuilder构建SqlSessionFactory对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        // 打开一个新的SqlSession
        SqlSession sqlSession = sqlSessionFactory.openSession();

        // 获取userMapper接口的实现类对象
        userMapper users = sqlSession.getMapper(userMapper.class);

        // 调用login方法查询名为"id=1"的用户信息
        User login = users.selectlogin();

        // 将查询结果转换为字符串
        String s = login.toString();

        // 打印查询结果
        System.out.println(s);
    }
}
