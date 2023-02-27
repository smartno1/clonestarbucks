package com.spring.starbucks.whatsNew.notice.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter @Setter
@ToString
public class Notice {

    private int noticeId;
    private String title;
    private String content;
    private String linkTitle;
    private String link;
    private int viewCnt;
    private LocalDate regDate;
    private String attach;

    //custom
    int no;
    private String prettierRegDate;



}
