package com.spring.starbucks.whatsNew.news.domain;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class News {
    private int newsId;
    private String listImg;
    private String kind;
    private String title;
    private String content;
    private String attach;
    private LocalDate regDate;
    private String searchWord;
    private int no;

//    custom
    private String prettierRegDate;

}
