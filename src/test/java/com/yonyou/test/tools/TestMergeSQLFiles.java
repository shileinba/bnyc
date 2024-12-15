package com.yonyou.test.tools;

import com.yonyou.tools.DateUtils;
import com.yonyou.tools.MergeFiles;

import java.util.Date;

public class TestMergeSQLFiles {

    public static void main(String args[]) {
        String currentPath = System.getProperty("user.dir");
        System.out.println("当前执行路径: " + currentPath);
        String parentPath = "./src/main/sql_script/sql_script";  // notice: two script path is right .
        String fileName = "mergedFile_";
        String dateStr = DateUtils.formatTime(new Date(),"yyyyMMdd_HHmmss");
        String suffix = ".sql";
        String outputFile = fileName + dateStr + suffix; // 输出文件

        MergeFiles mf = new MergeFiles();
        mf.merge(parentPath);
        System.out.println("[success] generate new SQL named " + outputFile);
    }
}
