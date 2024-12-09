package com.yonyou.test.tools;

import org.apache.ibatis.session.SqlSession;

public class BCSDataProcessor {

    public static void main(){
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
        String[] tableNames = {"ygl0078__zygl0078","yzb0102__zyzb0102"};

        for(String tableName : tableNames){
            String sql = sql_prefix + tableName + sql_suffix;

        }



    }

}
