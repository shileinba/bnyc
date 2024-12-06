package com.yonyou.tools;

import java.io.*;

public class MergeFiles {

    public void merge(String[] inputFiles, String outputFile) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))) {
            for (String file : inputFiles) {
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
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

    public void listCurrentPathFile() {
        // 获取当前目录
        File currentDir = new File(".");

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

}
