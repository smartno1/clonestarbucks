package com.spring.starbucks.menu.controller;


import com.spring.starbucks.menu.upload.FileUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;

@Controller
@Log4j2
@RequestMapping("/menu")
@PropertySource("classpath:upLoadPath.properties")
public class MenuUploadController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    // 비동기 요청 파일 업로드 처리
    @PostMapping("/ajax-upload")
    @ResponseBody
    public ResponseEntity<String> ajaxUpload(@RequestBody MultipartFile file) throws NullPointerException{

        log.info("/ajax-upload POST! - {}", file);

        // 클라이언트가 전송한 파일 업로드하기
        String fullPath = FileUtils.uploadFile(file, UPLOAD_PATH);
        // 클라이언트에게 전송할 파일경로 리스트
        String fileName = fullPath;

        return new ResponseEntity<>(fileName, HttpStatus.OK);
    }

    // 파일 데이터 로드 요청 처리
    /*
        비동기 통신 응답시 ResponseEntity를 쓰는 이유는
        이 객체는 응답 body정보 이외에도 header정보를 포함할 수 있고
        추가로 응답 상태코드도 제어할 수 있다.
     */
    @GetMapping("/loadFile")
    @ResponseBody
    // fileName = 변환된 파일명
    public ResponseEntity<byte[]> loadFile(String fileName) {

        log.info("/loadFile GET - {}", fileName);

        // 클라이언트가 요청하는 파일의 진짜 바이트 데이터를 갖다줘야 함.

        // 1. 요청 파일 찾아서 file객체로 포장
        File f = new File(UPLOAD_PATH + fileName);

        if (!f.exists()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // 2. 해당 파일을 InputStream을 통해 불러온다.
        try (FileInputStream fis = new FileInputStream(f)) {

            // 3. 클라이언트에게 순수 이미지를 응답해야 하므로 MIME TYPE을 응답헤더에 설정
            // ex) image/jpeg, image/png, image/gif
            // 확장자를 추출해야 함.
            String ext = FileUtils.getFileExtension(fileName);
            MediaType mediaType = FileUtils.getMediaType(ext);

            // 응답헤더에 미디어 타입 설정
            HttpHeaders headers = new HttpHeaders();

            if (mediaType != null) { // 이미지라면
                headers.setContentType(mediaType);
            } else { // 이미지가 아니면
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }

            // 4. 파일 순수데이터 바이트배열에 저장.
            byte[] rawData = IOUtils.toByteArray(fis);

            // 5. 비동기통신에서 데이터 응답할 때 ResponseEntity객체를 사용
            return new ResponseEntity<>(rawData, headers, HttpStatus.OK); // 클라이언트에 파일 데이터 응답

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //서버에 있는 파일 삭제 요청처리
    //URI: /deleteFile?fileName=/2019/09/22/s_djfksldfjs_abc.jpg
    @DeleteMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(@RequestBody String oldFileName) throws Exception {

        log.info("/menu/deleteFile DELETE! oldFileName - {}",oldFileName);

        if(oldFileName.equals("/images/logo.png")) {
            return new ResponseEntity<>("file is logo", HttpStatus.OK);
        }

        return FileUtils.deleteFile(oldFileName,UPLOAD_PATH);
    }

}
