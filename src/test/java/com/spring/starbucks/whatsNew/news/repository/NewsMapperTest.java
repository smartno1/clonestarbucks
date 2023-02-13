package com.spring.starbucks.whatsNew.news.repository;

import com.spring.starbucks.whatsNew.event.domain.Event;
import com.spring.starbucks.whatsNew.news.domain.News;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class NewsMapperTest {

    @Autowired
    NewsMapper newsMapper;


    @Test
    @DisplayName("게시물 100개를 입력한다")
    void insertTest() {

        News n = new News();
        n.setKind("card");
        n.setListImg("/images/whats_new/news/jfdklajfkdlasjf_n1.jpg");
        n.setContent("/images/whats_new/news/dddd_n1-1.png");

        for(int i = 0; i<20 ; i++){
            n.setTitle("이벤트"+i+"~~~~~~~~~~~~~~~~~~~~");
            newsMapper.insert(n);
        }


    }
}