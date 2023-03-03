package com.spring.starbucks.whatsNew.notice.domain;

import lombok.*;

import java.time.LocalDate;

@Getter @Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
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
