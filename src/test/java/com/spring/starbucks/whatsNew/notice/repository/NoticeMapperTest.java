package com.spring.starbucks.whatsNew.notice.repository;

import com.spring.starbucks.whatsNew.notice.domain.Notice;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class NoticeMapperTest {

    @Autowired
    NoticeMapper noticeMapper;

    @Test
    void insertTest(){
        Notice nt = new Notice();


        for(int i=0 ; i<300; i++){
            nt.setTitle("제목"+i);
            nt.setContent("<p>내용"+i+"</p>");
            noticeMapper.insert(nt);
        }

    }

}