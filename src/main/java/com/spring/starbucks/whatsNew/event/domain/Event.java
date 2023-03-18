package com.spring.starbucks.whatsNew.event.domain;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Setter @Getter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Event {
    private int eventId;
    private String kind;
    private String title;
    private LocalDate beginDate;
    private LocalDate endDate;
    private String listImg;
    private String content;
    private String attach;
    private String searchWord;
    private LocalDateTime regDate;

    // custom
    private boolean ended;
    private String period;
    private String prettierTitle;
    private String beginDateStr;
    private String endDateStr;

}
