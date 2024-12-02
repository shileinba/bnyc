package com.yonyou;

public class TestDataCenter {
    public static void main(String[] args){

        TestDataCenter tc = new TestDataCenter();
//        tc.generate0102HQ();
        tc.generate0102BO();
    }

    static String converterZ(int i ){
        String result = "";
        if(i < 10)
            result = "0" + i ;
        else
            result =  "" + i;
        // System.out.println("converter z i is " + i + "result == " + result );
        return result;
    }

    static String getDestIndexCode(int i ){
        String indexCode = "";
        if(i < 70)
            indexCode =  "" + i ;
        else
            indexCode =  "" + (i + 8);
        //System.out.println(" i is " + i + "  indexCode == " + indexCode );
        return indexCode;
    }

    /**
     * 资产负债表的汇总合并
     * @return
     */
    String generate0102HQ(){
        String sqlStrResult = "";

        String srcTableName = "data_center.yzb0102__zyzb0102 a \n";
        String destTableName = "data_center.ods_asset_balance_hq ";
        String refTable = "data_center.ods_asset_balance_ref \n";


        for(int i = 1 ;  i <= 148 ; i++){
            String sqlStr = "";
            sqlStr = "-- 第 " + i + " 条SQL语句\n";
            sqlStr += "insert into " + destTableName + "\n"
                    + "select \n"
                    + "b.org_code,\n"
                    + "b.org_name,\n"
                    + "(case when " +
                    "substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) " +
                    "else concat(per,'-',substr(a.ucode,9,2))  end),\n"
                    + "c.index_name,\n"
                    + "c.index_code,\n"
                    + "sum(case when rid = 1 then a.Z"
                    + converterZ(i)
                    + " else 0 end),\n"
                    + "sum(case when rid = 2 then a.Z"
                    + converterZ(i)
                    + " else 0 end),\n"
                    + "sum(case when rid = 3 then a.Z"
                    +converterZ(i)
                    + " else 0 end)\n"
                    + "from "
                    + srcTableName +
                    " left join data_center.ads_orgnization b\n" +
                    " on a.org = b.org_code\n" +
                    " left join " +
                    " ( select * from " + refTable + " where index_code = '" + getDestIndexCode(i)
                    + "') c on 1 = 1 \n"
                    + "  where a.org in ('GY2F00') \n"
                    + " and ucode like ('%_r') \n"
                    + " group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;"
                    + "\n";
            // System.out.println(sqlStr);
            sqlStrResult += sqlStr;
        }
        System.out.println(sqlStrResult);
        return sqlStrResult;
    }

    /**
     * 资产负债表的各厂矿
     * @return
     */
    String generate0102BO(){
        String sqlStrResult = "";

        String srcTableName = "data_center.yzb0102__zyzb0102 a \n";
        String destTableName = "data_center.ods_asset_balance_bo ";
        String refTable = "data_center.ods_asset_balance_ref \n";


        for(int i = 1 ;  i <= 148 ; i++){
            String sqlStr = "";
            sqlStr = "-- 第 " + i + " 条SQL语句\n";
            sqlStr += "insert into " + destTableName + "\n"
                    + "select \n"
                    + "b.org_code,\n"
                    + "b.org_name,\n"
                    + "(case when " +
                    "substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) " +
                    "else concat(per,'-',substr(a.ucode,9,2))  end),\n"
                    + "c.index_name,\n"
                    + "c.index_code,\n"
                    + "sum(case when rid = 1 then a.Z"
                    + converterZ(i)
                    + " else 0 end),\n"
                    + "sum(case when rid = 2 then a.Z"
                    + converterZ(i)
                    + " else 0 end),\n"
                    + "sum(case when rid = 3 then a.Z"
                    +converterZ(i)
                    + " else 0 end)\n"
                    + "from "
                    + srcTableName +
                    " left join data_center.ads_orgnization b\n" +
                    " on a.org = b.org_code\n" +
                    " left join " +
                    " ( select * from " + refTable + " where index_code = '" + getDestIndexCode(i)
                    + "') c on 1 = 1 \n"
                    + "  where a.org not in ('GY2F00')"
                    + " and ucode like ('%_r') \n"
                    + " group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;"
                    + "\n";
            // System.out.println(sqlStr);
            sqlStrResult += sqlStr;
        }
        System.out.println(sqlStrResult);
        return sqlStrResult;
    }
}
