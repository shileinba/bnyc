package com.yonyou.tools;

import java.io.*;
import java.util.Date;

public class MergeFiles {
    public String merge(String parentPath){
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
        String fileName = "mergedFile_";
        String dateStr = DateUtils.formatTime(new Date(),"yyyyMMdd_HHmmss");
        String suffix = ".sql";
        String outputFile = fileName + dateStr + suffix; // 输出文件
        String outputFilePathName = parentPath + "/sql_merged/" + outputFile;
        merge(parentPath , inputFiles, outputFilePathName);
//        testMerge(parentPath , inputFiles, outputFilePathName);
        return outputFilePathName;
    }

    private void merge(String parentPath ,String[] inputFileNames, String outputFileName) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFileName))) {
            for (String fileName : inputFileNames) {
                try (BufferedReader reader = new BufferedReader(new FileReader(parentPath + fileName))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        writer.write(line);
                        writer.newLine();
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void testMerge(String parentPath ,String[] inputFileNames, String outputFileName) {
        listCurrentPathFile("../webapps/bnyc_prd/sql_script");

        try  {
            for (String fileName : inputFileNames) {
                try (BufferedReader reader = new BufferedReader(new FileReader(parentPath + fileName))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        System.out.println(line);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void listCurrentPathFile(String pathName) {
        // 获取当前目录
        File currentDir = new File(pathName);

        // 获取当前目录下的所有文件和文件夹
        File[] files = currentDir.listFiles();

        // 检查文件数组是否为空以及是否存在文件
        if (files != null && files.length > 0) {
            // 遍历文件数组并打印每个文件和文件夹的名称
            for (File file : files) {
                System.out.println(file.getName());
            }
        } else {
            System.out.println("目录为空或者无法访问");
        }
    }

    public static void main(String[] args) {
        MergeFiles mf = new MergeFiles();
        String pathName = "../..";
        mf.listCurrentPathFile(pathName);


    }

}
