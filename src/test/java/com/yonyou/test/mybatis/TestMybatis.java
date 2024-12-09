package com.yonyou.test.mybatis;

import com.yonyou.mapper.UserMapper;
import com.yonyou.pojo.BcsData;
import com.yonyou.pojo.User;
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

        // 通过Resources类获取资源文件的输入流
        InputStream inputStream = Resources.getResourceAsStream(resource);

        // 使用SqlSessionFactoryBuilder构建SqlSessionFactory对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        // 打开一个新的SqlSession
        sqlSession = sqlSessionFactory.openSession();


        TestMybatis tb = new TestMybatis();
        tb.testBCSRepeat();

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

    public void testBCSRepeat(){
        String[] tableNames = {
                "ybsr009__zybsr009_01",
                "ybcb008__zybcb008",
                "ybzc031__zybzc031",
                "ybzc031__zybzc031_1",
                "ybcb020__zybcb020_01",
                "ybcb021__zybcb021_01",
                "ygl0105__zygl0105",
                "ybgl017__zybgl017",
                "ybcb023__zybcb023",
                "ybcb010__zybcb010",
                "ybcb022__zybcb022",
                "ybcb026__zybcb026",
                "ybcb040__zybcb040",
                "ybcb013__zybcb013",
                "ygl0027__zygl0027",
                "ybfz007__zybfz007",
                "ybcb009__zybcb009",
                "ybcb019__zybcb019_01",
                "yzb0002__zyzb0002",
                "ybzb002__zybzb002",
                "ybcb039__zybcb039",
                "ybcb016__zybcb016",
                "ygl0071__zygl0071",
                "ybzc010__zybzc010",
                "ygl0100__zygl0100",
                "ygl0078__zygl0078",
                "yzb0003__zyzb0003",
                "ygl0072__zygl0072",
                "ygl0106__zygl0106",
                "ybzc022__zybzc022",
                "ygl0070__zygl0070",
                "yzb0102__zyzb0102",
                "ybzb003__zybzb003",
                "ygl0083__zygl0083"

        };

        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        String sql_prefix = "select\n" +
                "\tucode ,\n" +
                "\tper,\n" +
                "\tcount(rid)\n" +
                "from \n";
        String sql_suffix =
                " where per  = '2024' and ucode like 'GY2F00_011%'\n" +
                        "and rid  = '1'\n" +
                        "group by rid,ucode,per \n" +
                        "having count(rid)  > 1\n";
        List<BcsData> bcsDataList = new ArrayList<BcsData>();
        try {
            for(String tableName : tableNames){
                BcsData bcsData = userMapper.selectBcsData(tableName);
                if(bcsData != null && Integer.parseInt(bcsData.getCount()) >  1)
                    bcsData.setTableName(tableName);
                    bcsDataList.add(bcsData);
            }

        } finally {
            sqlSession.close();
        }

        for(BcsData bcsData : bcsDataList){
            if(bcsData == null)
                continue;
            System.out.println(bcsData.toString());
        }

    }
}
