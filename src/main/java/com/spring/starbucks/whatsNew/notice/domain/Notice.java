package com.spring.starbucks.whatsNew.notice.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter @Setter
@ToString
public class Notice {

    int noticeId;
    String title;
    String content;
    String linkTitle;
    String link;
    int viewCnt;
    LocalDate regDate;

    //custom
    int no;



}
