package com.yonyou.controller;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.service.SQLService;
import com.yonyou.service.TcysDataService;
import com.yonyou.tools.DateUtils;
import com.yonyou.tools.MergeFiles;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.net.URLEncoder;
import java.util.Date;

@Tag(name = "SQL脚本下载", description = "下载SQL脚本")
@RestController
public class SQLController {

    @Autowired
    private SQLService sqlService;

    @Operation(summary = "下载SQL脚本",description = "下载SQL脚本")
    @GetMapping("/sql/download")
    public void download(HttpServletResponse response) throws IOException {
        // 指定要下载的文件
        //File file = ResourceUtils.getFile("classpath:2.zip");

        String fileName = mergeFile();

        File file = ResourceUtils.getFile(fileName);  // "./SQL脚本/00_all/mergedFile_20241211_145528.sql"
        //文件名编码，防止中文乱码
        String filename = URLEncoder.encode(file.getName(), "UTF-8");
        // 设置响应头信息
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        // 内容类型为通用类型，表示二进制数据流
        response.setContentType("application/octet-stream");
        // 循环，边读取边输出，可避免大文件时OOM
        try (InputStream inputStream = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
            byte[] bytes = new byte[1024];
            int readLength;
            while ((readLength = inputStream.read(bytes)) != -1) {
                os.write(bytes, 0, readLength);
            }
        }
    }

    private String mergeFile(){
        String parentPath = "../webapps/bnyc_prd/sql_script";
        MergeFiles mf = new MergeFiles();

        String outputFilePathName = mf.merge(parentPath);
        System.out.println("[success] generate new SQL named " + outputFilePathName);
        return outputFilePathName;
    }

    @Operation(summary = "执行预算SQL",description = "执行预算SQL")
    @GetMapping("/executeBudgetSQL")
    public JSONObject executeBudgetSQL(){
//        sqlService.executeBudgetSQL();

        return null;
    }

}
