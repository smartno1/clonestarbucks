package com.spring.starbucks.whatsNew.news.controller;

import com.spring.starbucks.coffee.bean.upload.FileUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
@Log4j2
@RequestMapping("/whats_new/news")
@PropertySource("classpath:upLoadPath.properties")
public class NewsUploadController {
    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    // 비동기 요청 파일 업로드 처리
    @PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<String> ajaxUpload(@RequestBody MultipartFile file) throws NullPointerException{

        log.info("/whats_new/news/upload POST! - {}", file);

        String type = "news";
        // 클라이언트가 전송한 파일 업로드하기
        String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH, type);
        // 클라이언트에게 전송할 파일경로 리스트
        String fileName = fullPath;

        return new ResponseEntity<>(fileName, HttpStatus.OK);
    }

    @DeleteMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(@RequestBody String oldFileName) throws Exception {

        log.info("/whats_new/news/deleteFile DELETE! oldFileName - {}",oldFileName);

        String result = FileUtils.deleteFile(oldFileName,UPLOAD_PATH);
        if(result == "delete success") {
            return new ResponseEntity<>(result, HttpStatus.OK);
        }else if(result == "not found") {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else {
            return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
        }
    }
}
