package com.yonyou.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.net.URLEncoder;

@Tag(name = "SQL脚本下载", description = "下载SQL脚本")
@RestController
public class SQLDownloadController {

    @Operation(summary = "下载SQL脚本",description = "下载SQL脚本")
    @GetMapping("/download")
    public void download(HttpServletResponse response) throws IOException {
        // 指定要下载的文件
        //File file = ResourceUtils.getFile("classpath:2.zip");
        File file = ResourceUtils.getFile("./SQL脚本/00_all/mergedFile_20241211_145528.sql");
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
}
