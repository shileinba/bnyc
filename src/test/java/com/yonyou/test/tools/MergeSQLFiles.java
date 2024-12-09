package com.yonyou.test.tools;

import com.yonyou.tools.DateUtils;
import com.yonyou.tools.MergeFiles;

import java.util.Date;

public class MergeSQLFiles {

    public static void main(String args[]) {
        String parentPath = "F:/demo/bnyc/SQL脚本/00_all";
//        String[] inputFiles = {
//                "./SQL脚本/00_all/xuefeng/ods建表语句-史磊修改20241107.sql",
//                "./SQL脚本/00_all/90-ODS建表及切换语句.sql",
//                "./SQL脚本/00_all/xuefeng/ads建表语句-史磊修改20241112.sql",
//                "./SQL脚本/00_all/91-ADS表SQL语句.sql",
//                "./SQL脚本/00_all/92-ADS表-资产.sql",
//                "./SQL脚本/00_all/93-ADS表-预算.sql",
//                "./SQL脚本/00_all/94-ADS表-全年预算.sql",
//                "./SQL脚本/00_all/01-智能报告ADS.sql",
//                "./SQL脚本/00_all/95-ADS表-剔除数据表.sql"
//        }; // 相对路径的输入文件列表

        String[] inputFiles = {
                "/xuefeng/ods建表语句-史磊修改20241107.sql",
                "/90-ODS建表及切换语句.sql",
                "/xuefeng/ads建表语句-史磊修改20241112.sql",
                "/91-ADS表SQL语句.sql",
                "/92-ADS表-资产.sql",
                "/93-ADS表-预算.sql",
                "/94-ADS表-全年预算.sql",
                "/01-智能报告ADS.sql",
                "/95-ADS表-剔除数据表.sql"
        }; // 绝对路径的输入文件列表
        String prefix = "./SQL脚本/00_all/";
        String fileName = "mergedFile_";
        String dateStr = DateUtils.formatTime(new Date(),"yyyyMMdd_HHmmss");
        String suffix = ".sql";
        String outputFile = prefix + fileName + dateStr + suffix; // 输出文件

        MergeFiles mf = new MergeFiles();
//        mf.listCurrentPathFile();
        mf.merge(parentPath, inputFiles, outputFile);

        System.out.println("[success] generate new SQL named " + outputFile);
    }
}
