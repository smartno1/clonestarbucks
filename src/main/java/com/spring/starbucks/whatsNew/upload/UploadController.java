package com.spring.starbucks.whatsNew.upload;

import com.spring.starbucks.util.FileUtils;
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
@RequestMapping("/whats_new")
@PropertySource("classpath:upLoadPath.properties")
public class UploadController {
    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    // 비동기 요청 파일 업로드 처리
    @PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<String> ajaxUpload(@RequestBody MultipartFile file, String type) throws NullPointerException{

        log.info("upload POST! - {}", file);

        // 폴더 생성
        String[] pathInfo = new String[5];
        pathInfo[0] = "img";
        switch (type) {
            case "event":
                pathInfo[1] = "whats_new";
                pathInfo[2] = "event";
                break;
            case "news":
                pathInfo[1] = "whats_new";
                pathInfo[2] = "news";
                break;
            case "notice":
                pathInfo[1] = "whats_new";
                pathInfo[2] = "notice";
                break;
        }

        // 클라이언트가 전송한 파일 업로드하기
        String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH, pathInfo);
        // 클라이언트에게 전송할 파일경로 리스트
        String fileName = fullPath;

        return new ResponseEntity<>(fileName, HttpStatus.OK);
    }

    @DeleteMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(@RequestBody String oldFileName) throws Exception {

        log.info(" DELETE File! oldFileName - {}",oldFileName);

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
